import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController _mapController;
  List<Marker> _markers = [];
  bool showmaps = true ;

@override
  void initState(){
    super.initState();
    _markers.add(Marker(
      markerId: MarkerId('mylocation'),
      position: LatLng(36.8219, 1.2921),
    ));
        if (_markers.isNotEmpty){
      setState(() {
        showmaps = true ;
      });
  }
    }


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: showmaps ?  
      Container
      (
        height: 300,
        width: 1200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              _mapController = controller;
            });
            },
            markers: Set<Marker>.of(_markers),
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(1.2921, 36.8219),
              zoom: 13
              ),
              ),
        
      
    )
    : CircularProgressIndicator(
      color: Colors.white,
    ));
  }
}