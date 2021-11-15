import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reproductor_app/Pantallas/descripcionArt.dart';
import 'package:reproductor_app/Pantallas/nationality.dart';

import '../main.dart';


class PopularPage extends StatelessWidget {
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
                          child:Image.asset('assets/img/dualipa.png',width: 500,height: 500,)
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
    
                        Text("Dua Lipa",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("We're good",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
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
                          image: AssetImage('assets/img/dualipa.png'),
                          height: 500,
                          width: 300,
                        ),
                          ),
                        Text("Dua Lipa ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("We're good",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
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
                      '         ♦\n   Dua Lipa',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      ' \n Sophie Red    ',
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
                      'Classic     ',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                ),
                  
                  Container(
                     child: Text(
                      'Popular \n     ►     ',
                      style: GoogleFonts.irishGrover(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  InkWell(
                onTap: (){ 
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return NationalityPage();
                  }
                  )
                  );
                },
              child:Text(
                      'Nationality    ',
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
              image: AssetImage('assets/img/dualipa.png'),
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
              

              Text("We're good",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
              Text("Dua Lipa ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
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
                            child: Text(" Popular  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
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
                              child: Text(" Music Pop ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
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
                                  "I'm on an island\n"
                                    "Even when you're close\n"
                                   " Can't take the silence\n"
                                   " I'd rather be alone\n"
                                    "I think it's pretty plain and simple\n"
                                    "We gave it all we could\n"
                                    "It's time I wave goodbye from the window\n"
                                    "Let's end this like we should and say we're good\n"
                                    "We're not meant to be like sleeping and cocaine\n"
                                    "So let's at least agree to go our separate ways\n"
                                    "Not gonna judge you when you're with somebody else\n"
                                    "As long as you swear you won't be pissed when I do it myself\n"
                                    "Let's end it like we should and say we're good\n",
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


