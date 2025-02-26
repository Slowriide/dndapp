import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_class.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_subclass.dart';

class SubclassFeatures {
  String? index;
  SubclassClass? subclassFeaturesDetailsClass;
  SubclassSubclass? subclass;
  String? name;
  int? level;
  List<dynamic>? prerequisites;
  List<String>? desc;
  String? url;
  DateTime? updatedAt;

  SubclassFeatures({
    this.index,
    this.subclassFeaturesDetailsClass,
    this.subclass,
    this.name,
    this.level,
    this.prerequisites,
    this.desc,
    this.url,
    this.updatedAt,
  });
}
