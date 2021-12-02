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
<<<<<<< HEAD
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
     
      
       
     
     
=======
        "Detalle de Farmacias",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30, color: Colors.red[600], fontWeight: FontWeight.bold),
      ),
      Divider(
        thickness: 5,
        height: 20,
        color: Colors.black26,
      ),
      Text(
        'Centro Comercial "El Encuentro"',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEelencuentro.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Plaza Comercial El Encuentro, locales 13 y 14, Lourdes Colon, Departamento de La Libertad.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50371674258',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      ////////////////////////////////////////////////////////////////////////
      Text(
        'Centro Comercial "Unicentro"',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEunicentro.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Centro Comercial Unicentro Lourdes local 6 “E “, carretera a Santa Ana, La Libertad.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50379794212',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      //////////////////////////////////////////
      Text(
        'Quezaltepeque',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEquezaltepeque.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Avenida 3 de Mayo y 3ra. Calle Pte. # 21 Quezaltepeque, La Libertad.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50372485834',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      /////////////////////////////
      Text(
        'Lourdes Centro',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FElourdescentro.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        '4a calle oriente, número 1-15, local # 2, contiguo a Banco Agrícola, Lourdes, Colon, La Libertad, contiguo a Ferretería Sumersa y antes de llegar al Selectos.. ',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50363106786',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      ///////////////////////////////////////
      Text(
        'Centro Comercial "Metrocentro"',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEmetrocentro.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Local 89, Cuarta Etapa Centro Comercial Metrocentro, San Salvador.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50377395980',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      ////////////////////////////////////////
      Text(
        'Centro Comercial "Metrocentro Santa Ana"',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEmetrocentrosantaana.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Centro Comercial Metrocentro Santa Ana, local 103-B Ciudad y Depto. Santa Ana',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50377235355',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      ///////////////////////////////////
      Text(
        'Merliot',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEmerliot.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Centro comercial Plaza Merliot local 207, nivel 2 Ciudad Merliot, Santa Tecla La Libertad.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50371674258',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      Text(
        'Santa Tecla',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEsantatecla.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Segunda Calle Oriente y Primera Av. Sur No. 2-1 Local 3 Santa Tecla, La Libertad.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50379794212',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      Text(
        'Colonia Quezaltepeque',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEcoloniaquezaltepeque.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Calle Real, # 72-A, Col. Quezaltepec, Santa Tecla, La Libertad',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50379794212',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      Text(
        'Santa Ana Centro',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Container(
          height: 140.0,
          width: 330.0,
          decoration: BoxDecoration(
              color: Colors.yellow, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/img/FEsantaana.png'),
                fit: BoxFit.cover,
              ))),
      Text(
        'Avenida Independencia Sur # 1-B, entre 5ª y 7ª Calle Pte, esquina, Santa Ana, Santa Ana.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
      RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HorarioFarmacias(
                phone: '50363106786',
              );
            }));
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
      Divider(
        thickness: 2,
        height: 20,
        color: Colors.black54,
      ),
      Text(
        'Final - Listado de Farmacias',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
      )
>>>>>>> d9fbc57b5f4199032b34f1d2a9bdc0b6a84dfdf3
    ],
  );
}

