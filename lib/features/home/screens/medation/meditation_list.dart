import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/home/screens/medation/widgets/audio_file.dart';
import 'package:livin_sweaty/models/meditation.dart';
import '../../../../../common/widgets/loader.dart';
import '../../../../../constants/global_variables.dart';
import '../../../auth/widgets/app_text.dart';
import '../../services/home_services.dart';

class MeditationListScreen extends StatefulWidget {
  // static const String routeName = '/workout-category';

  const MeditationListScreen({
    super.key,
  });

  @override
  State<MeditationListScreen> createState() => _MeditationListScreenState();
}

class _MeditationListScreenState extends State<MeditationListScreen> {
  List<Meditation>? meditationList;
  final AllMeditaionServices meditationServices = AllMeditaionServices();

  @override
  void initState() {
    super.initState();
    fetchAllMeditations();
  }

  fetchAllMeditations() async {
    meditationList = await meditationServices.fetchAllMeditations(context);
    setState(() {});
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: meditationList == null
          ? const Loader()
          : CustomScrollView(
              slivers: [
                // Appbar work here!
                const SliverAppBar(
                  expandedHeight: 180,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      "Meditation",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    expandedTitleScale: 1.6,
                    centerTitle: false,
                    collapseMode: CollapseMode.parallax,
                    background: Image(
                        image: AssetImage(
                          'assets/images/meditation.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),

                // Item List work here!
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final meditation = meditationList![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AudioFile(
                                meditations: meditationList!,
                                imgUrls: GlobalVariables.medationImage[index]
                                    ['image']!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            // color: GlobalVariables.lightGrey,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              height: 130,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: GlobalVariables.lightGrey,
                                    ),
                                    height: double.infinity,
                                    width: 110,
                                    child: Image.network(
                                      GlobalVariables.medationImage[index]
                                          ['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AppText(
                                          text: meditation.name,
                                          fontWeight: FontWeight.w900,
                                          color: GlobalVariables.mainBlack),
                                      AppText(
                                          text: meditation.artist,
                                          fontWeight: FontWeight.w500,
                                          color: GlobalVariables.midBlackGrey),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.adjust,
                                            size: 20,
                                            color: GlobalVariables.midBlackGrey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          AppText(
                                              text: meditation.duration,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  GlobalVariables.midBlackGrey),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: meditationList!.length,
                  ),
                ),
              ],
            ),
    );
  }
}
