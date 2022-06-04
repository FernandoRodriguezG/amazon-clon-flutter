import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clon_amazon/PrincipalRoute.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:clon_amazon/carrito.dart';

class Ofertas extends StatefulWidget {
  @override
  ofertas createState() => ofertas();
}

class ofertas extends State<Ofertas> {
  final TextEditingController _numController = TextEditingController();

  CollectionReference _carrito = FirebaseFirestore.instance.collection('productosCarrito');

  Future<void> _create(String nombreP, double precioP,String imagen) async{
    String action = "Agregar";
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
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _numController,
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
                    final int cantidad = int.parse(_numController.text);
                    double precio = precioP;
                    String nombre = nombreP;
                    String dirImagen = imagen;
                    if (cantidad != null ) {
                      if (action == 'Agregar') {
                        // Persist a new product to Firestore
                        await _carrito.add({"nombre": nombre,"precio":precio, "cantidad": cantidad, "imagen": dirImagen});
                      }

                      // Clear the text fields
                      _numController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        }
      );
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
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Image(image: AssetImage("assets/bannerOf.jpeg")),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top:20.0,left: 16,bottom: 20),
                      child: Text("Promociones",
                        style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)
                        ,)
                      ,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 5,right: 5),
                      child:ElevatedButton(
                          onPressed: null,
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text: "Todas las ofertas",style: TextStyle(color: Colors.black)),
                                  WidgetSpan(child: Icon(Icons.arrow_drop_down_sharp,size: 15,))
                                ]
                            ),
                          )
                      ),),
                    Padding(padding: EdgeInsets.only(left: 5,right: 5),
                      child:ElevatedButton(
                          onPressed: null,
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text: "Disponibilidad",style: TextStyle(color: Colors.black)),
                                  WidgetSpan(child: Icon(Icons.arrow_drop_down_sharp,size: 15,))
                                ]
                            ),
                          )
                      ),),
                    Padding(padding: EdgeInsets.only(left: 5,right: 5),
                      child:ElevatedButton(
                          onPressed: null,
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text: "Prime",style: TextStyle(color: Colors.black)),
                                  WidgetSpan(child: Icon(Icons.arrow_drop_down_sharp,size: 15,))
                                ]
                            ),
                          )
                      ),)
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/mochila.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("Mochilas SWISSBRAND",463.00,"assets/mochila.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$463.00 - \$959.00",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("Mochilas SWISSBRAND"),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/alexa.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("Echo dot (4ta\n Gen) con Reloj",1399.00,"assets/alexa.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$1399.00",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("Precio recomendado:"),
                    Text("\$1799.00 22% de"),
                    Text("descuento"),
                    Padding(padding: EdgeInsets.only(top: 10),child: Text("Echo dot (4ta Gen) con Reloj"),),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/perro.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("rabbitgoo Arnes para\n Perro", 369.75,"assets/perro.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$369.75 - \$500.65",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("rabbitgoo Arnes para Perro"),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/sutil.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("El sutil arte de que te\n importe un carajo: U...", 202.00,"assets/sutil.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$202.00",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("Precio recomendado:"),
                    Text("\$269.00 25% de"),
                    Text("descuento"),
                    Padding(padding: EdgeInsets.only(top: 10),child: Text("El sutil arte de que te importe un carajo: U..."),),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/bascula.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("Promoción en Etekcity\nBáscula de Peso...", 368.38,"assets/bascula.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$369.38",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("Precio recomendado:"),
                    Text("\$519.68 29% de"),
                    Text("descuento"),
                    Padding(padding: EdgeInsets.only(top: 10),child: Text("Promoción en Etekcity - Báscula de Peso..."),),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/reloj.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                    onPressed: (){
                      _create("Smartwatch Pulsera inte-\nligente, Odar Rel...", 483.65,"assets/reloj.jpg");
                    },
                    child: Text("Agregar al carrito"),
                    style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$483.65",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("Precio recomendado:"),
                    Text("\$1299.00 63% de"),
                    Text("descuento"),
                    Padding(padding: EdgeInsets.only(top: 10),child: Text("Smartwatch Pulsera inteligente, Odar Rel..."),),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/plug.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("Oferta en Kasa Smart\n Plug Power Strip...", 528.62,"assets/plug.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$528.62",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("Precio recomendado:"),
                    Text("\$1009.99 48% de"),
                    Text("descuento"),
                    Padding(padding: EdgeInsets.only(top: 10),child: Text("Oferta en Kasa Smart Plug Power Strip..."),),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 350,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/audi.jpg"),width: 150,height: 150,),
                    ElevatedButton(
                      onPressed: (){
                        _create("TYC Audífonos Inalám-\nbricos Bluetooth", 339.15,"assets/audi.jpg");
                      },
                      child: Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black),
                    ),
                    Text("\$339.15",style: TextStyle(color: Colors.deepOrangeAccent),),
                    Text("15% de descuento"),
                    Padding(padding: EdgeInsets.only(top: 10),child: Text("TYC Audífonos Inalámbricos Bluetoo..."),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80,
              color: Color(0xff84D8E3),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 19, left: 15),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/userDefault.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  DrawerHeader(
                    child:
                    Text("Hola, Fernando", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrincipalRoute()),
                );
              },
            ),
            ListTile(
              title: Text('Mis pedidos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Comprar de nuevo'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Whis List'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Mis pedidos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Mi cuenta'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Comprar por Departamento'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("PROGRAMAS Y CARACTERISTICAS"),
            ),
            ListTile(
              title: Text('Promociones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Bucador de Regalos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Prime'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Formas de pago'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ver todos los programas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text('Tus notificaciones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Text("Configuración       "),
                  Image(
                    image: AssetImage("assets/bandera.jpg"),
                    height: 20,
                    width: 25,
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Servicio de atención al cliente'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
void guardaInfo(){

}