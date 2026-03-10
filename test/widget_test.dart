// Widget tests for the Todo App.
//
// To run: flutter test test/widget_test.dart
// Note: MyApp uses SignInPage as home. Firebase is not mocked here; ensure
// Firebase is initialized in test environment if SignInPage callbacks depend on it.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/main.dart';

void main() {
  testWidgets('Sign In page renders and shows Sign In title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Sign Up link is visible on Sign In page', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.text('Dont have an account? Create one'), findsOneWidget);
  });
}
