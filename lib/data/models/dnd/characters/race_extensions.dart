import 'character.dart'; // Asegúrate de importar donde se define `Race`.

extension RaceExtension on Race {
  String get displayName {
    switch (this) {
      case Race.elf:
        return "Elf";
      case Race.human:
        return "Human";
      // Agrega otros casos aquí si tienes más razas.
      case Race.dwarf:
        return "Dwarf";

      case Race.tifling:
        return "Tifling";
    }
  }
}
