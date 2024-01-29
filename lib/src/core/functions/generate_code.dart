import 'dart:math';

String generateCode(String name, DateTime birthDate) {
  List<String> words = name.split(' ');
  String initials = words.map((word) => word[0]).join().toUpperCase();

  if (words.length < 4) {
    String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();
    switch (words.length) {
      case 1:
        for (int i = 0; i < 3; i++) {
          initials += alphabet[random.nextInt(alphabet.length)];
        }
        break;
      case 2:
        for (int i = 0; i < 2; i++) {
          initials += alphabet[random.nextInt(alphabet.length)];
        }
        break;
      case 3:
        for (int i = 0; i < 1; i++) {
          initials += alphabet[random.nextInt(alphabet.length)];
        }
        break;
    }
  }

  String day = birthDate.day.toString().padLeft(2, '0');
  String month = birthDate.month.toString().padLeft(2, '0').substring(0, 2);
  return '$initials-$day$month';
}
