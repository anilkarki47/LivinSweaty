import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';

class GymDetailsPage extends StatelessWidget {
  final PlacesSearchResult gym;
  final LatLng gymLocation;

  GymDetailsPage({Key? key, required this.gym})
      : gymLocation = LatLng(
          gym.geometry!.location.lat,
          gym.geometry!.location.lng,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(gym.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Show carousel of gym photos
              gym.photos.isNotEmpty
                  ? Container(
                      height: 300,
                      color: GlobalVariables.lightGrey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          height: 300,
                          child: CarouselSlider.builder(
                            itemCount: gym.photos.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              final photo = gym.photos[index];
                              return Image.network(
                                GoogleMapsPlaces(
                                  apiKey:
                                      'AIzaSyB1HHLk0HBCzg-zQ5r-oTtoNncZ0kEze8I',
                                ).buildPhotoUrl(
                                  maxWidth: 1200,
                                  maxHeight: 800,
                                  photoReference: photo.photoReference,
                                ),
                                fit: BoxFit.cover,
                              );
                            },
                            options: CarouselOptions(
                              height: 300,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 3 / 2,
                              viewportFraction: 0.8,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              // Show gym name, rating and description
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gym.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          gym.rating?.toString() ?? 'N/A',
                          style: const TextStyle(
                            color: GlobalVariables.lightGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: GlobalVariables.lightGrey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          gym.vicinity!,
                          style: const TextStyle(
                            color: GlobalVariables.lightGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Show button to open gym location in Google Maps
                    ElevatedButton(
                      onPressed: () {
                        // ignore: deprecated_member_use
                        launch(
                          'https://www.google.com/maps/search/?api=1&query=${gymLocation.latitude},${gymLocation.longitude}',
                        );
                      },
                      child: const Text("Navigate to Gym"),
                    ),
                    // Show gym location on Google Maps
                    SizedBox(
                      height: 300,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: gymLocation,
                          zoom: 15,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId(gym.placeId),
                            position: gymLocation,
                            infoWindow: InfoWindow(
                              title: gym.name,
                              snippet: gym.vicinity,
                            ),
                          ),
                        },
                        onMapCreated: (GoogleMapController controller) {
                          controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: gymLocation,
                                zoom: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
