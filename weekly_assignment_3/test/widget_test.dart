// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekly_assignment_3/main.dart';

void main() {
  testWidgets('There is a ListView', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there is a ListView
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('There are 12 ListTiles', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are 12 ListTiles
    expect(find.byType(ListTile, skipOffstage: false), findsNWidgets(12));
  });

  testWidgets('There are 12 CircleAvatars', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are 12 CircleAvatars
    expect(find.byType(CircleAvatar, skipOffstage: false), findsNWidgets(12));
  });

  testWidgets('There are 12 Text widgets with the String "I am a ListTile"', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are 12 Text widgets
    expect(find.textContaining("I am a ListTile", skipOffstage: false), findsNWidgets(12));
  });

  testWidgets('There are 12 Text widgets with the String "Index: \$index"', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are 12 Text widgets
    for (int index = 0; index < 12; index++) {
      // Verify there is a text widget with the correct index
      expect(find.text("Index: $index", skipOffstage: false), findsOneWidget);
    }
  });

  testWidgets('Clicking on a delete IconButton removes the respective ListTile', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are Text widget with index 0
    expect(find.text('Index: 0'), findsOneWidget);

    // Tap the delete button for the first ListTile
    await tester.tap(find.byType(IconButton).first);
    await tester.pumpAndSettle();

    // Verify that there are no Text widget with index 0 anymore
    expect(find.text('Index: 0'), findsNothing);
  });
}
