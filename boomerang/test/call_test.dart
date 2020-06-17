import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/method.dart';
import 'package:test/test.dart';

class TestBody {}

class TestConverter implements TypeConverter {
  @override
  T fromJson<T>(Map<String, dynamic> jsonMap) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  List<T> listFromJson<T>(List<Map<String, dynamic>> jsonList) {
    // TODO: implement listFromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson<T>(T json) => {'test': 'saied'};
//  @override
//  T fromJson<T>(String jsonStr) {
//    throw UnimplementedError();
//  }
//
//  @override
//  String toJson<T>(T json) => 'Test Json';


}

main() {
  test('query params are handled', () {
    final subject = Call(Get('char'), queryParams: {'char': 'snow'});
    final req = subject.getRequest('baseUrl/', DefaultTypeConverter());

    expect(req.url.toString(), equals('baseUrl/char?char=snow'));
  });

  test('converter is called when body is set', () {
    final subject = Call(Get('char'), body: TestBody());
    expect(subject.getRequest('baseUrl', TestConverter()).body,
        equals('{"test":"saied"}'));
  });

  test('form-url-encoded dic is set correctly in request', () {
    final subject = Call(Get('char'), bodyFields: {'test': 'test field'});
    expect(subject.body, isNull);
    expect(subject.getRequest('baseUrl', TestConverter()).bodyFields,
        equals({'test': 'test field'}));
  });

  test('headers are added correctly', () {
    final subject = Call(Get('char'), headers: {'test': 'test field'});
    expect(subject.getRequest('baseUrl', TestConverter()).headers,
        equals({'test': 'test field'}));
  });

  test('path params are added Correctly', () {
    final subject = Call(Get('char/{param}'), pathParams: {'param': 'value'});
    expect(subject.getRequest('baseUrl/', TestConverter()).url.path,
        equals('baseUrl/char/value'));
  });

  test('path param without url placeholder throws', () {
    expect(
        () => Call(Get('char/{param1}'), pathParams: {'param': 'value'})
            .getRequest('baseUrl', TestConverter()),
        throwsA(TypeMatcher<StateError>()));
  });

  test('setting body and bodyFields together throws', () {
    expect(
        () => Call<Map<String, dynamic>>(Get(''),
            bodyFields: {'t': 'v'},
            body: {'t', 'v'}).getRequest('baseUrl', TestConverter()),
        throwsA(TypeMatcher<StateError>()));
  });

  test('absolute url ignores base url', () {
    final t = Call(Get(), url: 'www.absolutePath.com');
    final req = t.getRequest('baseUrl', TestConverter());
    expect(req.url.toString(), equals('www.absolutePath.com'));
  });
}
