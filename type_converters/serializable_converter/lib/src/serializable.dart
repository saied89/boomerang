class Serializable<T extends Serializable<T>> {
  static Map<Type, Function> map = <Type, Function>{};

  static T Function(Map<String, dynamic>) getSer<T>() {
    return map[T];
  }

  static void add<T>(T Function(Map<String, dynamic>) b) {
    map[T] = b;
  }

  static T _fromJson<T extends Serializable<T>>(String json) {
    final t = <int>[5, 6, 7];
  }

  static t() {}
}
