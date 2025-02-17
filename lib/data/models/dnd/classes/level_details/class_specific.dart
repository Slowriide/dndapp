import 'dart:convert';

import 'package:dnd_app/data/models/dnd/classes/level_details/classes_specific.dart/class_specifics.dart';

class ClassSpecific {
  //Barbarian
  int? rageCount;
  int? rageDamageBonus;
  int? brutalCriticalDice;
  //Bard
  int? bardicInspirationDie;
  int? songOfRestDie;
  int? magicalSecretsMax5;
  int? magicalSecretsMax7;
  int? magicalSecretsMax9;
  //Cleric
  int? channelDivinityCharges;
  double? destroyUndeadCr;
  //Druid
  double? wildShapeMaxCr;
  bool? wildShapeSwim;
  bool? wildShapeFly;
  //Fighter
  int? actionSurges;
  int? indomitableUses;
  int? extraAttacks;
  //Monk
  MartialArts? martialArts;
  int? kiPoints;
  int? unarmoredMovement;
  //Paladin
  int? auraRange;
  //Ranger
  int? favoredEnemies;
  int? favoredTerrain;
  //Rogue
  SneakAttack? sneakAttack;
  //Sorcerer
  int? sorceryPoints;
  int? metamagicKnown;
  List<CreatingSpellSlot>? creatingSpellSlots;
  //Warloc
  int? invocationsKnown;
  int? mysticArcanumLevel6;
  int? mysticArcanumLevel7;
  int? mysticArcanumLevel8;
  int? mysticArcanumLevel9;
  //Wizard
  int? arcaneRecoveryLevels;

  ClassSpecific({
    this.rageCount,
    this.rageDamageBonus,
    this.brutalCriticalDice,
    this.bardicInspirationDie,
    this.songOfRestDie,
    this.magicalSecretsMax5,
    this.magicalSecretsMax7,
    this.magicalSecretsMax9,
    this.channelDivinityCharges,
    this.destroyUndeadCr,
    this.wildShapeMaxCr,
    this.wildShapeSwim,
    this.wildShapeFly,
    this.actionSurges,
    this.indomitableUses,
    this.extraAttacks,
    this.martialArts,
    this.kiPoints,
    this.unarmoredMovement,
    this.auraRange,
    this.favoredEnemies,
    this.favoredTerrain,
    this.sneakAttack,
    this.sorceryPoints,
    this.metamagicKnown,
    this.creatingSpellSlots,
    this.invocationsKnown,
    this.mysticArcanumLevel6,
    this.mysticArcanumLevel7,
    this.mysticArcanumLevel8,
    this.mysticArcanumLevel9,
    this.arcaneRecoveryLevels,
  });

  @override
  String toString() {
    return '''ClassSpecific
    rageCount: $rageCount,
    rageDamageBonus: $rageDamageBonus,
    brutalCriticalDice: $brutalCriticalDice,
    bardicInspirationDie: $bardicInspirationDie,
    songOfRestDie: $songOfRestDie,
    magicalSecretsMax5: $magicalSecretsMax5,
    magicalSecretsMax7: $magicalSecretsMax7,
    magicalSecretsMax9: $magicalSecretsMax9,
    channelDivinityCharges: $channelDivinityCharges,
    destroyUndeadCr: $destroyUndeadCr,
    wildShapeMaxCr: $wildShapeMaxCr,
    wildShapeSwim: $wildShapeSwim,
    wildShapeFly: $wildShapeFly,
    actionSurges: $actionSurges,
    indomitableUses: $indomitableUses,
    extraAttacks: $extraAttacks,
    martialArts: $martialArts,
    kiPoints: $kiPoints,
    unarmoredMovement: $unarmoredMovement,
    auraRange: $auraRange,
    favoredEnemies: $favoredEnemies,
    favoredTerrain: $favoredTerrain,
    sneakAttack: $sneakAttack,
    sorceryPoints: $sorceryPoints,
    metamagicKnown: $metamagicKnown,
    creatingSpellSlots: $creatingSpellSlots,
    invocationsKnown: $invocationsKnown,
    mysticArcanumLevel6: $mysticArcanumLevel6,
    mysticArcanumLevel7: $mysticArcanumLevel7,
    mysticArcanumLevel8: $mysticArcanumLevel8,
    mysticArcanumLevel9: $mysticArcanumLevel9,
    arcaneRecoveryLevels: $arcaneRecoveryLevels,
    )''';
  }

