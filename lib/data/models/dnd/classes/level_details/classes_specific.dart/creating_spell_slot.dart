class CreatingSpellSlot {
  int? spellSlotLevel;
  int? sorceryPointCost;

  CreatingSpellSlot({
    this.spellSlotLevel,
    this.sorceryPointCost,
  });

  factory CreatingSpellSlot.fromMap(Map<String, dynamic> data) =>
      CreatingSpellSlot(
        spellSlotLevel: data["spell_slot_level"] as int?,
        sorceryPointCost: data["sorcery_point_cost"] as int?,
      );

  Map<String, dynamic> toMap() => {
        "spell_slot_level": spellSlotLevel,
        "sorcery_point_cost": sorceryPointCost,
      };
}
