import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:smartstock/modelos/menu.dart';
import 'package:smartstock/telas/lista/lista_usuario.dart';
import '../lista/lista_produto.dart';
import '../cadastro/cadastro_usuario.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
        body: SizedBox(
            child: FutureBuilder(
              future: DefaultAssetBundle
                .of(context)
                .loadString('assets/menu.json'),
              builder: (context, snapshot) {
                List<dynamic> menus = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                  Menu menu = Menu.fromJson(menus[index]);
                  return _construirCard(menu);
                },
                  itemCount: menus == null ? 0 : menus.length,
                );
              },
            )
        ),
        appBar: _construirAppBar('SmartStock')
    );
  }

  Widget _construirCard(menu) {
    return GestureDetector(
        onTap: () {
          (() {
            if(menu.titulo == 'Lista'){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaProduto()));
            } else if (menu.titulo == 'Usuarios'){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaUsuario()));
            }
          } ());
        },
        child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // _construirImagemCard(foto),
                _construirImagemGradienteCard(),
                _construirTituloCard(menu.titulo)
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