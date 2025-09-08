import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Butun sahifaning ishlashini test qilish uchun integration test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SecondScreen()),
                    );
                  },
                  child: Text('Go to Second Screen'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Go to Second Screen'), findsOneWidget);
      await tester.tap(find.text('Go to Second Screen'));
      await tester.pumpAndSettle();
      expect(
        find.text('Second Screen'),
        findsOneWidget,
      ); // Ikkinchi ekran ochilishini tekshirish
    },
  );
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Second Screen')));
  }
}
