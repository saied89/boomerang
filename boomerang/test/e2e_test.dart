import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

/// These tests use a simple server application that returns request spec
final boomerang = Boomerang(client: http.Client(), baseUrl: 'http://localhost:8080/');

main() {
  test('headers are correctly set', () async {
    final call = Call<Map<String, dynamic>>(Get(''), headers: {'test': 'value'});
    final res = await boomerang.dispatch(call);
    print(res.body);
    expect(res.body['method'], equals('GET'));
    expect(res.body['headers']['test'], equals(['value']));
  });

  test('body is correctly set', () async {
    final call = Call<Map<String, dynamic>>(Get(''), body: {'test': 'value'});
    final res = await boomerang.dispatch(call);
    print(res.body);
    expect(res.body['body'], equals({'test': 'value'}));
  });

  test('path params are correctly set', () async {
    final call = Call<Map<String, dynamic>>(Get('{param1}/{param2}'),
        pathParams: {'param1': 'path1', 'param2': 'path2'});
    final res = await boomerang.dispatch(call);
    print(res.body);
    expect(res.body['pathParams'], equals(['path1', 'path2']));
  });

  test('body fields are correctly set', () async {
    final call =
        Call<Map<String, dynamic>>(Get(''), bodyFields: {'field1': 'value1', 'field2': 'value2'});

    final res = await boomerang.dispatch(call);
    print(res.body);

    expect(
        res.body['bodyFields'],
        equals({
          'field1': ['value1'],
          'field2': ['value2']
        }));
  });

  test('query paramas are correctly set', () async {
    final call = Call<Map<String, dynamic>>(Get(''), queryParams: {'q1': 'v1', 'q2': 'v2'});

    final res = await boomerang.dispatch(call);
    prints(res.body);

    expect(
        res.body['queryParams'],
        equals({
          'q1': ['v1'],
          'q2': ['v2']
        }));
  });

  test('all Call Options work together correctly', () async {
    final call = Call<Map<String, dynamic>>(Get('{param1}/{param2}'),
        pathParams: {'param1': 'path1', 'param2': 'path2'},
        headers: {'h1': 'v1'},
        body: {'test': 'value'},
        queryParams: {'q1': 'v1', 'q2': 'v2'});

    final res = await boomerang.dispatch(call);
    print(res.body);

    expect(res.body['body'], equals({'test': 'value'}));
    expect(res.body['headers']['h1'], equals(['v1']));
    expect(res.body['pathParams'], equals(['path1', 'path2']));
    expect(
        res.body['queryParams'],
        equals({
          'q1': ['v1'],
          'q2': ['v2']
        }));
  });
}
