import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:parcial_2/models/ApiP.dart';

import 'package:http/http.dart' as http;//Agregar import
void main() {
  runApp(AppApi());
}

class AppApi extends StatefulWidget {
  AppApi({Key? key}) : super(key: key);

  @override
  _AppApiState createState() => _AppApiState();
}

class _AppApiState extends State<AppApi> {
  @override

   late Future<List<ApiP>> _listImg;//Lista para datos a rellenar en la APIGIF
   
  
  Future<List<ApiP>> _getImg() async{//Metodo para devover las imagenes
    String cuerpo;
    final response=await http.get(Uri.parse("https://utecclass.000webhostapp.com/post.php"));//link api request
    List<ApiP> pict=[];//Listado para GIF
    if(response.statusCode==200){//Validando la coneccion
      print(response.body);
      cuerpo=utf8.decode(response.bodyBytes);//Normalizando a UTF-8
      final jsonData=jsonDecode(cuerpo);//Decodificando
      for (var item in jsonData){//Extrayendo la data del JSON
          pict.add(
            ApiP(item["content"], item["title"])//Guardando en la gif los elementos a ocupar
          );
          
      }
       return pict;//Retornando listado
      //print(jsonData["data"][0]["type"]);
    }else{
      throw Exception("No se puede conectar");
    }
   
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api",
      home: Scaffold(backgroundColor: Colors.lightGreenAccent.shade200,
        appBar: AppBar(
          title: Text("Parcial 2"),
        ) ,
        body:       
         Cuerpo(),

      ),
    );
  }

   @override
  void initState() { 
    super.initState();
    _listImg=_getImg();//Asignando el mismo body
    
  }
  Widget Cuerpo(){
    return Container(
      child: Center(//Centrar todo los widget entrantes
      child: ListView(
        
        children: <Widget>[//Para exportar metodos de widget necesitamos un <Widget>[]
         SizedBox(
           height: 15,
         ),
         Encabezado(),
         SizedBox(
           height: 15,
         ),
         buildFutureBuilder(),
         
        ],
      ),
    ),
    );
  }

  Widget buildFutureBuilder() {
    return FutureBuilder(//Utilizar un furure Builder
          
          future: _listImg,
          builder: (context,snapshot){
            if(snapshot.hasData){//Si se obtienen datos
              print(snapshot.data);
              return Column(
                
                children:
                 _listImgs(snapshot.data),//devolviendo la data
              );
            }
            else
              if(snapshot.hasError){
                print(snapshot.error);
              
            }return Center(
             child: CircularProgressIndicator(),   
            );
            
          },
        );

  }

  Widget Encabezado(){
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Lista de Api',style:TextStyle(fontSize: 25,color: Colors.red.shade900),),
          Icon(Icons.supervisor_account,size: 60,color: Colors.deepOrange.shade500,),
        ],
      )
      
    );
  }
  List<Widget> _listImgs(data){
    List<Widget> imag=[];
    for (var itemg in data) {
      imag.add(
        Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.cyan.shade200,
          child: Column(
          
          children:
          [
             ListTile(
              
              title:Text(itemg.content) ,
              subtitle: Text(itemg.title),
            )
          ]

        ),) 
        );
      
    }
    return imag;

  }
}
