class Pedido {
  int id;
  String descricao;
  double valor;
  String status;

  Pedido({required this.id, required this.descricao, required this.valor, required this.status});

  @override
  String toString() {
    return 'Pedido{id: $id, descricao: $descricao, valor: $valor, status: $status}';
  }
}