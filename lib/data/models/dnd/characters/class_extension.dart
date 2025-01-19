import 'character.dart'; // Asegúrate de importar donde se define `CharacterClass`.

extension CharacterClassExtension on CharacterClass {
  String get displayName {
    switch (this) {
      case CharacterClass.wizard:
        return "Wizard";
      case CharacterClass.warlock:
        return "Warlock";
      case CharacterClass.paladin:
        return "Paladin";
      case CharacterClass.warrior:
        return "Warrior";
      case CharacterClass.monge:
        return "Monge";
      case CharacterClass.rouge:
        return "Rouge";
    }
  }
}
