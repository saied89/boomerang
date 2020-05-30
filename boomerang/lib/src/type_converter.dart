///Basic definition of all type converters
abstract class TypeConverter {
  const TypeConverter();
  T fromJson<T>(Map<String, dynamic> jsonMap);

  List<T> listFromJson<T>(List<Map<String, dynamic>> jsonList);

  Map<String, dynamic> toJson<T>(T body);
}
