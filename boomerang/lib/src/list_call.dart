import 'package:boomerang/boomerang.dart';

class ListCall<T> extends Call<List<T>> {
  ListCall(Method method,
      {Map<String, String> bodyFields,
      Map<String, String> pathParams,
      Map<String, String> queryParams,
      Map<String, String> headers,
      String url,
      Object body})
      : super(method,
            bodyFields: bodyFields,
            pathParams: pathParams,
            queryParams: queryParams,
            headers: headers,
            url: url,
            body: body);

  Type get itemType => T;

  /// Method to convert a list of dynamic to a correctly typed list. This method is necessary since
  /// currently dart type doesn't hold generic type's data.
  List<T> makeRes(Iterable t, TypeConverter converter) => t.map((e) => converter.fromJson<T>(e)).toList();
}
