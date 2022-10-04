// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekly_assignment_2/main.dart';

void main() {
  testWidgets('There are two TextField widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are two TextFields
    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('There is a TextField with the label "First Name"', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there is one TextField with label "First Name"
    expect(find.text("First Name"), findsOneWidget);
  });

  testWidgets('There is a TextField with the label "Last Name"', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there is one TextField with label "last Name"
    expect(find.text("Last Name"), findsOneWidget);
  });

  testWidgets('OnSubmitting a First Name and a Last Name, the Text widget shows correct output',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text("Hello John Doe"), findsNothing);

    // Verify that there is one TextField with label "Last Name"
    await tester.enterText(find.byType(TextField).first, "John");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.enterText(find.byType(TextField).last, "Doe");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.textContaining("Hello John Doe"), findsOneWidget);
  });
}
