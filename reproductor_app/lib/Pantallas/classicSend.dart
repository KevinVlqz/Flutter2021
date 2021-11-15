import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reproductor_app/Pantallas/descripcionArt.dart';
import 'package:reproductor_app/Pantallas/lista.dart';
import 'package:reproductor_app/Pantallas/popular.dart';
import 'package:reproductor_app/main.dart';


class DetailScreenSendPop extends StatelessWidget {
  


  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
         decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage("assets/img/fondo.jpg",), fit: BoxFit.cover)),
            child:  Column(
              children: <Widget>[
                
               Column(
        children: [
          Container(
              width: 1900,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GestureDetector(
                  child: Container(
                    width: double.maxFinite,
                    
                    child: Hero(
                      tag: 'imageHero',
                      child:ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: MediaQuery.of(context).size.width,
              height: 700,
              image: AssetImage('assets/img/timbend.jpg'),
              fit: BoxFit.cover,
            ),
          ),
                    ),
                    
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                )
              ),
              
              

              Text("Nur Noch Kurz Die Welt Retten",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
              Text("Tim Bendzko ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
               ),
               Center(
                 child: Text("Compartir con todos ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
               ),
              Radios(),
              
              
             



        ],
      ),
      
    
                
                
              ],
            ),
       ),
       floatingActionButton:FloatingActionButton(
                child: Icon(Icons.send_outlined),
                elevation: 50.0,
                backgroundColor: Colors.deepPurple.shade200,
                onPressed: (){
                  _showAlertDialog(context);
                },
              ) ,
      
     

    );
      
  }
   void _showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text("Contactos"),
          content: Text("Elemnetos enviados"),
          actions: <Widget>[
            RaisedButton(
              child: Text("CERRAR", style: TextStyle(color: Colors.deepPurple),),
              onPressed: (){ 
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                   
                    return HeroApp();
                  }
                  )
                  );
                },
            )
          ],
        );
      }
    );
  }

 
}