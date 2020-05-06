import 'package:serializable_converter/src/serializer.dart';

class Serializers {

  final Map<Type, Serializer> _map = {};

  Serializers(List<Serializer> serializerList) {
    serializerList.forEach((serializer) {
      _map[serializer.serializationType] = serializer;
    });
  }

  Serializer<T> getSerializer<T>() => _map[T];
}