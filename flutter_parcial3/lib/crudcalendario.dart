import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


/// This is the main application widget.
class Calendario extends StatelessWidget {
  

  static const String _title = 'Crud Calendario';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  
  String dropdownValue = 'One';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fechainiController = TextEditingController();
  final TextEditingController _fechafinController = TextEditingController();
  final TextEditingController _horainiController = TextEditingController();
  final TextEditingController _horadinController = TextEditingController();
   final TextEditingController _detalleController = TextEditingController();

  List ListaUser=[];
  CollectionReference _productss =
      FirebaseFirestore.instance.collection('calendario');

      CollectionReference _usuarios =
      FirebaseFirestore.instance.collection('usuarios');

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsuarios();
    
  }

      Future<List> getUsuarios() async {
  List list=[];
  QuerySnapshot usuarios = await _usuarios.get();
  if (usuarios.docs.length != 0) {
    for (var documentos in usuarios.docs) {
     
      //list.add(documentos.id);
      ListaUser.add( documentos.id);
      print(ListaUser);
    }
  }
  return ListaUser;
}

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    String TipoIngreso="GFGhfsfjhhavshs";
    
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['nombre'];
      _detalleController.text=documentSnapshot['detalles'];
      _fechainiController.text=documentSnapshot['fecha_ini'];
      _fechafinController.text=documentSnapshot['fecha_fin'];
      _horainiController.text=documentSnapshot['hora_ini'];
      _horadinController.text=documentSnapshot['hora_fin'];
      TipoIngreso=documentSnapshot["idusuario"];
    

      
      
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
                  controller: _detalleController,
                  maxLines: 5,
                  decoration: InputDecoration(labelText: 'detalle'),
                ),
                TextField(
                  //keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _fechainiController,
                  decoration: InputDecoration(
                    labelText: 'fecha de inicio',
                  ),
                ),
                TextField(
                 controller: _fechafinController,
                  decoration: InputDecoration(
                    labelText: 'fecha final',
                  ),
                ),
                TextField(
                controller: _horainiController,
                  decoration: InputDecoration(
                    labelText: 'hora de inicio',
                  ),
                ),
                TextField(
                controller: _horadinController,
                  decoration: InputDecoration(
                    labelText: 'Hora final',
                  ),
                ),
                
                DropdownButton<String>(
                value: dropdownValue,
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
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
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
                    final String? detalle=_detalleController.text;
                    final String? fechaf=_fechafinController.text;
                    final String? fechai=_fechafinController.text;
                    final String? horai=_horainiController.text;
                    final String? horaf=_horadinController.text;
                    

                   
                    if (name != null && detalle != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss.add({"nombre": name, "detalles": detalle, "fecha_ini": fechai,"fecha_fin": fechaf,"hora_ini": horai,"hora_fin":horaf,});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss
                            .doc(documentSnapshot!.id)
                            .update({"nombre": name, "detalles": detalle, "fecha_ini": fechai,"fecha_fin": fechaf,"hora_ini": horai,"hora_fin":horaf,});
                            
                           
                      }

                      // Clear the text fields
                      _nameController.text = '';
                     _detalleController.text= '';
                    _fechafinController.text= '';
                    _fechainiController.text= '';
                    _horadinController.text= '';
                    _horadinController.text= '';

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
        SnackBar(content: Text('Se ha eliminado el Evento')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                    subtitle: Text(documentSnapshot['detalles'].toString()),
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
