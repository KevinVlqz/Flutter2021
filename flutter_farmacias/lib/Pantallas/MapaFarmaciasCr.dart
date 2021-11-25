import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaFarm extends StatelessWidget {
  const MapaFarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaciaAPP',
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AppFarmacia();

            },),);
          },
        ),

      ),
       body:
       Container(
         decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage("assets/img/background.jpg",), fit: BoxFit.cover)),
            child: CuerpoAPP(context),
       )
        
    );
  }

  
}

Widget CuerpoAPP(BuildContext c){
  return ListView(
    
    
    children: <Widget>[
      SizedBox(
        height: 15,
      ),
      Encabezado(),
       SizedBox(
        height: 30,
      ),
      CuerpoMapa()
      
      //ListaFarmacias(),
 
    ],

  );
}

Widget Encabezado(){
  return Center(
    
    child: Text("Farmacias Cercanas",style: TextStyle(fontSize:30,color:Colors.white)),
  );
}



Widget CuerpoMapa(){
  return Container(
    height: 500.0,
    decoration: BoxDecoration(
      borderRadius: new BorderRadius.circular(30.0),
    ),
    child:  GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: LatLng(13.683016800337512,-89.26820061539786), //initial position
                      zoom: 15.0, //initial zoom level
                    ),
                     //markers to show on map
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) { //method called when map is created
                    },
                  ),
        
  );
  
}