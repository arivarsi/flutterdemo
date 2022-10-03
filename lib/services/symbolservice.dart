import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:demo_app1/model/symbol.dart';
class Symbolsservice {
//Get Symbols from service
  Future<List<Symbol>> getSymbolsData() async {
    var response = await http.get(
        Uri.parse('http://restapi.com/api/symbols/board?Board=ODD'));
    /* Object newobj = '[{"SYMBOL": "AFDS.ZW","SYMBOL_ID": "50","COMPANYID": "1","ACTIVE": "1","ISIN": "ZW0009011025","SYMBOLNAME": "AFDIS DISTILLERS LIMITED", "SYMBOL_TYPE_ID": "1","DEPOSITORY_ID": "2"},{"SYMBOL": "ASUN.ZW", "SYMBOL_ID": "54","COMPANYID": "2","ACTIVE": "1","ISIN": "ZW0009012080","SYMBOLNAME": "AFRICAN SUN LIMITED","SYMBOL_TYPE_ID": "1","DEPOSITORY_ID": "2"}]';
  var resp = jsonEncode(newobj);*/

    List data = json.decode(response.body);

    //Map<String, dynamic> map = json.decode(response.body);
    List<Symbol> realdata = data.map((x) => Symbol.fromJson(x)).toList();

    return realdata;
  }
}