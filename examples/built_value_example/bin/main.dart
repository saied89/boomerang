import 'package:built_value_example/api/ice_fire_api.dart';
import 'package:built_value_example/model/Character.dart';

void main(List<String> arguments) async {
  Character char = (await getSnow.enqueue()).body;
  print(char.aliases);
}
