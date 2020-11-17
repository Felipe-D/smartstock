import 'package:flutter/material.dart';
import 'package:smartstock/modelos/usuario.dart';
import 'package:smartstock/servico/gestao_usuario.dart';
import '../detalhes/detalhe_usuario.dart';

class ListaUsuario extends StatelessWidget {

  ListaUsuario({Key key}): super(key: key);

  final Future<dynamic> futureList = getUsuario();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: SizedBox(
            child: FutureBuilder(
              future: futureList,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  print(snapshot.data);
                  if(snapshot.data.usuarios != null){
                    List<dynamic> usuarios = snapshot.data.usuarios;

                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        Usuario usuario = usuarios[index];
                        return _construirCard(usuario, context);
                      },
                      itemCount: usuarios == null ? 0 : usuarios.length,
                    );
                  }
                  
                    return Scaffold(
                      body: Center(
                        child:Text(
                          "Sem dados para exibição", 
                         style: TextStyle(fontSize: 16)
                        )
                      )
                    );
                } else if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child:Text(
                        "${snapshot.error}", 
                         style: TextStyle(fontSize: 16)
                      )
                    )
                  );
                }
                return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator()
                    ) 
                );
              },
            )
        ),
        appBar: _construirAppBar('Usuarios')
    );
  }

  Widget _construirCard(usuario, context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheUsuario(usuario: usuario)));
        },
        child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // _construirImagemCard(foto),
                _construirImagemGradienteCard(),
                _construirTituloCard(usuario.username)
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