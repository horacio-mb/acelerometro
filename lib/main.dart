import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sensors/sensors.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
      
    );
  }
}

class Inicio  extends StatefulWidget {
  Inicio ({Key key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Inicio> {
  Future<String> sendData()async{
    var response= await http.post(
      Uri.https('apiproductorhoracio.azurewebsites.net', '/api/data'),
      headers: <String, String>{
        'Content-Type':'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NameDevice": "miHuawei",
        "EventDate": DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()).toString(),
        "Event" : "Button.click"
      })
    );
    return response.body;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi app Horacio Molina"),
      ),
      body: Center(
        child: new ElevatedButton(
          onPressed: sendData,
           child: new Text("Enviar datos")
          )
      ),
    );
  }
}