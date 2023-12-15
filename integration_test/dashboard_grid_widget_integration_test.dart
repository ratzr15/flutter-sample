import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_kick_starter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('Vegetables'), findsWidgets);

      // // Finds the floating action button to tap on.
      // final Finder fab = find.text('Vegetables');

      // // Emulate a tap on the floating action button.
      // await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      //  expect(find.text('Checkout'), findsOneWidget);
    });
  });
}
