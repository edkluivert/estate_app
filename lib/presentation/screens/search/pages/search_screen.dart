import 'dart:async';

import 'package:estate_app/presentation/screens/search/widgets/yellow_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> gController =
  Completer<GoogleMapController>();
  final Set<Marker> _markers = {};

  late String _mapStyleString;

  Future<void> _loadMapStyle() async {
    _mapStyleString = await rootBundle.loadString('assets/json/dark_map.json');
  }

  @override
  void initState() {
    super.initState();
    // Add sample markers
    _markers.addAll([
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(59.9311, 30.3609),
        infoWindow: InfoWindow(title: 'Location 1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(59.9411, 30.3709),
        infoWindow: InfoWindow(title: 'Location 2'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      // Add more markers as needed
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future : _loadMapStyle(),
            builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(59.9311, 30.3609),
          zoom: 12,
        ),
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        style: _mapStyleString,
        onMapCreated: (GoogleMapController controller) {
          gController.complete(controller);
        },
      );
    }else{
      return const Center(child: CircularProgressIndicator());
    }
            }
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.black),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: 'Saint Petersburg',
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 45,
                  height: 45,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.query_stats, color: Colors.black), // Assuming the query icon is 'query_stats'
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height/6,
            right: 30,
            child: ChatBubble(),
          ),
          Positioned(
            top: size.height/5,
            left: 30,
            child: ChatBubble(),
          ),
          Positioned(
            top: size.height/4,
            right: 30,
            child: ChatBubble(),
          ),
          Positioned(
            top: size.height/3,
            right: size.width/3,
            child: ChatBubble(),
          ),
          Positioned(
            top: size.height/2,
            right: size.width/4,
            child: ChatBubble(),
          ),
          Positioned(
            top: size.height/1.5,
            right: size.width/5,
            child: ChatBubble(),
          ),

          Positioned(
            bottom: size.height/3.9,
            left: size.width/10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.abc, color: Colors.white,),
              ),
            ),
          ),
          Positioned(
            bottom: size.height/5,
            left: size.width/10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: BoxShape.circle
              ),
              child: Center(child: Transform.rotate(
                  angle: -5.5,
                  child: Icon(Icons.navigation_outlined, color: Colors.white,))),
            ),
          ),
          Positioned(
            bottom: size.height/5,
            left: size.width/1.8,
            child: Container(

              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children : [
                    Icon(Icons.navigation_outlined, color: Colors.white,),
                    Text('List of variants', style : TextStyle(color : Colors.white))
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
