///Basic definition of all type converters
abstract class TypeConverter {
  const TypeConverter();
  T fromJson<T>(String jsonStr);

  String toJson<T>(T body);
}
