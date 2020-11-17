class ProdutoLista{
  final List<Produto> produtos;

  ProdutoLista({this.produtos});

  factory ProdutoLista.fromJson(List<dynamic> parsedJson) {

    List<Produto> produtos = new List<Produto>();
    produtos =  parsedJson.map((i)=>Produto.fromJson(i)).toList();
    
    return new ProdutoLista(produtos:produtos);  
    
  }

}
class Produto {
  String titulo;
  String cor;
  String tamanho;
  String quantidade;
  String posicao;
  String codigo;
  String desc;

  Produto(
      {this.titulo,
        this.cor,
        this.tamanho,
        this.quantidade,
        this.posicao,
        this.codigo,
        this.desc});

  Produto.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    cor = json['cor'];
    tamanho = json['tamanho'];
    quantidade = json['quantidade'];
    posicao = json['posicao'];
    codigo = json['codigo'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['cor'] = this.cor;
    data['tamanho'] = this.tamanho;
    data['quantidade'] = this.quantidade;
    data['posicao'] = this.posicao;
    data['codigo'] = this.codigo;
    data['desc'] = this.desc;
    return data;
  }
}
