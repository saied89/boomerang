#### Description
A tool for building simple, consistent and clean network layers. In dart you have to either use librarires that use codegen or write it up from scratch.


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
Type converters handle serialization and deserialization for _boomerang_. 3 Type converters are provided as part of project. 

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

##### Built value Type Converter
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
A full example can be found [here](https://github.com/saied89/boomerang/tree/master/examples/dart_convert_example).
 
##### Json Serializable Type Converter
The [json_serializable](https://pub.dev/packages/json_serializable) package is a much simpler alternative offered by the dart team. 
#### Call API 
