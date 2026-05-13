import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() async {
      final Stopwatch watch1 = Stopwatch()..start();
      final position = await _determinePosition();
      print('location ${watch1.elapsed}');

      final mapController = await _mapCompleter.future;
      print('location ${watch1.elapsed}');

      mapController.moveCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
      );
    });
  }

  final Completer<GoogleMapController> _mapCompleter = Completer();

  CameraPosition initialCamera = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
    tilt: 50,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => _mapCompleter.complete(controller),
            mapId: 'my-map-id',
            markerType: GoogleMapMarkerType.advancedMarker,
            initialCameraPosition: initialCamera,
            circles: {
              Circle(
                circleId: CircleId('id-1'),
                center: LatLng(37.42796133580664, -122.085749655962),
                radius: 100,
              ),
            },
            markers: {
              Marker(
                markerId: MarkerId('marker-1'),
                position: LatLng(37.42796133580664, -122.085749655962),
              ),
            },
          ),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: .symmetric(horizontal: 20),
              child: Slider(value: 0.5, onChanged: (_) {}),
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