  factory ClassSpecific.fromMap(Map<String, dynamic> data) => ClassSpecific(
        rageCount: data['rage_count'] as int?,
        rageDamageBonus: data['rage_damage_bonus'] as int?,
        brutalCriticalDice: data['brutal_critical_dice'] as int?,
        invocationsKnown: data['invocations_known'] as int?,
        mysticArcanumLevel6: data['mystic_arcanum_level_6'] as int?,
        mysticArcanumLevel7: data['mystic_arcanum_level_7'] as int?,
        mysticArcanumLevel8: data['mystic_arcanum_level_8'] as int?,
        mysticArcanumLevel9: data['mystic_arcanum_level_9'] as int?,
        sneakAttack: data['sneak_attack'] == null
            ? null
            : SneakAttack.fromMap(data['sneak_attack'] as Map<String, dynamic>),
        bardicInspirationDie: data['bardic_inspiration_die'] as int?,
        songOfRestDie: data['song_of_rest_die'] as int?,
        magicalSecretsMax5: data['magical_secrets_max_5'] as int?,
        magicalSecretsMax7: data['magical_secrets_max_7'] as int?,
        magicalSecretsMax9: data['magical_secrets_max_9'] as int?,
        channelDivinityCharges: data['channel_divinity_charges'] as int?,
        destroyUndeadCr: data['destroy_undead_cr'] as double?,
        wildShapeMaxCr: data['wild_shape_max_cr'] as double?,
        wildShapeSwim: data['wild_shape_swim'] as bool?,
        wildShapeFly: data['wild_shape_fly'] as bool?,
        actionSurges: data['action_surges'] as int?,
        indomitableUses: data['indomitable_uses'] as int?,
        extraAttacks: data['extra_attacks'] as int?,
        martialArts: data['martial_arts'] == null
            ? null
            : MartialArts.fromMap(data['martial_arts'] as Map<String, dynamic>),
        kiPoints: data['ki_points'] as int?,
        unarmoredMovement: data['unarmored_movement'] as int?,
        auraRange: data['aura_range'] as int?,
        favoredEnemies: data['favored_enemies'] as int?,
        favoredTerrain: data['favored_terrain'] as int?,
        sorceryPoints: data['sorcery_points'] as int?,
        metamagicKnown: data['metamagic_known'] as int?,
        creatingSpellSlots: (data['creating_spell_slots'] as List<dynamic>?)
            ?.map((e) => CreatingSpellSlot.fromMap(e as Map<String, dynamic>))
            .toList(),
        arcaneRecoveryLevels: data['arcane_recovery_levels'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'rageCount': rageCount,
        'rageDamageBonus': rageDamageBonus,
        'brutalCriticalDice': brutalCriticalDice,
        'bardicInspirationDie': bardicInspirationDie,
        'songOfRestDie': songOfRestDie,
        'magicalSecretsMax5': magicalSecretsMax5,
        'magicalSecretsMax7': magicalSecretsMax7,
        'magicalSecretsMax9': magicalSecretsMax9,
        'channelDivinityCharges': channelDivinityCharges,
        'destroyUndeadCr': destroyUndeadCr,
        'wildShapeMaxCr': wildShapeMaxCr,
        'wildShapeSwim': wildShapeSwim,
        'wildShapeFly': wildShapeFly,
        'actionSurges': actionSurges,
        'indomitableUses': indomitableUses,
        'extraAttacks': extraAttacks,
        'martialArts': martialArts,
        'kiPoints': kiPoints,
        'unarmoredMovement': unarmoredMovement,
        'auraRange': auraRange,
        'favoredEnemies': favoredEnemies,
        'favoredTerrain': favoredTerrain,
        'sneakAttack': sneakAttack,
        'sorceryPoints': sorceryPoints,
        'metamagicKnown': metamagicKnown,
        'creatingSpellSlots': creatingSpellSlots,
        'invocationsKnown': invocationsKnown,
        'mysticArcanumLevel6': mysticArcanumLevel6,
        'mysticArcanumLevel7': mysticArcanumLevel7,
        'mysticArcanumLevel8': mysticArcanumLevel8,
        'mysticArcanumLevel9': mysticArcanumLevel9,
        'arcaneRecoveryLevels': arcaneRecoveryLevels,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ClassSpecific].
  factory ClassSpecific.fromJson(String data) {
    return ClassSpecific.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ClassSpecific] to a JSON string.
  String toJson() => json.encode(toMap());
}
