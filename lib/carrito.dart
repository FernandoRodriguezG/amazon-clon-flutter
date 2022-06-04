import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class carrito extends StatefulWidget {
  @override
  Carrito createState() => Carrito();
}

class Carrito extends State<carrito> {
  CollectionReference _carrito =
      FirebaseFirestore.instance.collection('productosCarrito');

  Future<void> _deleteProduct(String productId) async {
    await _carrito.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se eliminó correctamente el producto')));
  }
  
  Future<void> _quitaUno([DocumentSnapshot documentSnapshot]) async{
    int cantidad = documentSnapshot['cantidad'];
    cantidad--;
    await _carrito.doc(documentSnapshot.id).update({"cantidad":cantidad});
  }

  Future<void> _agregaUno([DocumentSnapshot documentSnapshot]) async{
    int cantidad = documentSnapshot['cantidad'];
    cantidad++;
    await _carrito.doc(documentSnapshot.id).update({"cantidad":cantidad});
  }

  bool isChecked = false;

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
            onPressed: () {},
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            arriba(),
            StreamBuilder<QuerySnapshot>(
              stream: _carrito.snapshots(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.data.docs.length != 0) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: streamSnapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data.docs[index];
                      return Card(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(documentSnapshot['imagen']),
                                  width: 130,
                                  height: 130,
                                ),
                                Center(
                                    child:
                                    Padding(
                                        padding: EdgeInsets.only(left: 25, top: 25),
                                        child: Column(
                                          children: <Widget>[
                                            Text(documentSnapshot['nombre']),
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  "\$" +
                                                      (documentSnapshot['precio']*documentSnapshot['cantidad']).toString() ,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.check,
                                                      color: Colors.amber,
                                                    ),
                                                    Text(
                                                      "prime",
                                                      style: TextStyle(color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 13, left: 8),
                                                  child: Text("Entrega GRATIS"),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.white,
                                                          onPrimary: Colors.black),
                                                      child: Text("Eliminar"),
                                                      onPressed: () {
                                                        _deleteProduct(documentSnapshot.id);
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(const SnackBar(
                                                            content: Text('Eliminado')));
                                                      }),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                    )
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 20,bottom: 5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Colors.white,shadowColor: Colors.transparent,onPrimary: Colors.black),
                                      child: Icon(Icons.restore_from_trash),
                                      onPressed: (){
                                        _quitaUno(documentSnapshot);
                                      },
                                    )
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(left: 15, right: 10,bottom: 5),
                                  child:
                                  Text(documentSnapshot['cantidad'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10,bottom: 5),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.white,shadowColor: Colors.transparent,onPrimary: Colors.black),
                                    child:Icon(Icons.add),
                                    onPressed: (){
                                      _agregaUno(documentSnapshot);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ]));
                    },
                  );
                } else {
                  return Center(
                      heightFactor: 7,
                      child: ListTile(
                        title: Text("Agrega articulos a tu carrito de compras",
                            textAlign: TextAlign.center),
                        subtitle: IconButton(
                          icon: const Icon(
                            Icons.shopping_basket,
                            color: Color(0xFF919191),
                            size: 150,
                          ),
                        ),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class arriba extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          color: Color(0xff66CCCE),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 14),
                child: Icon(
                  Icons.location_on_outlined,
                ),
              ),
              Text(
                "Enviar a San Luis Potosí - 78000",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 10,
        ),
        SizedBox(
           width: 300,
           height: 50,
           child: ElevatedButton(
             style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
             child: Text("Proceder al pago"),
               onPressed: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Pago')));
               }
           ),
         ),
        Row(
                  children: <Widget>[
                    Checkbox(value: false,),
                    Icon(Icons.card_giftcard),
                    Text("Este pedido es un regalo"),
                  ],
                ),
      ],
    );
  }
}
