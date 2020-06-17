import 'package:dart_convert_example/api/ice_fire_api.dart';

void main(List<String> arguments) async {
  final res = await getSnow.enqueue();
  final res1 = await getCharacters.enqueue();
  final bodyMap = res.body;
  print(bodyMap['aliases']);
  print(res1.body.length);
}
