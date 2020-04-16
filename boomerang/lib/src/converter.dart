///Basic definition of all type converters
abstract class TypeConverter {
  T fromJson<T>(String jsonStr);

  String toJson<T>(T body);
}
