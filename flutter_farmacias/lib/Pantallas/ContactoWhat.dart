import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';



class contwhat extends StatelessWidget {
  const contwhat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Filas y Columnas", home: Center(child: HorarioFarmacias()));
  }
}

class HorarioFarmacias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AppFarmacia();

            },),);
          },
        ),

      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
             image: DecorationImage(
            image: AssetImage("assets/img/background.jpg",), fit: BoxFit.cover)),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: whatsapp(),
        ),
      ),
    );
  }
}

Widget whatsapp() {
  return Column(children: <Widget>[
    Padding(padding: EdgeInsets.all(30)),
    Text(
      "Contacto por whatsapp",
      style: TextStyle(
          fontSize: 30, color: Colors.red[600], fontWeight: FontWeight.bold),
    ),
    Padding(padding: EdgeInsets.all(30)),
    Text(
      "Puedes contactarnos por medio de whatsapp en nuestro siguientes horarios",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Image.asset('assets/img/p1Ejercicio1.jpg'),
    Padding(padding: EdgeInsets.all(30)),
    RaisedButton(
        onPressed: () {},
        color: Colors.green,
        textColor: Colors.white,
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(Icons.quickreply_outlined),
          Text("   Abrir Whatsapp"),
          SizedBox(
            width: 10,
          ),
        ]))
  ]);
}
