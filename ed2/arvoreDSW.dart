import 'dart:math';

class Node {
  late int data;
  Node? left, right;

  Node(this.data);
}

class BinaryTree {
  Node? root;

  void insert(int data) {
    root = _insertRec(root, data);
  }

  Node? _insertRec(Node? root, int data) {
    if (root == null) {
      return Node(data);
    }

    if (data < root.data) {
      root.left = _insertRec(root.left, data);
    } else if (data > root.data) {
      root.right = _insertRec(root.right, data);
    }

    return root;
  }

  void inOrderTraversal(Node? root) {
    if (root != null) {
      inOrderTraversal(root.left);
      print(root.data);
      inOrderTraversal(root.right);
    }
  }
}

void main() {
  var random = Random();
  BinaryTree tree = BinaryTree();

  // Adiciona 100 números aleatórios de 0 a 100
  for (int i = 0; i < 100; i++) {
    tree.insert(random.nextInt(101));
  }

  // Adiciona mais 20 números à árvore
  for (int i = 0; i < 20; i++) {
    tree.insert(random.nextInt(101));
  }

  // Imprime a árvore antes do balanceamento
  print("Árvore antes do balanceamento:");
  tree.inOrderTraversal(tree.root);
}

