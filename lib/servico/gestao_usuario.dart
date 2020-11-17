import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartstock/modelos/usuario.dart';
import 'package:smartstock/utils/generico.dart';
import 'package:smartstock/utils/singleton.dart';

Singleton one = Singleton();

final tok = "?access_token="+one.getToken();

Future<dynamic> getUsuario() async {
  http.Response response = await http.get('http://10.0.2.2:3000/api/Users'+tok);

  return admChamadas(response, 1, "get");

}
Future<dynamic> postUsuario(obj) async {
  final response = await http.post('http://10.0.2.2:3000/api/Users'+tok,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(obj));

  return admChamadas(response, 1, "post");

}
Future<Usuario> putUsuario(String id) async {
  final response = await http.get("http://10.0.2.2:3000/api/Users/${id}"+tok);

  return admChamadas(response, 1, "post");

}
Future<Usuario> deleteUsuario(String id) async {
  final response = await http.get("http://10.0.2.2:3000/api/Users/${id}"+tok);

  return admChamadas(response, 1, "delete");

}

Future<dynamic> login(obj) async {
  print(obj);
  final response = await http.post("http://10.0.2.2:3000/api/Users/login",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(obj));

  return admChamadas(response, 3, "delete");

}