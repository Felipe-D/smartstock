class Autenticacao {
  String id;
  int ttl;
  String created;
  String userId;

  Autenticacao(
      {this.id,
        this.ttl,
        this.created,
        this.userId});

  Autenticacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ttl = json['ttl'];
    created = json['created'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ttl'] = this.ttl;
    data['created'] = this.created;
    data['userId'] = this.userId;
    return data;
  }
}
