// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('LOTR Quiz app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiddleEarthQuizApp());

    // Wait for splash screen to load
    await tester.pump();
    
    // Verify that the app starts (we can look for splash or main elements)
    // Since we have an animated splash, we might need to wait
    await tester.pump(const Duration(seconds: 1));
    
    // The app should load without crashing
    expect(tester.takeException(), isNull);
  });
}
