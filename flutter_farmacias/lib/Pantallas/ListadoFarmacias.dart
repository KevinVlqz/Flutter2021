import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/lstfarm.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';

class ListFarmC extends StatelessWidget {
  const ListFarmC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

CollectionReference _productss =
      FirebaseFirestore.instance.collection('farmacias');
class _MenuState extends State<Menu> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Listado de Farmacias"),
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
            child: Column(
              
              children: [
                Encabezado(),
                 Container(
                height: 101.0,
                width: 520.0,
                decoration: BoxDecoration(
             
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/logofarm.png'),
                fit: BoxFit.cover,
              ))),
                CuerpoAPP(context),
              ],
            )
            
            
       )
        
    );
  }

  
}

Widget CuerpoAPP(BuildContext c){
  return SizedBox(
height: MediaQuery.of(c).size.height/1.6,

child: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
            
                  child: 
                  ListTile(
                    title: Text(documentSnapshot['nombreFarmacia']),
                    subtitle: Text(documentSnapshot['direccion'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Container(
                            child: IconButton(
                            icon: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                            onPressed: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context){
                                String n=documentSnapshot['nombreFarmacia'].toString();
                                String la=documentSnapshot['latitud'].toString();
                                String lo=documentSnapshot['longitud'].toString();
                                return MapaMarker(nombre: n, lat:la,long: lo);
                              }
                              )
                              );
                            },
                          ),
                            
                          ),Container(

                            child: IconButton(
                            icon: Icon(Icons.favorite,color: Colors.red,size: 30,),
                            onPressed: () {
                              
                            },
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
  );
}

Widget Encabezado(){
  return Center(
    
    child: Text("Listado de Farmacias",style: TextStyle(fontSize:30,color:Colors.white)),
  );
}

 


