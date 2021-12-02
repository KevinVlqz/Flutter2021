import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';
import 'package:url_launcher/url_launcher.dart';

class HorarioFarmacias extends StatelessWidget {
  final String phone;
  const HorarioFarmacias({Key? key, required this.phone}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
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
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: whatsapp(phone),
        ),
      ),
    );
  }
}

Widget whatsapp(@required telefono) {
  return Column(children: <Widget>[
    Padding(padding: EdgeInsets.all(15)),
    Text(
      "Utiliza nuestros canales de contacto directo",
      style: TextStyle(
          fontSize: 30, color: Colors.red[600], fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    Padding(padding: EdgeInsets.all(10)),
    Text(
      "Puedes contactarnos por medio de whatsapp en nuestro siguientes horarios",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    Padding(padding: EdgeInsets.all(10)),
    Image.asset('assets/img/p1Ejercicio1.jpg'),
    Padding(padding: EdgeInsets.all(10)),
    RaisedButton(
        onPressed: () {
          abrirWha(
              numero: telefono,
              mensaje: "Hola Me gustaria ponerme en contacto con ustedes");
        },
        color: Color(0XFF229954),
        textColor: Colors.white,
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(Icons.textsms_sharp),
          Text(" Abrir Whatsapp"),
        ])),
    RaisedButton(
        onPressed: () {
          llamar(numero: telefono);
        },
        color: Color(0XFF3498DB),
        textColor: Colors.white,
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(Icons.add_ic_call),
          Text("            Llamar"),
          SizedBox(
            width: 10,
          ),
        ])),
  ]);
}

void abrirWha({@required numero, @required mensaje}) async {
  String url = "whatsapp://send?phone=$numero&text=$mensaje";

  await canLaunch(url) ? launch(url) : print("No se pudo abrir whatsapp");
}

void llamar({@required numero}) {
<<<<<<< HEAD
  launch("tel:$numero");
=======
  launch("tel://$numero");
>>>>>>> d9fbc57b5f4199032b34f1d2a9bdc0b6a84dfdf3
}
