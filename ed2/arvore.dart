import 'dart:collection';
import 'dart:math';

class No {
  late int valor;
  No? esquerda, direita;

  No(this.valor);
}

class ArvoreBinaria {
  No? raiz;

  No? inserir(No? raiz, int valor) {
    if (raiz == null) {
      return No(valor);
    } else {
      if (raiz.valor < valor) {
        raiz.direita = inserir(raiz.direita, valor);
      } else {
        raiz.esquerda = inserir(raiz.esquerda, valor);
      }
    }
    return raiz;
  }

  void preOrdem(No? raiz) {
    if (raiz != null) {
      print("${raiz.valor} ', end: '");
      preOrdem(raiz.esquerda);
      preOrdem(raiz.direita);
    }
  }

  void emOrdem(No? raiz) {
    if (raiz != null) {
      emOrdem(raiz.esquerda);
      print("${raiz.valor} ', end: '");
      emOrdem(raiz.direita);
    }
  }

  void posOrdem(No? raiz) {
    if (raiz != null) {
      posOrdem(raiz.esquerda);
      posOrdem(raiz.direita);
      print("${raiz.valor} ', end: '");
    }
  }

  void nivel(No? raiz) {
    if (raiz == null) return;

    Queue<No?> fila = Queue();
    fila.add(raiz);

    while (fila.isNotEmpty) {
      No? atual = fila.removeFirst();
      print("${atual!.valor} ', end: '");

      if (atual.esquerda != null) {
        fila.add(atual.esquerda);
      }

      if (atual.direita != null) {
        fila.add(atual.direita);
      }
    }
  }

  // Remove 5 elementos da árvore
  void removerElementosAleatorios(No? raiz, int quantidade) {
    Random random = Random();

    for (int i = 0; i < quantidade; i++) {
      int valorParaRemover = random.nextInt(101); // Número aleatório de 0 a 100
      print('Removendo o elemento $valorParaRemover');
      raiz = remover(raiz, valorParaRemover);
    }
  }

  No? remover(No? raiz, int valor) {
    if (raiz == null) return raiz;

    if (valor < raiz.valor) {
      raiz.esquerda = remover(raiz.esquerda, valor);
    } else if (valor > raiz.valor) {
      raiz.direita = remover(raiz.direita, valor);
    } else {
      // Nó com apenas um filho ou nenhum filho
      if (raiz.esquerda == null) {
        return raiz.direita;
      } else if (raiz.direita == null) {
        return raiz.esquerda;
      }

      // Nó com dois filhos, pega o sucessor na ordem (menor
      // na subárvore à direita)
      raiz.valor = menorValor(raiz.direita);

      // Deleta o sucessor na ordem
      raiz.direita = remover(raiz.direita, raiz.valor);
    }
    return raiz;
  }

  int menorValor(No? raiz) {
    int menorValor = raiz!.valor;
    while (raiz!.esquerda != null) {
      menorValor = raiz.esquerda!.valor;
      raiz = raiz.esquerda!;
    }
    return menorValor;
  }
}

void main() {
  ArvoreBinaria arvore = ArvoreBinaria();
  Random random = Random();

  // Inserindo 20 números aleatórios de 0 a 100 na árvore
  for (int i = 0; i < 20; i++) {
    int numeroAleatorio = random.nextInt(101); // Número aleatório de 0 a 100
    print('Inserindo o elemento $numeroAleatorio');
    arvore.raiz = arvore.inserir(arvore.raiz, numeroAleatorio);
  }

  print('\nImpressão pré-ordem:');
  arvore.preOrdem(arvore.raiz);

  print('\n\nImpressão em ordem:');
  arvore.emOrdem(arvore.raiz);

  print('\n\nImpressão pós-ordem:');
  arvore.posOrdem(arvore.raiz);

  print('\n\nImpressão em nível:');
  arvore.nivel(arvore.raiz);

  // Removendo 5 elementos da árvore e refazendo as impressões
  arvore.removerElementosAleatorios(arvore.raiz, 5);

  print('\n\nImpressão pré-ordem após remoção:');
  arvore.preOrdem(arvore.raiz);

  print('\n\nImpressão em ordem após remoção:');
  arvore.emOrdem(arvore.raiz);

  print('\n\nImpressão pós-ordem após remoção:');
  arvore.posOrdem(arvore.raiz);

  print('\n\nImpressão em nível após remoção:');
  arvore.nivel(arvore.raiz);
}
