import 'dart:convert';

import 'package:smartstock/telas/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartstock/servico/gestao_usuario.dart';
import 'package:smartstock/telas/cadastro/cadastro_usuario.dart';
import 'package:smartstock/utils/singleton.dart';

Singleton one = Singleton();

class Login extends StatefulWidget {
  Login();

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  // TextEditingController _nameController;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String _nome;
  String _senha;

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar("Login de Usuários"),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _construirTextField("Usuário"),
              Container(height: 20),
              _construirTextField("Senha"),
              Container(height: 20),
              RaisedButton(
                child: Text("Conectar"),
                onPressed: () {
                  print(this._nome);
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  final obj = {                    
                    "username": this._nome,
                    "password": this._senha,
                  };
                  print(obj);

                    login(obj).then((result) {
                      _irParaHome(result);
                    });
                  }
              }),
              new GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroUsuario()));

                },
                child: new Text("Não possui cadastro ? Clique aqui"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }

  _irParaHome(result){ 
    print(result.id);
    one.setToken(result.id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
        // controller: _nameController,
        validator: (value) {
          if (value.isEmpty) {
            return 'É preciso preencher o campo';
          }
          if (titulo == "Email" 
            && !RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)) {
            return 'Insira um Email válido';
          }
          return null;
        },
        onSaved: (String value) {
          setState(() {
            _construirSaveField(titulo, value);
          });
          
        },
        onChanged: (String value) {
          setState(() {
            _construirSaveField(titulo, value);
          });
        },
        obscureText: titulo == "Senha" ? true : false
        ,
      ),
    );
  }

  _construirSaveField(String titulo, String value) {
    print(value);
    
      switch (titulo) {
        case "Usuário":
          this._nome = value;
          print(this._nome);
          break;
        case "Senha":
          this._senha = value;
          print(this._senha);
          break;
      };
  }
}
