import 'package:dnd_app/data/models/dnd/race_traits_details/simple_race.dart';

class RaceTrait {
  String? index;
  List<SimpleRace>? races;
  List<dynamic>? subraces;
  String? name;
  List<String>? desc;
  List<dynamic>? proficiencies;
  String? url;
  DateTime? updatedAt;

  RaceTrait({
    this.index,
    this.races,
    this.subraces,
    this.name,
    this.desc,
    this.proficiencies,
    this.url,
    this.updatedAt,
  });
}
