import 'package:built_value_example/api/ice_fire_api.dart';

void main(List<String> arguments) async {
  final char = (await getSnow.enqueue()).body;
  print(char.aliases);
}
