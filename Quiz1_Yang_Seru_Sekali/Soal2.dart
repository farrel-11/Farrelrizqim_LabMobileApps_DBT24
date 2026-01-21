import 'dart:io';
import 'dart:math';

void main() {
  List<String> opsi = ['Gunting', 'Batu', 'Kertas'];
  
  final random = Random();
  String komputer = opsi[random.nextInt(3)];

  stdout.write("Masukkan (Gunting, Batu, Kertas): ");
  String? user = stdin.readLineSync();

  print("Komputer memilih: $komputer");

  if (user == komputer) {
    print("Seri!");
  } else if ((user == 'Gunting' && komputer == 'Kertas') ||
             (user == 'Batu' && komputer == 'Gunting') ||
             (user == 'Kertas' && komputer == 'Batu')) {
    print("Kamu Menang!");
  } else {
    print("Kamu Kalah!");
  }
}