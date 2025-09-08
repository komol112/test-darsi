import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Biror UI elementi (masalan, tugma yoki matn maydoni) to‘g‘ri ishlashini test qilish', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('Hello, Flutter!'),
      ),
    ));
    expect(find.text('Hello, Flutter!'), findsOneWidget); // Matnni topishni tekshirish
  });

  testWidgets('Masalan, tugma bosilganda matn o‘zgarishini sinab ko‘ring', (WidgetTester tester) async {
    String text = 'Initial';
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) => Scaffold(
          body: Column(
            children: [
              Text(text),
              ElevatedButton(
                onPressed: () => setState(() => text = 'Changed'),
                child: Text('Click me'),
              ),
            ],
          ),
        ),
      ),
    ));
    expect(find.text('Initial'), findsOneWidget);
    await tester.tap(find.text('Click me'));
    await tester.pump();
    expect(find.text('Changed'), findsOneWidget); // Tugma bosilganda matn o'zgarishini tekshirish
  });
}