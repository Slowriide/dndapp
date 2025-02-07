import 'package:dnd_app/core/usecase/usecase.dart';

import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/spell_repository.dart';

class SpellCallUsecase implements Usecase<Spell, String> {
  final SpellRepository repository;

  SpellCallUsecase(this.repository);
  @override
  Future<Spell> call({required String params}) async {
    return await repository.getSpell(params);
  }
}
