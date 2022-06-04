import 'package:clon_amazon/PrincipalRoute.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clon_amazon/ThirdRoute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: <Widget>[
            Container(height: 40),
            Image(image: AssetImage("assets/Amazon-Logo.png"),width: 200,height: 150,),
            Text("Ingresar a tu cuenta",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 24,top: 18),
                child: Text("Ver tu lista de deseos",
                  style: TextStyle(fontSize: 18),),)
            ],),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 24,top: 18),
                child: Text("Busca y reordena compras anteriores",
                  style: TextStyle(fontSize: 18),),)
            ],),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 24,top: 18),
                child: Text("Rastrea tus compras",
                  style: TextStyle(fontSize: 18),),)
            ],),
            new SizedBox(
              width: 370.0,
              child: ElevatedButton(
                  child: new Text("¿Ya eres cliente? Iniciar sesión.",style: TextStyle(fontSize: 15),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdRoute()),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black)),
            ),
            new SizedBox(
              width: 370.0,
              child: ElevatedButton(
                  child: new Text("¿Nuevo en Amazon.com.mx? Crea una cuenta",style: TextStyle(fontSize: 15),),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdRoute())
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.grey[400],onPrimary: Colors.black)),
            ),
            new SizedBox(
              width: 370.0,
              child: ElevatedButton(
                  child: new Text("Omitir inicio de sesión",style: TextStyle(fontSize: 15),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrincipalRoute()),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.grey[400],onPrimary: Colors.black)),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}