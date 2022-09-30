import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_app1/model/symbol.dart';



class Symbols extends StatefulWidget {
  @override

  SymbolsState createState() => SymbolsState();

}
class SymbolsState extends State<Symbols>{
  //const Login({super.key});
 /* final List<String> symbols = <String>[
    'Econet',
    'Dairiboard',
    'Delta',
    'Ecocash'
  ];*/
  late Future<List<Symbol>> futureSymbols;
  int clicked = 0;

  //Declare fetch method for symbols
  Future<List<Symbol>> fetchSymbols() async{
    http.Response response = await http.get(
        Uri.parse('http://restapi.com/api/symbols/board?Board=ODD')
    );
    List symbols = jsonDecode(response.body);

    return symbols.map((symbol)=>Symbol.fromJson(symbol)).toList();
  }

  @override
  void initState(){
    super.initState();
    futureSymbols = fetchSymbols();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext   context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Symbols clicked ' + clicked.toString()),
        ),
        body: FutureBuilder<List<Symbol>>(
            future: futureSymbols,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    Symbol symbol = snapshot.data![index];
                    return ListTile(
                      title: Text(symbol.symbol),
                    );
                  },
                );
              }else if(snapshot.hasError){
               return Text("Could not fetch Symbols");
              }
              return Text("Failed to Load.");
            })
    );

  }
}
