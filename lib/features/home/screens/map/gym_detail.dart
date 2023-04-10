import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_webservice/places.dart';
// import 'package:maps_launcher/maps_launcher.dart';

class GymDetailsPage extends StatelessWidget {
  final PlacesSearchResult gym;

  const GymDetailsPage({Key? key, required this.gym}) : super(key: key);

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
                ? SizedBox(
                    height: 200,
                    child: SizedBox(
                      height: 200,
                      child: CarouselSlider.builder(
                        itemCount: gym.photos.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          final photo = gym.photos[index];
                          return Image.network(
                            GoogleMapsPlaces(
                              apiKey: 'AIzaSyB1HHLk0HBCzg-zQ5r-oTtoNncZ0kEze8I',
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
                      const SizedBox(width: 8),
                      Text(
                        gym.rating?.toString() ?? 'N/A',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    gym.types.first,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    gym.vicinity!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae eros justo. Vivamus ut semper quam. Pellentesque malesuada aliquet justo, id elementum nisl aliquet non. Nullam eu faucibus nisl. In hac habitasse platea dictumst. Ut et tellus vel nisi malesuada sodales sed non quam.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
