import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final Set<Marker> markers = new Set(); //markers for google map
   static const LatLng showLocation = const LatLng(13.5026793,-87.9485847); 
  final _controller = HomeController();

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telollevo SV"),
        leading: Image.asset('assets/ico/ico1.png'),
      ),
      body: GoogleMap( //Map widget from google_maps_flutter package
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    onMapCreated: _controller.onMapCreated,
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: showLocation, //initial position
                      zoom: 10.0, //initial zoom level
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
        position: LatLng(13.344381265232641, -88.44051403133818), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Telollevo SV',
          snippet: 'Telollevo SV - Usulutan, Sucursal ubicada en el centro de Usulutan dedicado a almacenar sitios Web',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),//Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(13.483964799745896, -88.17529057247077), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Telollevo SV',
          snippet: 'Telollevo SV - San Miguel, Sucursal ubicada en el centro de San Miguel dedicado a almacenar sitios Web',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(13.695935502898397, -88.10186003683454), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Telollevo SV',
          snippet: 'Telollevo SV - Morazan, Sucursal ubicada en el centro de Morazan dedicado a almacenar sitios Web',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

       markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(13.33500443631516, -87.849153624566), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Telollevo SV',
          snippet: 'Telollevo SV - La Union, Sucursal ubicada en el centro de La Union dedicado a almacenar sitios Web',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta), //Icon for Marker
      ));
    });

    return markers;
  }


}
