import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Hisoblagich funksiyasini alohida test qilish', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CounterWidget(),
      ),
    ));

    expect(find.text('0'), findsOneWidget); // Dastlabki holat
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('1'), findsOneWidget); // Hisoblagich oshishi
  });
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_counter'),
        FloatingActionButton(
          onPressed: () => setState(() => _counter++),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}