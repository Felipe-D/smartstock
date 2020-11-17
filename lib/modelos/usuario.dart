class UsuarioLista{
  final List<Usuario> usuarios;

  UsuarioLista({this.usuarios});


  factory UsuarioLista.fromJson(List<dynamic> parsedJson) {

    List<Usuario> usuarios = new List<Usuario>();
    usuarios =  parsedJson.map((i)=>Usuario.fromJson(i)).toList();
    
    return new UsuarioLista(usuarios:usuarios);  
    
  }

}
class Usuario {
  final String username;
  final String email;
  final String password;

  Usuario(
      {this.username,
        this.email,
        this.password});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return new Usuario(
      username : json['username'],
      email : json['email'],
      password : json['password'],
    );  
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
