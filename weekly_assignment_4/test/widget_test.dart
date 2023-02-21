// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
<<<<<<< HEAD

import 'package:weekly_assignment_4/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
=======
import 'package:weekly_assignment_4/main.dart';

void main() {
  testWidgets('There are two buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that there are two buttons
    expect(find.bySubtype<ButtonStyleButton>(), findsNWidgets(2));
  });

  testWidgets('Clicking on first button take you to NavigationBar screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Click on the first Button
    await tester.tap(find.bySubtype<ButtonStyleButton>().first);

    // Wait for animations to finish
    await tester.pumpAndSettle();

    // Verify that there is a BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Clicking on each button on the BottomNavigationBar shows the respective text',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Click on the first Button
    await tester.tap(find.bySubtype<ButtonStyleButton>().first);

    // Wait for animations to finish
    await tester.pumpAndSettle();

    // Verify that there is a BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Tap the home icon for the home screen
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Home').hitTestable(),
        ),
        findsOneWidget);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Profile').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Settings').hitTestable(),
        ),
        findsNothing);

    // Tap the person icon for the profile page
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Home').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Profile').hitTestable(),
        ),
        findsOneWidget);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Settings').hitTestable(),
        ),
        findsNothing);

    // Tap the settings icon for the settings page
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Home').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Profile').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Settings').hitTestable(),
        ),
        findsOneWidget);
  });

  testWidgets('Clicking on second button take you to NavigationRail screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Click on the first Button
    await tester.tap(find.bySubtype<ButtonStyleButton>().last);

    // Wait for animations to finish
    await tester.pumpAndSettle();

    // Verify that there is a BottomNavigationBar
    expect(find.byType(NavigationRail), findsOneWidget);
  });

  testWidgets('Clicking on each button on the NavigationRail shows the respective text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Click on the first Button
    await tester.tap(find.bySubtype<ButtonStyleButton>().last);

    // Wait for animations to finish
    await tester.pumpAndSettle();

    // Verify that there is a BottomNavigationBar
    expect(find.byType(NavigationRail), findsOneWidget);

    // Tap the home icon for the home screen
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Favorite').hitTestable(),
        ),
        findsOneWidget);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Bookmark').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Star').hitTestable(),
        ),
        findsNothing);

    // Tap the person icon for the profile page
    await tester.tap(find.byIcon(Icons.bookmark_border));
    await tester.pumpAndSettle();
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Favorite').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Bookmark').hitTestable(),
        ),
        findsOneWidget);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Star').hitTestable(),
        ),
        findsNothing);

    // Tap the settings icon for the settings page
    await tester.tap(find.byIcon(Icons.star_border));
    await tester.pumpAndSettle();
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Favorite').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Bookmark').hitTestable(),
        ),
        findsNothing);
    expect(
        find.descendant(
          of: find.byType(IndexedStack),
          matching: find.text('Star').hitTestable(),
        ),
        findsOneWidget);
  });

  testWidgets('Clicking the back button on BottomNavigationBar screen take you back to main screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Click on the first Button
    await tester.tap(find.bySubtype<ButtonStyleButton>().first);

    // Wait for animations to finish
    await tester.pumpAndSettle();

    // Click on the BackButton
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.bySubtype<ButtonStyleButton>(), findsNWidgets(2));
  });

  testWidgets('Clicking the back button on NavigationRail screen take you back to main screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Click on the first Button
    await tester.tap(find.bySubtype<ButtonStyleButton>().last);

    // Wait for animations to finish
    await tester.pumpAndSettle();

    // Click on the BackButton
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.bySubtype<ButtonStyleButton>(), findsNWidgets(2));
>>>>>>> d09dc868e52ed982378c8ff2e129b5420552c85e
  });
}
