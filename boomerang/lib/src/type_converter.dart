///Basic definition of all type converters
abstract class TypeConverter {
  const TypeConverter();

  T fromJson<T>(Map<String, dynamic> jsonMap);

  Map<String, dynamic> toJson<T>(T body);
}
