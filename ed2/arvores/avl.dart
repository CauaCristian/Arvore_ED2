import 'dart:collection';
import 'dart:ffi';
import 'dart:math';

class NoAVL<T> {
  T valor;
  NoAVL<T>? esquerda;
  NoAVL<T>? direita;
  int altura;

  NoAVL(this.valor, {this.esquerda, this.direita}) : altura = 1;
}

class ArvoreAVL<T extends Comparable<T>> {
  NoAVL<T>? raiz;

  // Insere vários valores a partir de um array
  void inserirVarios(List<T> valores) {
    for (var valor in valores) {
      inserir(valor);
    }
  }

  // Insere um valor na árvore
  void inserir(T valor) {
    raiz = _inserir(raiz, valor);
  }

  NoAVL<T>? _inserir(NoAVL<T>? no, T valor) {
    if (no == null) {
      return NoAVL<T>(valor);
    }

    if (valor.compareTo(no.valor) < 0) {
      no.esquerda = _inserir(no.esquerda, valor);
    } else if (valor.compareTo(no.valor) > 0) {
      no.direita = _inserir(no.direita, valor);
    } else {
      return no;
    }

    no.altura = 1 + _alturaMaxima(no.esquerda, no.direita);
    return _balancear(no);
  }

  // Balanceamento do nó
  NoAVL<T>? _balancear(NoAVL<T> no) {
    int balanceamento = _getBalanceamento(no);

    if (balanceamento > 1) {
      if (_getBalanceamento(no.esquerda) < 0) {
        no.esquerda = _rotacionarEsquerda(no.esquerda!);
      }
      return _rotacionarDireita(no);
    }

    if (balanceamento < -1) {
      if (_getBalanceamento(no.direita) > 0) {
        no.direita = _rotacionarDireita(no.direita!);
      }
      return _rotacionarEsquerda(no);
    }

    return no;
  }

  // Rotação à direita
  NoAVL<T> _rotacionarDireita(NoAVL<T> y) {
    NoAVL<T> x = y.esquerda!;
    NoAVL<T>? T2 = x.direita;

    x.direita = y;
    y.esquerda = T2;

    y.altura = _alturaMaxima(y.esquerda, y.direita) + 1;
    x.altura = _alturaMaxima(x.esquerda, x.direita) + 1;

    return x;
  }

  // Rotação à esquerda
  NoAVL<T> _rotacionarEsquerda(NoAVL<T> x) {
    NoAVL<T> y = x.direita!;
    NoAVL<T>? T2 = y.esquerda;

    y.esquerda = x;
    x.direita = T2;

    x.altura = _alturaMaxima(x.esquerda, x.direita) + 1;
    y.altura = _alturaMaxima(y.esquerda, y.direita) + 1;

    return y;
  }

  // Calcula a altura máxima entre dois nós
  int _alturaMaxima(NoAVL<T>? a, NoAVL<T>? b) {
    return max(a?.altura ?? 0, b?.altura ?? 0);
  }

  // Obtém o balanceamento do nó
  int _getBalanceamento(NoAVL<T>? no) {
    if (no == null) {
      return 0;
    }
    return (_altura(no.esquerda) - _altura(no.direita));
  }

  // Obtém a altura de um nó
  int _altura(NoAVL<T>? no) {
    return no?.altura ?? 0;
  }

  // Imprime a árvore em ordem
  void imprimirEmOrdem() {
    var inicio = DateTime.now();
    _imprimirEmOrdem(raiz);
    var fim = DateTime.now();
    var duracao = fim.difference(inicio);
    print('Tempo para imprimir em ordem: ${duracao.inSeconds} segundos');
  }

  void _imprimirEmOrdem(NoAVL<T>? no) {
    if (no != null) {
      _imprimirEmOrdem(no.esquerda);
      print(no.valor);
      _imprimirEmOrdem(no.direita);
    }
  }
}

void main() {
  var arvore = ArvoreAVL<int>();
  arvore.inserirVarios([10, 20, 30, 40, 50, 25]);
  print('Árvore AVL em ordem:');
  arvore.imprimirEmOrdem();
}
