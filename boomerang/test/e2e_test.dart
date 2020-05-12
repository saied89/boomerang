import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

/// These tests use a simple server application that returns request spec
final boomerang =
    Boomerang(client: http.Client(), baseUrl: 'http://localhost:8080/');

main() {
  test('headers are correcly set', () async {
    final call =
        Call<Map<String, dynamic>>(Get(''), headers: {'test': 'value'});
    final res = await boomerang.dispatch(call);
    print(res.body);
    expect(res.body['method'], equals('GET'));
    expect(res.body['headers']['test'], ['value']);
  });

  test('body is correctly set', () async {
    final call = Call<Map<String, dynamic>>(Get(''), body: {'test': 'value'});
    final res = await boomerang.dispatch(call);
    print(res.body);
    expect(res.body['body'], equals({'test': 'value'}));
  });
}
