import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/ContactoWhat.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';

class detallefm extends StatelessWidget {
 
  const detallefm({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Filas y Columnas",
        home: Center(
            child:
                Farmacias() //HorarioFarmacias(), (Farmacias() Es para la pantalla 1)
            ));
  }
}
 CollectionReference _productss =
      FirebaseFirestore.instance.collection('farmacias');
class Farmacias extends StatelessWidget {
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de Farmacias"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AppFarmacia();
                },
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/img/background.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: marcolistadoFarmacias(context),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        ),
      ),
    );
  }

}

Widget marcolistadoFarmacias(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: 
    listadoFarmacias(context),
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(15),
  );
}

Widget listadoFarmacias(context) {
  return Column(
    children: [
      Text(
            "Detalle de Farmacias",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.red[600], fontWeight: FontWeight.bold),
          ),
      SizedBox(
        height:MediaQuery.of(context).size.height/1.3,
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
                return 
                
                Card(
            
                  child:  Column(
                        children: [
                   Text(documentSnapshot['nombreFarmacia'],textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
          ),      
          Divider(
            thickness: 5,
            height: 20,
            color: Colors.black26,
          ),

          Padding(padding: EdgeInsets.all(5)),
          Container(
              height: 140.0,
              width: 330.0,
              decoration: BoxDecoration(
                  color: Colors.yellow, //PARA PROBAR CONTAINER
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(documentSnapshot['foto']),
                    fit: BoxFit.cover,
                  )
                  )
                  ),
          Text(
            documentSnapshot['direccion'],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HorarioFarmacias(
                    phone: documentSnapshot['contacto'].toString(),
                  );
                }));
                //'50371674258',
              },
              color: Colors.red[300],
              textColor: Colors.white,
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(Icons.call),
                Text("   Contacto"),
                SizedBox(
                  width: 10,
                ),
              ])),
                            
                            ],
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
          ),
     
      
       
     
     
    ],
  );
}

