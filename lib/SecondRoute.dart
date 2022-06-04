import 'package:clon_amazon/WishList.dart';
import 'package:flutter/material.dart';
import 'package:clon_amazon/PrincipalRoute.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 170,
          height: 170,
          child: Image.asset("assets/amazon.png"),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10,top: 23),
                child: Text("Iniciar sesión",
                  style: TextStyle(fontSize: 23),),)
            ],),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10,top: 13,bottom: 15),
                child: Text("Correo",
                  style: TextStyle(fontSize: 16),),),
              Padding(padding: EdgeInsets.only(left: 10,top: 13,bottom: 15),
                child: Text("Cambiar",
                  style: TextStyle(fontSize: 16,color: Colors.blue),),),
            ],
            ),
            new SizedBox(
              width: 380,
              child:TextField(
                onChanged: (text) {
                  print("First text field: $text");
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amazon contraseña',

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Row(

                children: <Widget>[
                  Checkbox(value: true,),
                  Column(
                    children: <Widget>[
                      Text("Mostrar",textAlign: TextAlign.left,),
                      Text("Contraseña",textAlign: TextAlign.left,),
                    ],
                  ),
                ]
              ),
              Padding(padding: EdgeInsets.only(top: 13,bottom: 15),
                child: Column(

                  children: <Widget>[
                    Text("Has olvidado la",
                      style: TextStyle(fontSize: 16,color: Colors.blue),),
                    Text("contraseña",
                      style: TextStyle(fontSize: 16,color: Colors.blue),)
                  ],
                ),),
            ],),
            new SizedBox(
              width: 370.0,
              height: 50,
              child: ElevatedButton(
                child: new Text("Iniciar sesión",style: TextStyle(fontSize: 15),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrincipalRoute()),
                  );
                },
                  style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black)),
            ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20,top: 50,bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 10),
                    child: Text("Condiciones de uso",
                      style: TextStyle(fontSize: 16,color: Colors.blue),),),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child: Text("Aviso de privacidad",
                        style: TextStyle(fontSize: 16,color: Colors.blue),),),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child: Text("Ayuda",
                        style: TextStyle(fontSize: 16,color: Colors.blue),),),
                  ],
                ),),
            ],
          ),
            Text("1996-2021, Amazon.comm Inc. o afiliados. Todos los derechos reservados",
            style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}