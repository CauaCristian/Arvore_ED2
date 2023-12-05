class TreeNode {
  int key;
  TreeNode? parent;
  TreeNode? left;
  TreeNode? right;
  bool isRed;

  TreeNode(this.key, {this.parent, this.left, this.right, this.isRed = true});
}

class RedBlackTree {
  TreeNode? root;

  // Função para inserir um nó na árvore Rubro-Negra
  void insert(int key) {
    TreeNode node = TreeNode(key);
    if (root == null) {
      root = node;
      node.isRed = false; // O nó raiz deve ser preto
    } else {
      _insertRecursive(root!, node);
      _fixInsert(node);
    }
  }

  // Função para realizar a inserção recursiva
  void _insertRecursive(TreeNode current, TreeNode node) {
    if (node.key < current.key) {
      if (current.left == null) {
        current.left = node;
        node.parent = current;
      } else {
        _insertRecursive(current.left!, node);
      }
    } else {
      if (current.right == null) {
        current.right = node;
        node.parent = current;
      } else {
        _insertRecursive(current.right!, node);
      }
    }
  }

  // Função para corrigir a propriedade de Rubro-Negro após a inserção
  void _fixInsert(TreeNode node) {
    while (node != root && node.parent!.isRed) {
      if (node.parent == node.parent!.parent!.left) {
        TreeNode uncle = node.parent!.parent!.right!;
        if (uncle != null && uncle.isRed) {
          node.parent!.isRed = false;
          uncle.isRed = false;
          node.parent!.parent!.isRed = true;
          node = node.parent!.parent!;
        } else {
          if (node == node.parent!.right) {
            node = node.parent!;
            _leftRotate(node);
          }
          node.parent!.isRed = false;
          node.parent!.parent!.isRed = true;
          _rightRotate(node.parent!.parent!);
        }
      } else {
        TreeNode uncle = node.parent!.parent!.left!;
        if (uncle != null && uncle.isRed) {
          node.parent!.isRed = false;
          uncle.isRed = false;
          node.parent!.parent!.isRed = true;
          node = node.parent!.parent!;
        } else {
          if (node == node.parent!.left) {
            node = node.parent!;
            _rightRotate(node);
          }
          node.parent!.isRed = false;
          node.parent!.parent!.isRed = true;
          _leftRotate(node.parent!.parent!);
        }
      }
    }
    root!.isRed = false;
  }

  // Função para realizar uma rotação à esquerda
  void _leftRotate(TreeNode node) {
    TreeNode rightChild = node.right!;
    node.right = rightChild.left;
    if (rightChild.left != null) {
      rightChild.left!.parent = node;
    }
    rightChild.parent = node.parent;
    if (node.parent == null) {
      root = rightChild;
    } else if (node == node.parent!.left) {
      node.parent!.left = rightChild;
    } else {
      node.parent!.right = rightChild;
    }
    rightChild.left = node;
    node.parent = rightChild;
  }

  // Função para realizar uma rotação à direita
  void _rightRotate(TreeNode node) {
    TreeNode leftChild = node.left!;
    node.left = leftChild.right;
    if (leftChild.right != null) {
      leftChild.right!.parent = node;
    }
    leftChild.parent = node.parent;
    if (node.parent == null) {
      root = leftChild;
    } else if (node == node.parent!.right) {
      node.parent!.right = leftChild;
    } else {
      node.parent!.left = leftChild;
    }
    leftChild.right = node;
    node.parent = leftChild;
  }
}

void main() {
  RedBlackTree rbTree = RedBlackTree();
  
  // Inserir elementos na árvore Rubro-Negra
  rbTree.insert(10);
  rbTree.insert(20);
  rbTree.insert(30);
  
  // Outras operações podem ser realizadas aqui
}
