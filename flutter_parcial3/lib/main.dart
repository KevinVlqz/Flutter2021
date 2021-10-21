import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parcial3/crudcalendario.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Parcial 03',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _nivelController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  CollectionReference _productss =
      FirebaseFirestore.instance.collection('usuarios');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    String TipoIngreso="Alumno";
    
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['nombre'];
      _correoController.text = documentSnapshot['correo'];
      _usuarioController.text = documentSnapshot['usuario'];
      _nivelController.text = documentSnapshot['nivel'].toString();
      _passwordController.text = documentSnapshot['password'];
      TipoIngreso=documentSnapshot["set"];
    

      
      
    }
 
  // set up the AlertDialog


  // show the dialog


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
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                 TextField(
                  controller: _correoController,
                  decoration: InputDecoration(labelText: 'Correo'),
                ),
                TextField(
                  //keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _nivelController,
                  decoration: InputDecoration(
                    labelText: 'Nivel',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                
                DropdownButton<String>(
                value: TipoIngreso,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {

                    
                  
                    setState(() {
                      TipoIngreso = newValue!;
                    });
                    
                    },
                
                
                items: <String>['Alumno', 'Profesor', 'Admi']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    
                    child: Text(value),
                  );
                }).toList(),
              ),
               
                ElevatedButton(
                  child: Text(action == 'create' ? 'Agregar' : 'Actualizar'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? price =_usuarioController.text;
                     final String? correo = _correoController.text;
                    final String? password =_passwordController.text;
                    final int? nivel = int.tryParse(_nivelController.text);

                   
                    if (name != null && price != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss.add({"nombre": name, "usuario": price, "nivel": nivel,"correo": correo,"password": password,"set":TipoIngreso});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss
                            .doc(documentSnapshot!.id)
                            .update({"nombre": name, "usuario": price, "nivel": nivel,"correo": correo,"password": password,"set":TipoIngreso});
                            
                           
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _usuarioController.text = '';
                     _correoController.text='';
                    _passwordController.text='';
                    _nivelController.text='';

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
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se ha eliminado el usuario')));
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
        leading: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Calendario();

            },),);
          },
        ),

      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
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
                    title: Text(documentSnapshot['nombre']),
                    subtitle: Text(documentSnapshot['set'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // Press this button to edit a single product
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          // This icon button is used to delete a single product
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
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
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: Icon(Icons.add),
      ),
    );
  }
}