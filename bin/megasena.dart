import 'dart:io';

void main() {
  //Entrada
  int n = 60;
  int r = 6;

  List combinations = generate(n, r);

  var out = File('output.txt').openWrite();
  for (int i = 0; i < combinations.length; i++) {
    out.write('${combinations[i]}\n');
    //print('${combinations[i]}\n');
  }
  out.close();
  int qtdJogos = combinations.length;
  print("Foram Gerados $qtdJogos Combinações");
}

List helper(List combinations, List data, int start, int end, int index) {
  if (index == data.length) {
    List combination = [...data];
    combinations.add(combination);
  } else if (start <= end) {
    data[index] = start;
    combinations = helper(combinations, data, start + 1, end, index + 1);
    combinations = helper(combinations, data, start + 1, end, index);
  }

  return combinations;
}

List generate(int n, int r) {
  List combinations = [];
  List data = List<int>.generate(r, (i) => 0);

  combinations = helper(combinations, data, 1, n, 0);
  return combinations;
}
