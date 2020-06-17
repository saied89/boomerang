[![pub](https://img.shields.io/pub/v/boomerang)](https://pub.dev/packages/boomerang)
![Dart CI](https://github.com/saied89/boomerang/workflows/Dart%20CI/badge.svg?branch=master)
[![codecov](https://codecov.io/gh/saied89/boomerang/branch/master/graph/badge.svg)](https://codecov.io/gh/saied89/boomerang)

#### Description
A library for building simple, consistent and clean network layers. In dart you have to either use tools that rely on tools that use codegen or write it all from the scratch yourself.
This is a simple, lean and extendible library with integrations for both `Json_Serializable` and `built_value` that helps you have clean and maintainable network layers.

#### Usage
First configure a [_TypeConverter_](#TypeConverters) for handling serialization and deserialization.
```dart
final converter = BuiltValueConverter(serializers);
```
Then define your Boomerang Client.
```dart
final boomerang = Boomerang(
    converter: converter, client: http.Client(), baseUrl: 'https://anapioficeandfire.com/api/');
```

Assuming you have setup a `Character` model in your `serializers` you can define your call.
```dart
Call<Character> getSnow = Call(Get('characters/583'));
```

And then make network call.

```dart
final res = boomerang.dispatch(call);  // res is of type Future<Response<Character>>
```

You can optionally define an extension method on `Call`
```dart
extension Equeue<T> on Call<T> {
  Future<Response<T>> enqueue() => boomerang.dispatch(this);
}
```
and make calls like
```dart
final res = call.equeue();
```
#### TypeConverters
Type converters handle serialization and deserialization for _boomerang_. 3 Type converters are provided as part of the project. 

##### Default Type Converter
A `DefaultTypeConverter` that uses _dart:convert_ and is part of the boomerang package itself. It simply converts request and response bodies to `Map<String, dynamic>`.
Keep in mind that an instance is the default value of boomerangs `converter` argument.
```dart
final boomerang = Boomerang(
    client: http.Client(), baseUrl: 'https://anapioficeandfire.com/api/');
```

You should mention the Map return type in your call definitions
```dart
Call<Map<String, dynamic>> getSnow = Call(Get('characters/583'));
final res = call.enqueue();  // res is of type Future<Response<Map<String, dynamic>>>
```
A full example can be found [here](https://github.com/saied89/boomerang/tree/master/examples/dart_convert_example).

##### Built value Type Converter [![pub](https://img.shields.io/pub/v/built_value_converter)](https://pub.dev/packages/built_value_converter)
`BuiltValueConverter` takes a [built_value](https://pub.dev/packages/built_value) `Serializers` as an argument and uses it for serialization and deserialization.
Please see this [article](https://medium.com/dartlang/darts-built-value-for-serialization-f5db9d0f4159#.h12y94wu7) for more info on setting that up.
Don't forget to add `StandardJsonPlugin` plugin to your `serializers`.
```dart
@SerializersFor([
  Character,
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
```
```dart
final converter = BuiltValueConverter(serializers);
```

You can then use models that are set up with the serializers in your call definitions.
```dart
Call<Character> getSnow = Call(Get('characters/583'));
```
A full example can be found [here](https://github.com/saied89/boomerang/tree/master/examples/built_value_example).
 
##### Json Serializable Type Converter[![pub](https://img.shields.io/pub/v/seializable_converter)](https://pub.dev/packages/seializable_converter)
The [json_serializable](https://pub.dev/packages/json_serializable) package is a much simpler alternative offered by the dart team itself.

For using this Converter you need to setup a `Serializer` for each model. Basicaly a static property in which methods
provided by _json_serializable_ are passed to the `Serializer` constructor.
 ```dart
@JsonSerializable(nullable: false)
class Character {
  final String name;
  final String gender;
  final List<String> aliases;

  Character({this.name, this.gender, this.aliases});

  static Serializer<Character> get serializer =>
      Serializer(_$CharacterFromJson, _$CharacterToJson);
}
```
You also need to pass a list of every `Serializer` to a `Serializers` constructor.
```dart
final serializers = Serializers([Character.serializer]);
```
Both of these classes are part of the _serializable_converter_ package.

Rest of the steps are exactly the same as built_value converter.
```dart
final converter = BuiltValueConverter(serializers);
```
You can then use models that are set up with the serializers in your call definitions.
```dart
Call<Character> getSnow = Call(Get('characters/583'));
```
A full example can be found [here](https://github.com/saied89/boomerang/tree/master/examples/json_serializable_example).

#### Call API 

Call object constructor has a mandatory argument and a number of named optional ones that enable you to fully customize request parameters.

| arg name        | description     |type |mandatory |
| ------------- |:-------------:|:-----:|:-------|
| method      | http method, relative path |Method<sup>1</sup>| &check;
| url<sup>2</sup>      | absolute path | String     |
| body | body of request      | Object<sup>3</sup> |
|pathParams| path params| Map<String, String> 
|queryParams| query params| Map<String, String> 
|headers| headers| Map<String, String> 
|bodyFields| url encoded form data<sup>4</sup>| Map<String, String> 

1. A sealed class of http verbs that also can hold relative path(similar to retrofit). Relative path should not have starting slash.
2. Absolute path that would override baseUrl. `Call(Get(), url: 'www.absolutePath.com') // request path will be www.absolutePath.com regardless of set baseUrl`
3. Will be serialized based on [runtimeType](https://api.dart.dev/stable/2.8.4/dart-core/Object/runtimeType.html). Please enforce type in function definition.
4. Cannot be set simultaneously with `body`.
