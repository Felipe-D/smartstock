import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartstock/servico/gestao_produto.dart';
import 'package:smartstock/telas/lista/lista_produto.dart';

class CadastroProduto extends StatefulWidget {
  CadastroProduto();

  @override
  CadastroProdutoState createState() => CadastroProdutoState();
}

class CadastroProdutoState extends State<CadastroProduto> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String _titulo;
  String _cor;
  String _tamanho;
  String _quantidade;
  String _posicao;
  String _codigo;
  String _desc;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar("Cadastro de Usuários"),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _construirTextField("Titulo"),
              Container(height: 20),
              _construirTextField("Cor"),
              Container(height: 20),
              _construirTextField("Tamanho"),
              Container(height: 20),
              _construirTextField("Quantidade"),
              Container(height: 20),
              _construirTextField("Posição"),
              Container(height: 20),
              _construirTextField("Codigo"),
              Container(height: 20),
              _construirTextField("Descrição"),
              Container(height: 20),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  final obj = {                    
                    "titulo": _titulo,
                    "cor": _cor,
                    "tamanho": _tamanho,
                    "quantidade": _quantidade,
                    "posicao": _posicao,
                    "codigo": _codigo,
                    "desc": _desc,
                  };
                  postProduto(obj).then((result) {
                      // print(result);
                      Navigator.pop(context);
                    });
                  // Scaffold.of(context).showSnackBar(
                  //   SnackBar(content: Text('Processing Data')));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }

  Widget _construirTextField(String titulo) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: titulo,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          ),
        validator: (value) {
          if (value.isEmpty) {
            return 'É preciso preencher o campo';
          }
          return null;
        },
        onChanged: (String value) {
          _construirSaveField(titulo, value);
        }
      ),
    );
  }

  _construirSaveField(String titulo, String value) {
    switch (titulo) {
      case "Titulo":
        _titulo = value;
        break;
      case "Cor":
        _cor = value;
        break;
      case "Tamanho":
          _tamanho = value;
        break;
      case "Quantidade":
        _quantidade = value;
        break;
      case "Posição":
        _posicao = value;
        break;
      case "Codigo":
        _codigo = value;
        break;
      case "Descrição":
        _desc = value;
        break;
    };
  }
}
