import 'package:flutter/material.dart';
import 'package:clon_amazon/ofertas.dart';
import 'package:clon_amazon/carrito.dart';
import 'package:clon_amazon/WishList.dart';

class PrincipalRoute extends StatelessWidget {
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
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Color(0xff84D8E3),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 13, top: 13, bottom: 13),
                        child: Container(
                          width: 30,
                          height: 35,
                          color: Colors.white,
                          child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Busqueda')));
                              }),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: Colors.white,
                        height: 35,
                        child: TextField(
                          style: TextStyle(fontSize: 19),
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10, left: 8),
                            border: OutlineInputBorder(),
                            hintText: '¿Qué buscas?',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 13, bottom: 13),
                        child: Container(
                            width: 30,
                            height: 35,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Busqueda')));
                                  }),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Color(0xff84D8E3),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: ElevatedButton(
                            child: new Text(
                              "Prime",
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Prime')));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff84D8E3),
                                onPrimary: Colors.black,
                                side: BorderSide(
                                    width: 0, color: Color(0xff84D8E3)))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: ElevatedButton(
                            child: new Text(
                              "Video",
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Video')));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff84D8E3),
                                onPrimary: Colors.black,
                                side: BorderSide(
                                    width: 0, color: Color(0xff84D8E3)))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: ElevatedButton(
                            child: new Text(
                              "Música",
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Música')));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff84D8E3),
                                onPrimary: Colors.black,
                                side: BorderSide(
                                    width: 0, color: Color(0xff84D8E3)))),
                      ),
                    ],
                  ),
                ),
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
              ],
            ),
            Image(image: AssetImage("assets/diaMadres.png")),
            Image(image: AssetImage("assets/ganadoras.png")),
            Image(image: AssetImage("assets/prime.png")),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Oferta del día",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
                child: Center(
              child: Image(
                image: AssetImage("assets/oferta.png"),
                width: 300,
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Cuidado de la piel SQIN LUXIENA",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "239.00 - 279.00",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Finaliza en 2:55:06",
                      style: TextStyle(fontSize: 17),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ofertas()),
                            );
                          },
                          child: Text("Ver todas las ofertas")),
                    ),
                  ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Tus pedidos",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    child: Center(
                  child: Image(
                    image: AssetImage("assets/viaje.png"),
                    fit: BoxFit.fill,
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: TextButton(
                      onPressed: () {}, child: Text("Ver todas tus órdenes")),
                ),
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Descubre el regalo ideal para Mamá",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      child: Center(
                    child: Image(
                      image: AssetImage("assets/regalo.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: TextButton(onPressed: () {}, child: Text("Ver más")),
                  ),
                ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Ahorra con productos reacondicionados",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      child: Center(
                    child: Image(
                      image: AssetImage("assets/renewed.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: TextButton(
                        onPressed: () {}, child: Text("Conoce Amazon Renewed")),
                  ),
                ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Descubre la tienda de hogar",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      child: Center(
                    child: Image(
                      image: AssetImage("assets/hogar.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: TextButton(onPressed: () {}, child: Text("Ver más")),
                  ),
                ]),
          ],
        ),
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
              title: Text('Comprar de nuevo'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Whis List'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => wishList())
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
