// Smoke tests for the MeTask intro flow.
//
// The screens past the intro read from sqflite, which has no implementation in
// a plain widget test, so these tests cover the entry point that renders
// without touching the database.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/presentation/screens/intro_screen.dart';
import 'package:todo_app/presentation/widgets/intro/float_button.dart';

void main() {
  testWidgets('MyApp boots into the intro screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Let the intro's entrance animations finish.
    await tester.pump(const Duration(seconds: 4));

    expect(find.byType(IntroScreen), findsOneWidget);
    expect(find.text('Welcome,'), findsOneWidget);
  });

  testWidgets('intro screen shows the call-to-action button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 4));

    expect(find.byType(FloatButton), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);
  });
}
