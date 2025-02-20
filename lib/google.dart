import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? _mapController;
  final List<Marker> _markers = [
    const Marker(
      markerId: MarkerId('mylocation'),
      position: LatLng(-1.286389, 36.817223), // Nairobi, Kenya
      infoWindow: InfoWindow(title: 'My Location'),
    ),
  ];

  bool _isMapReady = false;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
      _isMapReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: _isMapReady
          ? Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.terrain,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-1.286389, 36.817223),
                    zoom: 13,
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
    );
  }
}

