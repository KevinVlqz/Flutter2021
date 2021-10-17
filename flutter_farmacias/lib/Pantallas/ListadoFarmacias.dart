import 'package:flutter/material.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';

class ListFarmC extends StatelessWidget {
  const ListFarmC({Key? key}) : super(key: key);

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
      
      appBar: AppBar(
        title: Text("Listado de Farmacias"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AppFarmacia();

            },),);
          },
        ),

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
       SizedBox(
        height: 15,
      ),
      ListaFarmacias(c),
 
    ],

  );
}

Widget Encabezado(){
  return Center(
    
    child: Text("Listado de Farmacias",style: TextStyle(fontSize:30,color:Colors.white)),
  );
}

Widget ListaFarmacias(BuildContext context){
  return Column(
    
    mainAxisAlignment: MainAxisAlignment.center,
    children:<Widget> [
      Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
              width: MediaQuery.of(context).size.width/2,

                  child: Text('Farmacia Economicas, Centro',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ), Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  
                  child: Text('Farmacia Economicas, Apopa',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ),
       Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
              width: MediaQuery.of(context).size.width/2,
                  child: Text('Farmacia Economicas, Soyapango',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite_border,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ), Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
                 width: MediaQuery.of(context).size.width/2,

                  child: Text('Farmacia Economicas, San Benito',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ),
       Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
                   width: MediaQuery.of(context).size.width/2,

                  child: Text('Farmacia Economicas, Av. España',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite_border,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ),
       Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,

                  child: Text('Farmacia Economicas, Escalon',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite_border,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ),
       Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
              width: MediaQuery.of(context).size.width/2,

                  child: Text('Farmacia Economicas, Metrocentro',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite_border,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ),
       Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 50,
                  child: Image.asset('assets/img/imgFarm.png'),
                ),
                Container(
              width: MediaQuery.of(context).size.width/2,

                  child: Text('Farmacia Economicas, Plaza Mundo',style: TextStyle(fontSize: 20),),

                ),
                Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.room_outlined,color: Colors.red,size: 30,),
                ),Container(
                  padding:EdgeInsets.all(20),
                  child: Icon(Icons.favorite,color: Colors.red,size: 30,),
                )
                    ]
                  ),
      ),
      
    
    ],

  );
  
  
}

