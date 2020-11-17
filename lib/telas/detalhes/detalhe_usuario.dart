import 'package:flutter/material.dart';
import 'package:smartstock/modelos/usuario.dart';

class DetalheUsuario extends StatelessWidget {

  final Usuario usuario;

  DetalheUsuario({Key key, @required this.usuario}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirTituloDetalhes(usuario.username),
          _construirLinhaDetalhes('Email', usuario.email),
        ],
      ),
      appBar: _construirAppBar('Usuario'),
    );
  }

  // Widget _construirImagemDetalhes(String imagem) {
  //   return Image.asset(imagem);
  // }

  Widget _construirTituloDetalhes(String titulo) {
    return Center(
      child: Text(titulo, style: TextStyle(color: Colors.deepOrange, fontSize: 30)),
    );
  }

  Widget _construirSubtitulosDetalhes(String subtitulo) {
    return Center(
        child: Text(subtitulo, style: TextStyle(fontSize: 20))
    );
  }

  Widget _construirTextoDetalhes(String texto) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Text(texto)
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }

  Widget _construirLinhaDetalhes(String titulo, String valor) {
    return Row(
      children: <Widget>[
        _construirColuna(titulo, 22),
        _construirColuna(valor, 16)
      ],
    );
  }

  Widget _construirColuna(String dado, double fonte) {
    return  Expanded(
      child:
      Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(dado, style: TextStyle( fontWeight: FontWeight.bold,
               fontSize: fonte)
              )],
          )
        )
    );
  }
}