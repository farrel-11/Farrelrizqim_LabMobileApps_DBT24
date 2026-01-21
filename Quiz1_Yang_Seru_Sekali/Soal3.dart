import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  int randchoice = random.nextInt(100) + 1;
  stdout.write("Masukkan angka antara 1-100: ");
  String? input = stdin.readLineSync();
  int userchoice = int.parse(input!);
  
  if (userchoice == randchoice) {
    print("benar.");
  } else {
    print("salah.");
    print("Angka yang benar adalah $randchoice");
  }
}