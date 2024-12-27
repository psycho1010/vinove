import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


const Color ombrePurpleStart = Color(0xFF6A1B9A); // Deep Purple
const Color ombrePurpleMid = Color(0xFF8E24AA); // Medium Purple
const Color ombrePurpleEnd = Color(0xFFD81B60); // Pinkish Purple
const Color ombreAccent = Color(0xFFF06292); // Light Purple-Pink Accent
const Color backgroundLight = Color(0xFFF3E5F5); // Very Light Purple for backgrounds
const Color textLight = Colors.white; // Light text
const Color textDark = Colors.black87;

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String name;

  MapScreen({ 
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location of $name',style: TextStyle(color: textLight),),
        backgroundColor:  ombrePurpleStart,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude), // Center map on the person's location
          initialZoom: 13.0,
          minZoom: 10.0,
          maxZoom: 18.0,
        ),

        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            // subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker( 
                point: LatLng(latitude, longitude),
                width: 40.0,
                height: 40.0,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}