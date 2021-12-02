import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/ContactoWhat.dart';

class detalleUnit extends StatefulWidget {
  final String ID;
  const detalleUnit({Key? key, required this.ID,}) : super(key: key);
  @override
  _detalleUnitState createState() => _detalleUnitState();
  
}
CollectionReference _productss =
      FirebaseFirestore.instance.collection('farmacias');

class _detalleUnitState  extends State<detalleUnit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          
          "Farmacia seleccionada"),
        
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/img/background.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: marcolistadoFarmacias (context),
          padding: const EdgeInsets.symmetric(vertical:220,horizontal: 75),
        ),
      ),
    );
  }

Widget marcolistadoFarmacias(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: 
    listadoFarmacias(context),

  );
}

Widget listadoFarmacias(context) {
  return Column(
    children: [
      Text(
            "Detalle de Farmacias",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, color: Colors.red[600], fontWeight: FontWeight.bold),
          ),
      SizedBox(
        height:MediaQuery.of(context).size.height/2.2,
        child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('farmacias').doc(widget.ID).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var documentSnapshot=snapshot.hasData;
            DocumentSnapshot? d=snapshot.data as DocumentSnapshot<Object?>?;
            return Column(
              children: [
                Card(
                  child:  Column(
                        children: [  
                   Text(
                     d!['nombreFarmacia'],textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
          ),      
          Divider(
            thickness: 5,
            height: 20,
            color: Colors.black26,
          ),

          Padding(padding: EdgeInsets.all(5)),
          Container(
              height: 300.0,
              width: 330.0,
              decoration: BoxDecoration(
                  color: Colors.yellow, //PARA PROBAR CONTAINER
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(d['foto']),
                    fit: BoxFit.cover,
                  )
                  )
                  ),
          Text(
            d['direccion'],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17, color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HorarioFarmacias(
                    phone: d['contacto'].toString(),
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
                    ),
              ],
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
 

}