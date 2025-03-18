import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subrace/subrace_repository.dart';

class SubraceCallUserCase implements Usecase<Subrace, String> {
  final SubraceRepository repository;

  SubraceCallUserCase(this.repository);
  @override
  Future<Subrace> call({required String params}) async {
    return await repository.getSubrace(params);
  }
}
