
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smartstock/modelos/produto.dart';
import 'package:smartstock/modelos/usuario.dart';
import 'package:smartstock/modelos/autenticacao.dart';

admChamadas(dynamic response, int tipo, String verbo) async {

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    if(tipo == 1 && verbo == "get"){      
      return UsuarioLista.fromJson(jsonDecode(response.body));

    } else if(tipo == 1 && verbo == "post"){      
      return Usuario.fromJson(jsonDecode(response.body));

    }  else if(tipo == 3){ //login
      return Autenticacao.fromJson(jsonDecode(response.body));
    }else if(tipo == 1 && verbo == "get"){
      return ProdutoLista.fromJson(jsonDecode(response.body));  

    }else if(tipo == 1 && verbo == "post"){
      return Produto.fromJson(jsonDecode(response.body));
      
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    switch (verbo) {
      case "get":
        return throw Exception('Falha ao recuperar os dados');
        
        break;
      case "post":
        return throw Exception('Falha no envio');
        
        break;
      case "delete":     
        return throw Exception('Falha na operação');
        
        break;
      default:
    }
  }
}