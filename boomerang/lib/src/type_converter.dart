///Basic definition of all type converters
abstract class TypeConverter<S> {
  T fromJson<T extends S>(String jsonStr);

  String toJson<T extends S>(T body);
}
