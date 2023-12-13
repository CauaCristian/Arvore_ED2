import 'cliente.dart';
class Quicksort{

  void ordenar(List<Cliente> clientes, int inicio, int fim) {
    if (inicio < fim) {
      int pivo = particionar(clientes, inicio, fim);
      ordenar(clientes, inicio, pivo - 1);
      ordenar(clientes, pivo + 1, fim);
    }
  }

  int particionar(List<Cliente> clientes, int inicio, int fim) {
    int pivo = clientes[fim].id;
    int i = inicio - 1;

    for (int j = inicio; j < fim; j++) {
      if (clientes[j].id <= pivo) {
        i++;
        Cliente temp = clientes[i];
        clientes[i] = clientes[j];
        clientes[j] = temp;
      }
    }

    Cliente temp = clientes[i + 1];
    clientes[i + 1] = clientes[fim];
    clientes[fim] = temp;

    return i + 1;
  }
}