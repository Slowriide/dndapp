import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/spell_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spellInfoProvider =
    StateNotifierProvider<SpellMapNotifier, Map<String, Spell>>(
  (ref) {
    final repository = sl<SpellRepository>();

    return SpellMapNotifier(getSpell: repository.getSpell);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetSpellCallback = Future<Spell> Function(String id);

class SpellMapNotifier extends StateNotifier<Map<String, Spell>> {
  final GetSpellCallback getSpell;

  SpellMapNotifier({required this.getSpell}) : super({});

  Future<void> loadSpell(String id) async {
    if (state[id] != null) return;
    // ignore: avoid_print
    print('realizando peticion http');
    final spell = await getSpell(id);

    state = {...state, id: spell};
  }
}
