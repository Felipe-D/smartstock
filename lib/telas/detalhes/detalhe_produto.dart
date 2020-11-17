import 'package:flutter/material.dart';
import 'package:smartstock/modelos/produto.dart';

class DetalheProduto extends StatelessWidget {

  final Produto produto;

  DetalheProduto({Key key, @required this.produto}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirTituloDetalhes(produto.titulo),
          // _construirSubtitulosDetalhes('Cor'),
          // _construirColuna(produto.cor),
          // _construirSubtitulosDetalhes('Tamanho'),
          _construirLinhaDetalhes('Cor', produto.cor),
          _construirLinhaDetalhes('Tamanho', produto.tamanho),
          _construirLinhaDetalhes('Quantidade', produto.quantidade),
          _construirLinhaDetalhes('Posição', produto.posicao),
          // _construirSubtitulosDetalhes('Quantidade'),
          // _construirTextoDetalhes(produto.quantidade),
          // _construirSubtitulosDetalhes('Posição'),
          // _construirTextoDetalhes(produto.posicao),
          _construirSubtitulosDetalhes('Descrição'),
          _construirTextoDetalhes(produto.desc)
        ],
      ),
      appBar: _construirAppBar('Produtos'),
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