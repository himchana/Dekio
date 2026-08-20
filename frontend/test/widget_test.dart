import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/main.dart';

void main() {
  testWidgets('DEKIO app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const DekioApp());

    expect(find.byType(DekioApp), findsOneWidget);
  });
}
