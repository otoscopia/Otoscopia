import 'dart:math';

String generateCode(String name, DateTime birthDate) {
  List<String> words = name.split(' ');
  String initials = words.map((word) => word[0]).join().toUpperCase();

  if (words.length < 4) {
    String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();
    for (int i = 0; i < 4; i++) {
      initials += alphabet[random.nextInt(alphabet.length)];
    }
  }

  String day = birthDate.day.toString().padLeft(2, '0');
  String month = birthDate.month.toString().padLeft(2, '0').substring(0, 2);
  return '$initials-$day$month';
}
