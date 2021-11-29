import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/Registrar.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const LoginApp());
  });
  
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  
  final myController = TextEditingController();
  final pwd = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    
   
    
  }
  
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("usuarios");

  void  getUsuarios() async {
    int c=0;

  QuerySnapshot usuarios = await collectionReference.get();
  int x=usuarios.docs.length;
  if (usuarios.docs.length != 0) {
    for (var documentos in usuarios.docs) {
      //documentos["correo"];
      if(myController.text==documentos["correo"]&& pwd.text==documentos["password"]){
        print(documentos["correo"]);
        Navigator.push(context, MaterialPageRoute(builder: (context){
              return AppFarmacia();

            },),);
      }
      else{
        c=c+1;
      }
      //user.add(documentos.data());
    }
    if(c==x){
      showDialog(context: context, 
       barrierDismissible: false, 
       builder: (BuildContext context){
         return DialogAlert('Error de Ingreso: Verifique sus datos');
       }
       );

    }
    
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: cuerpoApp(context),
    );
  }

 

  Widget cuerpoApp(context) {
  return Container(
    width:MediaQuery.of(context).size.width,
    decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage("assets/img/background.jpg",), fit: BoxFit.cover)),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        mensaje(),
        SizedBox(
          height: 20,
        ),
        campoCorreo(),
        campoPassword(),
        SizedBox(
          height: 20,
        ),
        botonIngresar(context),
        SizedBox(
          height: 20,
        ),
        botonRegistrarse(context)
      ],
    )),
  );
}
  Widget campoCorreo() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: TextField(
      controller: myController ,
      decoration: InputDecoration(
          hintText: "Correo",
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

Widget botonIngresar(context) {
  return FlatButton(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    color: Colors.blueAccent,
    onPressed: () {
      getUsuarios();
       /* Navigator.push(context, MaterialPageRoute(builder: (context){
              return AppFarmacia();

            },),);
        */
        
    },
    child: Text(
      "Ingresar",
      style: TextStyle(fontSize: 15, color: Colors.white),
    ),
    shape: RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.blue, width: 0.5, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(50)),
  );
}
}







Widget botonRegistrarse(context) {
  return FlatButton(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    color: Colors.red[700],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
              return RegistrarApp();

            },),);
    },
    child: Text(
      "Registrarse",
      style: TextStyle(fontSize: 15, color: Colors.white),
    ),
    shape: RoundedRectangleBorder(
        side:
            BorderSide(color: Colors.blue, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(50)),
  );
}

Widget mensaje() {
  return Text(
    "Login ",
    style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold,)
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