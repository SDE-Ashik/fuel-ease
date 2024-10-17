import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController _mapController;
  LatLng _initialLocation =
      LatLng(37.7749, -122.4194); // Default: San Francisco
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Fetch Current Location
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      _initialLocation = LatLng(position.latitude, position.longitude);
    });

    // Move the map to current location
    _mapController.animateCamera(CameraUpdate.newLatLng(_initialLocation));
  }

  // Map created callback
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  // Handle tap on map to change location
  void _onMapTapped(LatLng newPosition) {
    setState(() {
      _initialLocation = newPosition;
    });
    _mapController.animateCamera(CameraUpdate.newLatLng(newPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps in Flutter'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialLocation,
          zoom: 14,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: _onMapTapped, // Change location on tap
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: GoogleMapScreen(),
    ));
