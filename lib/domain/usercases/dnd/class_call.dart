import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/class_repository.dart';

class ClassCallUserCase implements Usecase<Class, String> {
  final ClassRepository repository;

  ClassCallUserCase(this.repository);
  @override
  Future<Class> call({required String params}) async {
    return await repository.getClass(params);
  }
}
