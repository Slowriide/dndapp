import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_class.dart';

class Subclass {
  String? index;
  SubclassClass? subclassDetailsClass;
  String? name;
  String? subclassFlavor;
  List<String>? desc;
  String? subclassLevels;
  String? url;
  DateTime? updatedAt;
  List<dynamic>? spells;

  Subclass({
    this.index,
    this.subclassDetailsClass,
    this.name,
    this.subclassFlavor,
    this.desc,
    this.subclassLevels,
    this.url,
    this.updatedAt,
    this.spells,
  });
}
