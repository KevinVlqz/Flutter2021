import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaMarker extends StatefulWidget {
  final String nombre;
  
  final String lat;
  final String long;
  const MapaMarker({Key? key, required this.nombre, required this.lat, required this.long}) : super(key: key);



  @override
  _MapaMarkerState createState() => _MapaMarkerState();
  
}

class _MapaMarkerState  extends State<MapaMarker> {
   final Set<Marker> markers = new Set(); //markers for google map
   static const LatLng showLocation = const LatLng(13.6918437,-88.8629846); 
  //final _controller = HomeController();
 // String n=widget.nombre.toString();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          
          "Ubicacion de farmacia seleccionada"),
        
      ),
      body: GoogleMap( //Map widget from google_maps_flutter package
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    //onMapCreated: _controller.onMapCreated,
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: LatLng(double.parse(widget.lat),double.parse(widget.long)), //initial position
                      zoom: 12, //initial zoom level
                    ),
                    markers: getmarkers(), //markers to show on map
                    mapType: MapType.normal, //map type
                    
                  ),
    );
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(()  {
      
      markers.add(Marker(
         //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(double.parse(widget.lat), double.parse(widget.long)), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Farmacias Economicas',
          snippet: widget.nombre.toString(),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),//Icon for Marker
      ));

    });

    return markers;
  }

}