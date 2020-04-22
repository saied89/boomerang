import 'package:built_value_example/api/ice_fire_api.dart';

void main(List<String> arguments) async {
  var response = await getSnow.enqueue();
  final char = response.body;
  print(char.aliases);
}
