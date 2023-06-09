import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:responsiveapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("app text", (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final cardElement = find.byType(Card).last;

    await tester.tap(cardElement);
  await tester.drag(find.byKey(Key('GridViewKey')), const Offset(0.0, -300));

await tester.pumpAndSettle();

  });
}
