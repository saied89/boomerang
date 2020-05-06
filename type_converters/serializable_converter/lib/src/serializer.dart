typedef FromJsonConverter<T> = T Function(Map<String, dynamic> json);
typedef ToJsonConverter<T> = Map<String, dynamic> Function(T input);
class Serializer<T> {
  final FromJsonConverter<T> _fromJsonConverter;
  final ToJsonConverter<T> _toJsonConverter;

  Serializer(this._fromJsonConverter, this._toJsonConverter);

  Type get serializationType => T;

  T fromJson(Map<String, dynamic> map) => _fromJsonConverter(map);
  Map<String, dynamic> toJson(T input) => _toJsonConverter(input);
}