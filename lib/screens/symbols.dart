import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_app1/model/symbol.dart';
import 'package:demo_app1/services/symbolservice.dart';

class Symbols extends StatefulWidget {
  @override
  SymbolsState createState() => SymbolsState();
}

class SymbolsState extends State<Symbols> {
  Symbolsservice ss = new Symbolsservice();

  late Future<List<Symbol>> futureSymbols;
  final _formkey = GlobalKey<FormState>();
  late Symbol selectedsymbol;

  int clicked = 0;

  //Declare fetch method for symbols
  Future<List<Symbol>> fetchSymbols() async {
    http.Response response = await http
        .get(Uri.parse('http://restapi.com/api/symbols/board?Board=ODD'));
    List symbols = jsonDecode(response.body);

    return symbols.map((x) => Symbol.fromJson(x)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureSymbols = ss.getSymbolsData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Symbols clicked ' + clicked.toString()),
        ),
        body: FutureBuilder<List<Symbol>>(
            future: futureSymbols,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Symbol _symbol = snapshot.data![index];
                    return ListTile(
                      title: Text(_symbol.symbol),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Form(
                                      key: _formkey,
                                      child: Column(children: <Widget>[
                                        TextFormField(
                                          initialValue: _symbol.symbol,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Symbol'),
                                        ),
                                        TextFormField(
                                          initialValue: _symbol.symbolName,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Symbol Name'),
                                        ),
                                        ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Close'))
                                      ]),
                                    ));
                              });
                        },
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Could not fetch Symbols");
              }
              return CircularProgressIndicator();
            }));
  }
}
