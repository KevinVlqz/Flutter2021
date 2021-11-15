import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reproductor_app/Pantallas/descripcionArt.dart';
import 'package:reproductor_app/Pantallas/popular.dart';

import 'Pantallas/nationality.dart';

void main() => runApp(HeroApp());

List Cancion=["Nurn Noch Kurz Die Retten","Hoch","Keine Maschine"];

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fondods.jpg'),
            fit: BoxFit.cover,
          )


        ),
        child: Column(
          children: [
            SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Encabezado(context),
          SizedBox(
            height: 800.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => 
              //Cuerpo principal 
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
                        InkWell(
                         onTap: () => _openDetail(context, index),
                        child:  Hero(
                        tag: "avatar-$index",
                        child: Image.asset('assets/img/timbend.jpg',),
                        //Image.network("https://picsum.photos/seed/$index/800"),
                      ),
                          ),
                        Text("Tim Bendzko",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(Cancion[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
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
              
             
              
              ]
              
              ),
              
              ),
              

     
    ),),
    Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                      '         ♦\n   Tim Bendzko',
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
        ],)
        ,)
        ,
          ],
        ),
      ),);
  }

 
  _openDetail(context, index) {
    final route = MaterialPageRoute(
      builder: (context) => DetailPage(index: index),
    );
    Navigator.push(context, route);
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
                  
                Container(
                     child: Text(
                      'Classic\n     ►',
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
                      'Popular',
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
                      'Nationality',
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

class DetailPage extends StatelessWidget {
  
  final int index;
  const DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
              
              background: 
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/img/fondods.jpg'),
                  fit: BoxFit.fitHeight,
                  ),

                ),
                
                
              child: Column(
                children: [
                   Hero(
                    tag: "avatar-$index",
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      
                      child: Card(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        
                        ),
                        color: Colors.grey.shade200,
                        child: Image(
                          image: AssetImage('assets/img/timbend.jpg'),
                        ),
                      ),
                      
                    ),
                    //Image.asset('assets/img/timbend.jpg', width: double.infinity,),
                   ),
                  FadeInDemo(),
              

              Text("Nurn Noch Kurz Die Retten",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
              Text("Tim Bendzko",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
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
                            child: Text(" Classic  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
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
                              child: Text(" Music Poet ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
                          ),
                        ),
                            ),
                            
                            
                           

                        

                          ],
                        ),SizedBox(
                              height: 30,
                            ),
                        SizedBox(
                              height: 305,
                              child:  SingleChildScrollView(
                              
                              scrollDirection: Axis.vertical,//.horizontal
                                child: new Text(
                                  "Ich wär' so gern dabei gewesen\n"
                                    "Doch ich hab viel zu viel zu tun\n"
                                    "Lass uns später weiter reden\n"
                                    "Da draußen brauchen sie mich jetzt\n"
                                    "Die Situation wird unterschätzt\n"
                                    "Und vielleicht hängt unser Leben davon ab\n"
                                    "Ich weiß es ist dir ernst, du kannst mich hier grad nicht entbehren\n"
                                    "Nur keine Angst, ich bleib' nicht all zu lange fern\n"
                                    "\n"
                                    "Muss nur noch kurz die Welt retten\n"
                                    "Danach flieg' ich zu dir\n"
                                    "Noch 148 Mails checken\n"
                                    "Wer weiß was mir dann noch passiert, denn es passiert so viel\n"
                                    "Muss nur noch kurz die Welt retten\n"
                                    "Und gleich danach bin ich wieder bei dir\n",
                                  style:  GoogleFonts.irishGrover(
                                    fontSize: 20,
                                  ),
                                ),

                            ),
                            ),


        ],

              ),
              ),
              
             
            ),
          ),
          
        ],
      ),
      
    );
  }
}
