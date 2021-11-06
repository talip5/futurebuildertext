import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> _cargoDatos() async{
    await Future.delayed(Duration(seconds: 5));
    return await rootBundle.loadString('assets/datos.txt');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body: FutureBuilder(
            future: rootBundle.loadString('assets/datos.txt'),
            //future: _cargoDatos(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('ERROR : ${snapshot.error.toString()}'),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Center(
                    child: Text(snapshot.connectionState.toString()),
                  ),
                  Text(snapshot.data),

                ],
              );
            }),
      ),
    );
  }
}
