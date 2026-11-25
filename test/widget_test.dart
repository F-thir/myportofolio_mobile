import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('App builds and shows the home page', (
    WidgetTester tester,
  ) async {
    final apiClient = ApiClient(
      client: MockClient((request) async => http.Response('[]', 200)),
    );

    await tester.pumpWidget(MyApp(apiClient: apiClient));

    expect(find.text('My Portfolio'), findsWidgets);
  });
}
