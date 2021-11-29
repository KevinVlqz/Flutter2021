import 'package:cloud_firestore/cloud_firestore.dart';
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
  final controllerNombre = TextEditingController();
  final correo = TextEditingController();
  final pwd = TextEditingController();
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("usuarios");


  void InsertarUsuario() async {
  if(controllerNombre.text =="" || correo.text=="" || pwd.text==""){
    controllerNombre.text="";
    correo.text="";
    pwd.text="";
    showDialog(context: context, 
       barrierDismissible: false, 
       builder: (BuildContext context){
         return DialogAlert('Error al registrar: Verifique sus datos');
       }
       );
  }else{
     return collectionReference
      .add({
        'nombre':controllerNombre.text.toString(),
        'correo': correo.text.toString(),
         'password':pwd.text,

      })

      .then((value) => Navigator.push(context, MaterialPageRoute(builder: (context){
              return LoginApp();

            },),))
      .catchError((error) => print("Fallo en insertar registro:$error"));
  }
 
}


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
      body: cuerpoApp(context),
    );
  }
  
Widget cuerpoApp(BuildContext context) {
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
      controller: correo,
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
      controller: controllerNombre,
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
      controller: pwd,
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
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    color: Colors.blueAccent,
    onPressed: () {InsertarUsuario();},
    child: Text(
      "Registarse",
      style: TextStyle(fontSize: 22, color: Colors.white),
    ),
    shape: RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.blue, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(50)),
  );
}

}





Widget mensaje() {
  return Text(
    "Ingrese sus datos",
    style: TextStyle(color: Colors.white, fontSize: 30),
  );
}


class DialogAlert extends StatelessWidget {
  final title;
  DialogAlert(this.title);
  @override
  Widget build(BuildContext context) {
    return Dialog(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    child: Container(
      color: Colors.white70,
      height: 200,
      child: Column(
        children: [
          Expanded(child: Container(
            color: Colors.white70,
            child: Icon(Icons.account_circle, size: 60, color: Colors.deepPurple,),
          ),),
          Expanded(child: Container(
            color: Colors.deepPurpleAccent,
            child: SizedBox.expand(
              child: Padding(padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Text(title, style: TextStyle(color: Colors.white),),
                RaisedButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                color: Colors.white, child: Text('Aceptar'),)
              ],),),
            ),
          ),)
        ],
      ),
    ),
    );
  }
}