import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps/functions.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? _currentAddress;
  Position? _currentPosition;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    _currentPosition = await LocationHandler.getCurrentPosition();
    _currentAddress = await LocationHandler.getAddressFromLatLng(
      _currentPosition!,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? "Loading..."}'),
              Text('LNG: ${_currentPosition?.longitude ?? "Loading..."}'),
              Text('ADDRESS: ${_currentAddress ?? "Loading..."}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: getLocation,
                child: const Text("Get Current Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
