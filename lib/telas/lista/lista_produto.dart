import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:smartstock/modelos/produto.dart';
import 'package:smartstock/telas/detalhes/detalhe_produto.dart';
import 'package:smartstock/telas/cadastro/cadastro_produto.dart';

class ListaProduto extends StatelessWidget {

  ListaProduto({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: SizedBox(
            child: Column(
              children:<Widget>[
                SizedBox(
                  height:520,
                  child: FutureBuilder(
                    future: DefaultAssetBundle
                    .of(context)
                    .loadString('assets/produtos.json'),
                    builder: (context, snapshot) {
                      List<dynamic> produtos = json.decode(snapshot.data.toString());

                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          Produto produto = Produto.fromJson(produtos[index]);
                          return _construirCard(produto, context);
                        },
                        itemCount: produtos == null ? 0 : produtos.length,
                      );
                    },
                  )
                ),
                FloatingActionButton(
                  onPressed: () {
                  // Respond to button press
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroProduto()));
                  },
                  child: Icon(Icons.add),
                ),
              ]
            ) 
        ),
        appBar: _construirAppBar('Lista')
    );
  }

  Widget _construirCard(produto, context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheProduto(produto: produto)));
        },
        child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // _construirImagemCard(foto),
                _construirImagemGradienteCard(),
                _construirTituloCard(produto.titulo)
              ],
            ),
          ],
        ))
    );
  }

  // Widget _construirImagemCard(String imagem) {
  //   return Image.asset(imagem,
  //       fit: BoxFit.fill,
  //       height: 238);
  // }

  Widget _construirTituloCard(String titulo) {
    return Positioned(
        bottom: 10.0,
        left: 10.0,
        child: Text(titulo, style: TextStyle(color: Colors.white, fontSize: 20))
    );
  }

  Widget _construirImagemGradienteCard() {
    return Container(
      height: 80, decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7)
          ]
        )
      )
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo),
      centerTitle: true,
    );
  }
  
}