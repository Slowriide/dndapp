import 'package:dnd_app/data/models/dnd/race/subrace/subrace_trait/subrace.dart';
import 'package:dnd_app/data/models/dnd/race/subrace/subrace_trait/trait_specific.dart';

class SubraceTraits {
  String? index;
  List<dynamic>? races;
  List<TraitsSubrace>? subraces;
  String? name;
  List<String>? desc;
  List<dynamic>? proficiencies;
  TraitSpecific? traitSpecific;
  String? url;
  DateTime? updatedAt;

  SubraceTraits({
    this.index,
    this.races,
    this.subraces,
    this.name,
    this.desc,
    this.proficiencies,
    this.traitSpecific,
    this.url,
    this.updatedAt,
  });
}
