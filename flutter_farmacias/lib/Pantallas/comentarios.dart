import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_farmacias/Pantallas/menu.dart';
import 'package:get_ip_address/get_ip_address.dart';



class OpinionesComt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
       debugShowCheckedModeBanner: false,
      title: 'Opiniones y Cmt',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   dynamic data;

  _onLoginButtonPressed() async {
     var ipAddress = IpAddress(type: RequestType.text);
     data = await ipAddress.getIpAddress();
     data.toString();
    print(data); 
    }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onLoginButtonPressed();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cmtController = TextEditingController();

  CollectionReference _productss =
      FirebaseFirestore.instance.collection('comentarios');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
   

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                  Icons.add_comment,
                  size: 40,
                ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Agregue su alias ej: User123 '),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines:5,
                  controller: _cmtController,
                  decoration: InputDecoration(
                    labelText: 'Agregue su comentario u opinion',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Agregar Comentario' : 'Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? price =_cmtController.text;
                    if (name != "" || price != "") {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss.add({"alias": name, "coment": price,"ipuser":data});
                      }
                      // Clear the text fields
                      _nameController.text = '';
                      _cmtController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: Text('Foro AppFarm'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AppFarmacia();

            },),);
          },
        ),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: 
      Column(
        children: [
          SizedBox( 
            height: 159,
            child: Column(
              children: [
                 Container(
                  child: Center(
                    child: Text('Comentarios y Opiniones',style: TextStyle(color: Colors.deepPurple,fontSize:30,fontWeight: FontWeight.bold ),),
                  )
                ),
                Container(
            
                  child: Text('\nSus comentarios son de gran importancia para nuestras cadenas farmaceuticas asi que habilitamos este espacio'+
                        ' anonimo para que exprese su experiencia con nuestros servicios',style: TextStyle(color: Colors.blueGrey.shade300,fontSize:20),),
                ),
                
                Container(
            
                  child: Center(
                    child: Text('Importante:Mantener un ambiente sano para el dialogo \n',style: TextStyle(color: Colors.red.shade500,fontSize: 14),),
                  )
                  
                ),
              ],
            ),

          ),
         SizedBox(
            height: MediaQuery.of(context).size.height/1.7,
            child:   StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['alias'],style: TextStyle(color: Colors.blue),),
                    subtitle: Text(documentSnapshot['coment'],style: TextStyle(color: Colors.grey.shade600),),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // Press this button to edit a single product
                         /* IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                                  */
                          // This icon button is used to delete a single product
                          Icon(Icons.comment_bank),
                          
                        ],
                      ),
                    ),
                    
                  ),
                );
                
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
            
          )
          
        ],
      ),
      
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: Icon(Icons.add),
      ),
    );
  }
}