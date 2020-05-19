import 'package:json_serializable_example/api/ice_fire_api.dart';
import 'package:json_serializable_example/api/api.dart';

void main(List<String> arguments) async {
  var response = await getSnow.enqueue();
  final char = response.body;
  print(char.aliases);
}
