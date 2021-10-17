import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/DetalleFarm.dart';
import 'package:flutter_farmacias/Pantallas/ListadoFarmacias.dart';
import 'package:flutter_farmacias/Pantallas/MapaFarmaciasCr.dart';
import 'package:flutter_farmacias/Pantallas/Registrar.dart';


class AppFarmacia extends StatelessWidget {
  const AppFarmacia({Key? key}) : super(key: key);

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
      
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: Text("Menu"),
        
        
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
      Fila1(c),
      Fila2(c),
    ],

  );
}

Widget Encabezado(){
  return Center(
    
    child: Text("Menu FarmApp",style: TextStyle(fontSize:35,color:Colors.white)),
  );
}

Widget Fila1(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
     width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(30),
      

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.deepOrange.shade200,
        child: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                
                onTap: (){
                  
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return MapaFarm();
                  }
                  
                  )
                  );
                },
              child: Ink.image(
                image: AssetImage('assets/img/imgmapacercano.png'),
                 height: 250,
                width: MediaQuery.of(context).size.width/3,
              ),
                ),
              Text("Farmacias Cercanas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
            ],
          ),
          
        ),


      ),
    ),
    Container(
      //height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(30),
      

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.deepOrange.shade200,
        child: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                
                onTap: (){
                  
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return ListFarmC();
                  }
                  
                  )
                  );
                },
              child: Ink.image(
                image: AssetImage('assets/img/imglista.png'),
                 height: 250,
                width: MediaQuery.of(context).size.width/3,
              ),
                ),

              //Image.asset('assets/img/imglista.png'),
              Text("Listado de Farmacias",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
            ],
          ),
        ),


      ),
    ),
    
    ],

  );
  
  
}


Widget Fila2(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(30),
      

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.deepOrange.shade200,
        child: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                
                onTap: (){
                  
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return detallefm();
                  }
                  
                  )
                  );
                },
              child: Ink.image(
                image: AssetImage('assets/img/imgfav.png'),
                 height: 250,
                width: MediaQuery.of(context).size.width/3,
              ),
                ),
              //Image.asset('assets/img/imgfav.png'),
              Text("Favoritos",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
            ],
          ),
        ),


      ),
    ),
    Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(30),
      

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.deepOrange.shade200,
        child: Center(
          child: Column(
            children: <Widget>[
              InkWell(
                
                onTap: (){
                  
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return ListFarmC();
                  }
                  
                  )
                  );
                },
              child: Ink.image(
                image: AssetImage('assets/img/imguser.png'),
                 height: 250,
                width: MediaQuery.of(context).size.width/3,
              ),
                ),
              //Image.asset('assets/img/imguser.png'),
              Text("Mis datos",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
            ],
          ),
        ),


      ),
    ),
    
    ],

  );
  
  
  
}