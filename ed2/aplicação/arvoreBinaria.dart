import 'pedido.dart';

class NoArvore {
  Pedido pedido;
  NoArvore? esquerda;
  NoArvore? direita;

  NoArvore(this.pedido);
}

class ArvoreBinariaBusca {
  NoArvore? raiz;

  void inserir(Pedido pedido) {
    raiz = _inserirNo(raiz, pedido);
  }

  NoArvore _inserirNo(NoArvore? no, Pedido pedido) {
    if (no == null) {
      return NoArvore(pedido);
    }
    if (pedido.id < no.pedido.id) {
      no.esquerda = _inserirNo(no.esquerda, pedido);
    } else if (pedido.id > no.pedido.id) {
      no.direita = _inserirNo(no.direita, pedido);
    }
    return no;
  }

  Pedido? buscar(int id) {
    return _buscarNo(raiz, id)?.pedido;
  }

  NoArvore? _buscarNo(NoArvore? no, int id) {
    if (no == null || no.pedido.id == id) {
      return no;
    }
    if (id < no.pedido.id) {
      return _buscarNo(no.esquerda, id);
    }
    return _buscarNo(no.direita, id);
  }

  void emOrdem(NoArvore? no) {
    if (no != null) {
      emOrdem(no.esquerda);
      print(no.pedido);
      emOrdem(no.direita);
    }
  }
}