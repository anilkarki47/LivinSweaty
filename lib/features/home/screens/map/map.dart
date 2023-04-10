import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as LocationPlugin;

import 'gym_detail.dart';

class GymLocationsPage extends StatefulWidget {
  const GymLocationsPage({Key? key}) : super(key: key);

  @override
  _GymLocationsPageState createState() => _GymLocationsPageState();
}

class _GymLocationsPageState extends State<GymLocationsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Gyms'),
      ),
      body: _currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _nearbyGyms.isEmpty
              ? const Center(
                  child: Text('No nearby gyms found.'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _nearbyGyms.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final gym = _nearbyGyms[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GymDetailsPage(
                              gym: gym,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: gym.photos.isNotEmpty
                                ? Image.network(
                                    _places.buildPhotoUrl(
                                      maxWidth: 400,
                                      photoReference:
                                          gym.photos[0].photoReference,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image, size: 48),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            gym.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            gym.vicinity!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
