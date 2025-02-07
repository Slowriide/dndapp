import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/presentation/providers/spell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpellScreen extends ConsumerStatefulWidget {
  final String spellId;
  const SpellScreen({super.key, required this.spellId});

  @override
  SpellScreenState createState() => SpellScreenState();
}

class SpellScreenState extends ConsumerState<SpellScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(spellInfoProvider.notifier).loadSpell(widget.spellId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Spell? spell = ref.watch(spellInfoProvider)[widget.spellId];

    if (spell == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Text(spell.name),
      ),
    );
  }
}
