import 'dart:io';

void main() {
  prima();
}

void prima(){
  stdout.write("Masukkan angka: ");
  String? angka = stdin.readLineSync();
  int? angkaInt = int.tryParse(angka ?? "") ?? 0;
  var condtion = true;

  if (angkaInt <= 1) {
    condtion = false;
  } else {
    for (int i = 2; i < angkaInt; i++) {
      if (angkaInt % i == 0) {
        condtion = false;
        break;
      }
    }
  }

  if (condtion) {
    print("$angka adalah bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
}
