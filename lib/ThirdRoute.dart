import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clon_amazon/SecondRoute.dart';

class ThirdRoute extends StatefulWidget {
  @override
  thirdRoute createState() => thirdRoute();
}

class thirdRoute extends State<ThirdRoute> {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Image(
                  image: AssetImage('assets/amazon.png'),
                  fit: BoxFit.fitWidth,
                  height: 30)),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                  MyStatefulWidget(),
                ]),
          ),

        ]),
      ),
    );
  }
}

enum Opciones { crear, inicio }

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Opciones _character = Opciones.inicio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.black12),
                left: BorderSide(width: 1.0, color: Colors.black12),
                right: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                selectedTileColor: Colors.orange,
                title: const Text('Crear cuenta'),
                leading: Radio<Opciones>(
                  value: Opciones.crear,
                  groupValue: _character,
                  onChanged: (Opciones value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                selectedTileColor: Colors.orange,
                title: const Text('Inicio de sesión'),
                leading: Radio<Opciones>(
                  value: Opciones.inicio,
                  groupValue: _character,
                  onChanged: (Opciones value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 28, right: 28),
                  labelText: 'Correo (teléfono para cuentas móviles)',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10,left: 20),
                child: new SizedBox(
                  width: 350.0,
                  child: ElevatedButton(
                    child: new Text("Continuar",style: TextStyle(fontSize: 15),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                      style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 26, right: 26),
                child: Text(
                  "Al continuar, aceptas las Condiciones de uso y el Aviso de privacidad de Amazon",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 26, right: 26,top: 30,bottom: 30),
                child: Text(
                  "¿Necesitas ayuda?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
