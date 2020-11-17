import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartstock/modelos/produto.dart';
import 'package:smartstock/utils/generico.dart';
import 'package:smartstock/utils/singleton.dart';

Singleton one = Singleton();

final tok = "?access_token="+one.getToken();

Future<dynamic> getProduto() async {
  final response = await http.get('http://10.0.2.2:3000/api/product'+tok);

  return admChamadas(response, 2, "get");

}
Future<dynamic> postProduto(obj) async { 
  final response = await http.post('http://10.0.2.2:3000/api/product'+tok, 
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(obj)
  );

  return admChamadas(response, 2, "post");

}
Future<Produto> putProduto(String id) async {
  final response = await http.get("http://10.0.2.2:3000/api/product/${id}"+tok);

  return admChamadas(response, 2, "post");

}
Future<Produto> deleteProduto(String id) async {
  final response = await http.get("http://10.0.2.2:3000/api/product/${id}"+tok);

  return admChamadas(response, 2, "delete");

}