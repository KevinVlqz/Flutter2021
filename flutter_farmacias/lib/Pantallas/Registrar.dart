import 'package:flutter/material.dart';
import 'package:flutter_farmacias/main.dart';


class RegistrarApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
        leading: IconButton(
          icon: Icon(Icons.person_pin),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return LoginApp();

            },),);
          },
        ),

      ),
      body: cuerpoApp(),
    );
  }
}

Widget cuerpoApp() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/background.jpg"), fit: BoxFit.cover)),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        mensaje(),
        SizedBox(
          height: 20,
        ),
        nombre(),
        campoCorreo(),
        campoPassword(),
        SizedBox(
          height: 20,
        ),
        botonIngresar(),
        SizedBox(
          height: 20,
        ),
      ],
    )),
  );
}

Widget campoCorreo() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Correo",
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.people)),
    ),
  );
}
Widget nombre() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Nombre",
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.people)),
    ),
  );
}

Widget campoPassword() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contraseña",
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.password)),
    ),
  );
}

Widget botonIngresar() {
  return FlatButton(
    padding: EdgeInsets.symmetric(horizontal: 175, vertical: 15),
    color: Colors.blueAccent,
    onPressed: () {},
    child: Text(
      "Ingresar",
      style: TextStyle(fontSize: 22, color: Colors.white),
    ),
    shape: RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.blue, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(50)),
  );
}



Widget mensaje() {
  return Text(
    "Ingrese",
    style: TextStyle(color: Colors.white, fontSize: 30),
  );
}
