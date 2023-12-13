import 'arvoreBinaria.dart';
import "pedido.dart";
import 'cliente.dart';
import 'quicksort.dart';
void main() {
  // Criação e inserção de pedidos na árvore

  ArvoreBinariaBusca arvore = ArvoreBinariaBusca();
  arvore.inserir(Pedido(id: 3, descricao: "Pizza", valor: 30.0, status: "Entregue"));
  arvore.inserir(Pedido(id: 1, descricao: "Hambúrguer", valor: 15.0, status: "Pendente"));
  arvore.inserir(Pedido(id: 2, descricao: "Sushi", valor: 50.0, status: "Entregue"));

  // Exibir pedidos em ordem

  print("Pedidos em ordem de ID:");
  arvore.emOrdem(arvore.raiz);
  print("\n");

  // Teste do QuickSort

  List<Cliente> clientes = [
    Cliente(id: 1, nome: "joão", endereco: "avenida r2"),
    Cliente(id: 4, nome: "gabriel", endereco: "av 2 rua santos"),
    Cliente(id: 2, nome: "maria", endereco: "avenida jalim"),
    Cliente(id: 5, nome: "jose", endereco: "rua palavra"),
    Cliente(id: 3, nome: "julia", endereco: "rua jucelino")
  ];

  Quicksort().ordenar(clientes, 0, clientes.length - 1);

  print("Clientes ordenados por id:");
  for (Cliente c in clientes) {
    print(c);
  }
}
