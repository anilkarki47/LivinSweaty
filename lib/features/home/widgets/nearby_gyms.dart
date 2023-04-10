import 'package:flutter/material.dart';
import 'package:geodesy/geodesy.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:livin_sweaty/common/widgets/loader.dart';
import 'package:location/location.dart' as LocationPlugin;

import '../../../constants/global_variables.dart';

class NearbyGyms extends StatefulWidget {
  const NearbyGyms({super.key});

  @override
  State<NearbyGyms> createState() => _NearbyGymsState();
}

class _NearbyGymsState extends State<NearbyGyms> {
  final _places = GoogleMapsPlaces(
    apiKey: 'AIzaSyB1HHLk0HBCzg-zQ5r-oTtoNncZ0kEze8I',
  );

  LocationPlugin.LocationData? _currentLocation;
  List<PlacesSearchResult> _nearbyGyms = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _places.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final location = LocationPlugin.Location();
    try {
      final currentLocation = await location.getLocation();
      setState(() {
        _currentLocation = currentLocation;
      });
      await _searchNearbyGyms();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _searchNearbyGyms() async {
    if (_currentLocation == null) return;
    final response = await _places.searchNearbyWithRadius(
      Location(
          lat: _currentLocation!.latitude!, lng: _currentLocation!.longitude!),
      5000,
      type: "gym",
    );
    setState(() {
      _nearbyGyms = response.results;
    });
  }

  String _getDistance(double lat1, double lon1, double lat2, double lon2) {
    final distance = Geodesy().distanceBetweenTwoGeoPoints(
      LatLng(lat1, lon1),
      LatLng(lat2, lon2),
    );
    return '${(distance / 1000.0).toStringAsFixed(1)} km';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: 200,
        child: _currentLocation == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _nearbyGyms.isEmpty
                ? const Loader()
                : GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _nearbyGyms.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: size.width / 30,
                    ),
                    itemBuilder: (context, index) {
                      final gym = _nearbyGyms[index];
                      final gymLocation = gym.geometry?.location;
                      final distance = gymLocation != null
                          ? _getDistance(
                              _currentLocation!.latitude!,
                              _currentLocation!.longitude!,
                              gymLocation.lat,
                              gymLocation.lng)
                          : '';
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => GymDetailsPage(
                          //       gym: gym,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 200,
                              child: gym.photos.isNotEmpty
                                  ? Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                _places.buildPhotoUrl(
                                                  maxWidth: 400,
                                                  photoReference: gym
                                                      .photos[0].photoReference,
                                                ),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: GlobalVariables.midBlackGrey,
                                          ),
                                        ),
                                        Positioned(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, top: 8),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0.8),
                                                        Colors.black
                                                            .withOpacity(0),
                                                      ],
                                                      begin: const Alignment(
                                                          0, 0.9),
                                                      end: const Alignment(
                                                          0, -1),
                                                    ),
                                                  ),
                                                  height: size.width / 5,
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: size.width / 25,
                                                      ),
                                                      Text(
                                                        gym.name,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                size.width / 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(height: 3),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons.location_on,
                                                              size: size.width /
                                                                  30,
                                                              color:
                                                                  Colors.white),
                                                          const SizedBox(
                                                              width: 5),
                                                          Text(
                                                            distance,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    size.width /
                                                                        33,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Icon(Icons.image, size: 48),
                            ),
                          ],
                        ),
                      );
                    },
                  ));
  }
}
