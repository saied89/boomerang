///Basic definition of all type converters
abstract class TypeConverter<S> {
  const TypeConverter();
  T fromJson<T extends S>(String jsonStr);

  String toJson<T extends S>(T body);
}
