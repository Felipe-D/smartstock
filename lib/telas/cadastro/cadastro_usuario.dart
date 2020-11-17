import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartstock/servico/gestao_usuario.dart';

class CadastroUsuario extends StatefulWidget {
  CadastroUsuario();

  @override
  CadastroUsuarioState createState() => CadastroUsuarioState();
}

class CadastroUsuarioState extends State<CadastroUsuario> {
  TextEditingController _nameController;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String _nome;
  String _email;
  String _senha;
  String _confirmasenha;

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
              _construirTextField("Usuário"),
              Container(height: 20),
              _construirTextField("Email"),
              Container(height: 20),
              _construirTextField("Senha"),
              Container(height: 20),
              _construirTextField("Confirme a senha"),
              Container(height: 20),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  final obj = {                    
                    "username": _nome,
                    "email": _email,
                    "password": _senha,
                  };
                  try {
                    postUsuario(obj).then((result) => {
                      Navigator.pop(context)
                    });
                  } catch (e) {
                    Scaffold(
                      body: Center(
                        child:Text(
                          "${e}", 
                           style: TextStyle(fontSize: 16)
                        )
                      )
                    );
                  }
                  
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
        controller: _nameController,
        validator: (value) {
          if (value.isEmpty) {
            return 'É preciso preencher o campo';
          }
          if (titulo == "Email" 
            && !RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)) {
            return 'Insira um Email válido';
          }
          if (titulo == "Senha" && _confirmasenha != _senha) {
            return 'É preciso preencher o campo';
          }
          if (titulo == "Confirme a senha" && _senha != _confirmasenha) {
            return 'É preciso preencher o campo';
          }
          return null;
        },
        onChanged: (String value) {
          _construirSaveField(titulo, value);
        },
        obscureText: (titulo == "Senha") || (titulo == "Confirme a senha") ? true : false
      ),
    );
  }

  _construirSaveField(String titulo, String value) {
    
      switch (titulo) {
        case "Usuário":
          _nome = value;
          break;
        case "Email":
          _email = value;
          break;
        case "Senha":
          _senha = value;
          break;
        case "Confirme a senha":
          _confirmasenha = value;
          break;
      };
  }
}
