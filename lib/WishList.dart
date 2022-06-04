import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:clon_amazon/carrito.dart';

class wishList extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<wishList> {
  var rng = new Random();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  CollectionReference _productss =
  FirebaseFirestore.instance.collection('products');

  Future<void> _createOrUpdate([DocumentSnapshot documentSnapshot]) async {
    String action = 'Agregar';
    if (documentSnapshot != null) {
      action = 'Actualizar';
      _nameController.text = documentSnapshot['nombre'];
      _priceController.text = documentSnapshot['cantidad'].toString();
    }

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
                  decoration: InputDecoration(labelText: 'Producto'),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'Agregar' ? 'Agregar' : 'Actualizar'),
                  onPressed: () async {
                    final String nombre = _nameController.text;
                    final double precio = (rng.nextDouble()*rng.nextInt(100)).roundToDouble();
                    final int cantidad = int.parse(_priceController.text);
                    if (nombre != null && cantidad != null ) {
                      if (action == 'Agregar') {
                        // Persist a new product to Firestore
                        await _productss.add({"nombre": nombre,"precio":precio, "cantidad": cantidad});
                      }

                      if (action == 'Actualizar') {
                        // Update the product
                        await _productss
                            .doc(documentSnapshot?.id)
                            .update({"nombre": nombre, "cantidad": cantidad});
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _priceController.text = '';

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
        SnackBar(content: Text('Se eliminó correctamente el producto')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff84D8E3),
        title: Container(
          width: 130,
          height: 170,
          child: Image.asset("assets/amazon.png"),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => carrito()),
              );
            },)
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder<QuerySnapshot>(
        stream: _productss.snapshots(),
        builder: (context, streamSnapshot) {
          if(streamSnapshot.data.docs.length != 0) {
            return ListView.builder(
              itemCount: streamSnapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data.docs[index];
                return Card(
                  margin: EdgeInsets.only(left: 20, right: 20,top: 20),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child:
                    ListTile(
                    title: Text(documentSnapshot['nombre']),
                    subtitle: ListTile(
                      title: Text("\$" + documentSnapshot['precio'].toString()),
                      subtitle: Text(documentSnapshot['cantidad'].toString() + " piezas"),

                    ),
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
                  ),
                );
              },
            );
          }else{
            return Center(
              heightFactor: 7,
              child:
              ListTile(
                title: Text("Agrega articulos a tu Wish List",textAlign: TextAlign.center),
                subtitle: IconButton(
                  icon: const Icon(
                    Icons.shopping_basket,
                    color: Color(0xFF919191),
                    size: 150,
                  ),
              ),
            )
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
        backgroundColor: Color(0xff84D8E3),
        child: Icon(Icons.add),
      ),
    );
  }
}

