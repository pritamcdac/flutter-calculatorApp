import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/main.dart';  // Ensure this is correctly imported

void main() {
  group('Calculator Tests', () {
    testWidgets('Basic Calculator Test', (WidgetTester tester) async {
      // Build the Calculator widget
      await tester.pumpWidget(MyApp()); // Remove 'const'

      // Verify that the initial output is '0' with the larger font size
      expect(find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.data == "0" && widget.style?.fontSize == 48.0,
        description: 'Text widget with "0" and large font size',
      ), findsOneWidget);

      // Simulate button presses
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('+'));
      await tester.pump();
      await tester.tap(find.text('2'));
      await tester.pump();
      await tester.tap(find.text('='));
      await tester.pump();

      // Verify the output is "1+2"
      expect(find.text('1+2'), findsOneWidget);
    });

    testWidgets('Clear Button Test', (WidgetTester tester) async {
      // Build the Calculator widget
      await tester.pumpWidget(MyApp()); // Remove 'const'

      // Simulate pressing the number '3'
      await tester.tap(find.text('3'));
      await tester.pump();

      // Simulate pressing the clear button ('C')
      await tester.tap(find.text('C'));
      await tester.pump();

      // Verify that the output is now '0'
      expect(find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.data == "0" && widget.style?.fontSize == 48.0,
        description: 'Text widget with "0" and large font size after clearing',
      ), findsOneWidget);
    });
  });
}
