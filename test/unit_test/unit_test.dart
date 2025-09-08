import 'package:test/test.dart';

int add(int a, int b) => a + b;

void main() {
  test('funksiya yoki klass metodini test qilish', () {
    expect(add(2, 3), 5); 
  });

  test('Masalan, matnni formatlash yoki oddiy hisob-kitob funksiyasini sinab ko‘ring', () {
    String formatText(String text) => text.toUpperCase();
    expect(formatText('hello'), 'HELLO'); // Matnni katta harflarga o'girishni tekshirish
  });
}