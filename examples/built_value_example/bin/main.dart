import 'package:built_value_example/api/ice_fire_api.dart';
import 'package:built_value_example/api/api.dart';

void main(List<String> arguments) async {
  var response = await getSnow.enqueue();
  final char = response.body;
  print(char.aliases);

  var response1 = await getCharacters.enqueue();
  final charList = response1.body;
  print(charList.length);
  print(charList[0].culture);
}
