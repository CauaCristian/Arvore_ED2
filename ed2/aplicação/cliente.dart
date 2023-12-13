class Cliente {
  int id;
  String nome;
  String endereco;

  Cliente({required this.id, required this.nome, required this.endereco});
  @override
  String toString() {
    return 'Pedido{id: $id, nome: $nome, endereço: $endereco}';
  }
}