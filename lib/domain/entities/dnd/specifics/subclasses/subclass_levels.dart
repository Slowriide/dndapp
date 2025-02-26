import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_class.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_feature.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_specific.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_subclass.dart';

class SubclassLevels {
  int? level;
  List<SubclassLevelsFeature>? features;
  SubclassSpecific? subclassSpecific;
  SubclassClass? subclassLevelsClass;
  SubclassSubclass? subclass;
  String? url;
  String? index;
  DateTime? updatedAt;

  SubclassLevels({
    this.level,
    this.features,
    this.subclassSpecific,
    this.subclassLevelsClass,
    this.subclass,
    this.url,
    this.index,
    this.updatedAt,
  });
}
