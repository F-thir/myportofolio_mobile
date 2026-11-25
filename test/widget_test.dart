import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('App builds and shows a Scaffold', (WidgetTester tester) async {
    // Layar besar supaya kartu di grid tidak overflow saat test.
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final apiClient = ApiClient(
      client: MockClient((request) async => http.Response('[]', 200)),
    );

    await tester.pumpWidget(MyApp(apiClient: apiClient));

    tester.takeException();

    expect(find.byType(Scaffold), findsWidgets);
  });
}
