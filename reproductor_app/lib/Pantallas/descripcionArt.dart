import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reproductor_app/Pantallas/classicSend.dart';


class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacityLevel = 0.0;
  

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   AnimatedOpacity(
                      duration: Duration(seconds: 3),
                      opacity: opacityLevel,
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)
                                ),
                                color: Colors.white,
                                child: Center(
                                  child: Icon(
                              Icons.skip_previous_outlined,
                              size: 90,
                              color: Colors.black,
                            ),
                                ),
                              ),
                     ),
                     

                        ],
                      ),
                    ),
                  AnimatedOpacity(
                      duration: Duration(seconds: 3),
                      opacity: opacityLevel,
                      child: Column(
                        children: <Widget>[
                         
                     Container(
                              child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          color: Colors.white,
                          child: Center(
                             child: 
                             InkWell(
                onTap: (){ 
                
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                   
                    return DetailScreenSendPop();
                  }
                  )
                  );
                },
              child:Icon(
                               
                         Icons.send_outlined,
                        size: 90,
                        color: Colors.black,
                      
                      ),
                ),
                             
                      
                          ),
                        ),
                     ),

                        ],
                      ),
                    ),
                    
                   
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      onPressed: () => setState(() {
                        opacityLevel = 1.0;
                      }),
                      child: Container(
                              child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          color: Colors.white,
                          child: Center(
                             child: Icon(
                         Icons.play_circle_filled_outlined,
                        size: 90,
                        
                      ),
                          ),
                        ),
                     ),
                    ),
                     
                     AnimatedOpacity(
                      duration: Duration(seconds: 3),
                      opacity: opacityLevel,
                      child: Column(
                        children: <Widget>[
                           Container(
                              child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          color: Colors.white,
                          child: Center(
                             child: Icon(
                        Icons.skip_next_outlined,
                        size: 90,
                        color: Colors.black,
                      ),
                          ),
                        ),
                     ),
                    
                        ],
                      ),
                    ),
                    
                    
                    
                   
                   
                ],
              ),
      
    ]);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}


