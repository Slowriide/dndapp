import 'package:dnd_app/data/models/dnd/classes/level_details/class_specific.dart';
import 'package:dnd_app/data/models/dnd/classes/level_details/level_feature.dart';
import 'package:dnd_app/data/models/dnd/classes/level_details/levels_class.dart';
import 'package:dnd_app/data/models/dnd/classes/level_details/spellcasting.dart';

class LevelPerClass {
  int? level;
  int? abilityScoreBonuses;
  int? profBonus;
  List<LevelFeature>? features;
  Spellcasting? spellcasting;
  ClassSpecific? classSpecific;
  String? index;
  LevelsClass? levelDetailsClass;
  String? url;
  DateTime? updatedAt;

  LevelPerClass({
    this.level,
    this.abilityScoreBonuses,
    this.profBonus,
    this.features,
    this.spellcasting,
    this.classSpecific,
    this.index,
    this.levelDetailsClass,
    this.url,
    this.updatedAt,
  });
}
