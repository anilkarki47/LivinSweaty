import 'package:flutter/material.dart';
import 'package:livin_sweaty/models/user.dart';

import '../../../../../common/widgets/loader.dart';
import '../../../services/admin_services.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({
    Key? key,
  }) : super(key: key);

  @override
  State<ManageUser> createState() => ManageUserState();
}

class ManageUserState extends State<ManageUser> {
  List<User>? users;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  fetchAllUsers() async {
    users = await adminServices.fetchAllUsers(context);
    setState(() {});
  }

  void deleteUser(User user, int index) {
    adminServices.deleteUser(
      context: context,
      user: user,
      onSuccess: () {
        users!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 16;
    print(users!.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Users"),
      ),
      body: users == null
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final user = users![index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: user.name,
                                    style: TextStyle(
                                      fontSize: textSize,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: user.email,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        user.type,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => print("deleted"),
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.grey.shade300,
                              ),
                              child: Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 0,
                    );
                  },
                  itemCount: users!.length),
            ),
    );
  }
}
