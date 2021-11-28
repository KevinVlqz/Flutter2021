import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';


class MapaFarm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
CollectionReference _productss =
      FirebaseFirestore.instance.collection('farmacias');

      final Set<Marker> markers = new Set(); //markers for google map
class _HomeState extends State<Home> {
  

  @override
  void initState() {
    super.initState();
    myCurrentLocation();
  }
  late LocationData currentLocation;
 var location = new Location();

 myCurrentLocation() async{
   try {
      currentLocation = await location.getLocation();
      print("locationLatitude: ${currentLocation.latitude.toString()}");
      print("locationLongitude: ${currentLocation.longitude.toString()}");
   } on Exception  catch (e) {
   if (e.toString() == 'PERMISSION_DENIED') {
      String error = 'Permission denied';
      print(error);
   }
   //currentLocation = Null;
}}
  late GoogleMapController mapController; //contrller for Google map
  
  static const LatLng showLocation = const LatLng(13.6947966,-89.2352129); //location to show in map
  
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar( 
             title: Text("Farmacias registradas"),
             leading: IconButton(
               icon: Icon(Icons.arrow_back),
               onPressed: (){
                 Navigator.push(context, 
                              MaterialPageRoute(builder: (context){
                                return AppFarmacia();
                              }
                              )
                              );
               },
             ),
          ),
          body: GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: showLocation, //initial position
                      zoom: 12.0, //initial zoom level
                    ),
                    markers: getmarkers(), //markers to show on map
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) { //method called when map is created
                      setState(() {
                        mapController = controller; 
                      });
                    },
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                  ),
       );
  }
  

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      FirebaseFirestore.instance.collection('farmacias').get().then((value) {
        for(int i=0;i<=value.docs.length; ++i){
              //DocumentSnapshot documentSnapshot = value.docs[i];
              markers.add(Marker( //add third marker
              markerId: MarkerId(showLocation.toString()+i.toString()),
              position: LatLng(double.parse(value.docs[i]['latitud']), double.parse(value.docs[i]['longitud'])), //position of marker
              infoWindow: InfoWindow( //popup info 
                title: 'Farmacias Economicas',
                snippet: value.docs[i]['nombreFarmacia'],
              ),
              icon: BitmapDescriptor.defaultMarker, //Icon for Marker
            ));
            }
      });
    }
    );

    return markers;
  }
}

