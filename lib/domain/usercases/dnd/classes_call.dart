import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/generics/classes.dart';

import 'package:dnd_app/domain/repositories/dnd/classes_repository.dart';

class ClassesCallUserCase implements Usecase<List<Classes>, void> {
  final ClassesRepository repository;

  ClassesCallUserCase(this.repository);
  @override
  Future<List<Classes>> call({void params}) async {
    return await repository.getClasses();
  }
}
