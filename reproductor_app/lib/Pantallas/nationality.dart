import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reproductor_app/Pantallas/descripcionArt.dart';
import 'package:reproductor_app/Pantallas/popular.dart';

import '../main.dart';


class NationalityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
         decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage("assets/img/fondods.jpg",), fit: BoxFit.cover)),
            child:  Column(
              children: <Widget>[
                
               Column(
        children: [
          SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Encabezado(context),
          ),
          SizedBox(
            height: 750.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) => 

              Container(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
              width: 450,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                        child: Hero(
                          tag: 'imageHero',
                          child:Image.asset('assets/img/sabino.jpg',width: 500,height: 500,)
                           /*Image.network(
                            'https://picsum.photos/250?image=9',
                          ),*/
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return DetailScreen();
                          }));
                        },
                      ),
    
                        Text("Sabino",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("La Magia",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              child: Card(
                              
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30)
                          ),
                          color: Colors.red.shade200,
                          child: Center(
                            child: Text("VIP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
                          ),
                        ),
                            ),
                             Container(
                              width: 55,
                              height: 55,
                              child: Card(
                              
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30)
                          ),
                          color: Colors.grey.shade200,
                          child: Center(
                             child: Text("  SQ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black12 ),),
                          ),
                        ),
                            ),
                        

                          ],
                        ),SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("     Mark  /",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black26),),
                            Text("   5.0      ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:Colors.black ),),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                          ],
                        ),
                        
                      ],
                    ),
                    
                  ),


                ),
              ),
              Container(
              width: 450,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          
                          onTap: (){
                          },
                        child: Ink.image(
                          image: AssetImage('assets/img/sabino.jpg'),
                          height: 500,
                          width: 300,
                        ),
                          ),
                        Text("Sabino",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("La Magia",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              child: Card(
                              
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30)
                          ),
                          color: Colors.red.shade200,
                          child: Center(
                            child: Text("VIP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
                          ),
                        ),
                            ),
                             Container(
                              width: 55,
                              height: 55,
                              child: Card(
                              
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(30)
                          ),
                          color: Colors.grey.shade200,
                          child: Center(
                             child: Text("  SQ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black12 ),),
                          ),
                        ),
                            ),
                        

                          ],
                        ),SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("     Mark  /",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black26),),
                            Text("   5.0      ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:Colors.black ),),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                            Icon(Icons.star,color: Colors.grey.shade400,),
                          ],
                        ),
                        
                      ],
                    ),
                    
                  ),


                ),
              ),
              
              
              ],

            )
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                      '         ♦\n   Sabino',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      ' \n Kase O   ',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),

            ],
            
            
          ),
         
          
        ],
      ),
    ),


        ],
      ),
      
    
                
                
              ],
            ),
       )
      
      
    );
      
      
  }
  
}


Widget Encabezado(context){
    return Column(
      children: [
         SizedBox(
                height: 40,
              ),
              Container(
                width: 160.0,
                child: Center(
                  child: Text("Daily ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,)),
                ),
              ),
              Container(
                width: 170.0,
                child: Center(
                  child:Text("Recommended ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
                )
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                onTap: (){ 
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return HeroApp();
                  }
                  )
                  );
                },
              child:Text(
                      'Classic    ',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                ),
                  
                  
                  InkWell(
                onTap: (){ 
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return PopularPage();
                  }
                  )
                  );
                },
              child:Text(
                      'Popular   ',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                ),
                  InkWell(
                onTap: (){ 
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return HeroApp();
                  }
                  )
                  );
                },
              child:Text(
                      'Nationality   \n     ►    ',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                ),
                 
                 
                ],
              ),
      ],
    );
  }

class DetailScreen extends StatelessWidget {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
         decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage("assets/img/fondods.jpg",), fit: BoxFit.cover)),
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
              image: AssetImage('assets/img/sabino.jpg'),
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
              FadeInDemo(),
              

              Text("La Magia",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
              Text("Sabino \nMexicano",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
               ),
                        Row(
                          children: [
                            Container(

                              height: 55,
                              child: Card(
                              
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.red.shade200,
                          child: Center(
                            child: Text(" Nationality  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
                          ),
                        ),
                            ),
                            SizedBox(width: 15,),
                             Container(  

                              height: 55,
                              child: Card(
                              
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.red.shade200,
                          child: Center(
                              child: Text(" Music Hip Hop ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
                          ),
                        ),
                            ),
                            
                            
                           

                        

                          ],
                        ),SizedBox(
                              height: 30,
                            ),
                        SizedBox(
                              height: 85,
                              child:  SingleChildScrollView(
                              
                              scrollDirection: Axis.vertical,//.horizontal
                                child: new Text(
                                  "Dos personas se conectan y se enganchan\n"
                                    "Cuando la química hace magia ya no hay vuelta atrás\n"
                                    "No importa lo que está pasando por sus vidas\n"
                                    "Cuando se cruzan dos opuestos que se atraen\n"
                                    "Toda la vida seguiremos conociendo gente\n"
                                    "No hay que dejar pasar la oportunidad\n"
                                    "Cuando el cariño y el amor no es suficiente\n"
                                    "Siempre el impacto de la magia puede más\n",
                                  style:  GoogleFonts.irishGrover(
                                    fontSize: 20,
                                  ),
                                ),

                            ),
                            ),


        ],
      ),
      
    
                
                
              ],
            ),
       )
      
     

    );
      
  }

}


