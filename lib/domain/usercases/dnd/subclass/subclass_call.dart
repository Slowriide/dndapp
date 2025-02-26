import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_repository.dart';

class SubclassCallUserCase implements Usecase<Subclass, String> {
  final SubclassRepository repository;

  SubclassCallUserCase(this.repository);
  @override
  Future<Subclass> call({required String params}) async {
    return await repository.getSubclass(params);
  }
}
