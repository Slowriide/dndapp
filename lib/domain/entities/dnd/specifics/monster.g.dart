// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMonsterCollection on Isar {
  IsarCollection<Monster> get monsters => this.collection();
}

const MonsterSchema = CollectionSchema(
  name: r'Monster',
  id: -8444916184149147718,
  properties: {
    r'alignment': PropertySchema(
      id: 0,
      name: r'alignment',
      type: IsarType.string,
    ),
    r'charisma': PropertySchema(
      id: 1,
      name: r'charisma',
      type: IsarType.long,
    ),
    r'constitution': PropertySchema(
      id: 2,
      name: r'constitution',
      type: IsarType.long,
    ),
    r'dexterity': PropertySchema(
      id: 3,
      name: r'dexterity',
      type: IsarType.long,
    ),
    r'hitDice': PropertySchema(
      id: 4,
      name: r'hitDice',
      type: IsarType.string,
    ),
    r'hitPoints': PropertySchema(
      id: 5,
      name: r'hitPoints',
      type: IsarType.long,
    ),
    r'hitPointsRoll': PropertySchema(
      id: 6,
      name: r'hitPointsRoll',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 7,
      name: r'id',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 8,
      name: r'image',
      type: IsarType.string,
    ),
    r'intelligence': PropertySchema(
      id: 9,
      name: r'intelligence',
      type: IsarType.long,
    ),
    r'languages': PropertySchema(
      id: 10,
      name: r'languages',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 11,
      name: r'name',
      type: IsarType.string,
    ),
    r'proficiencyBonus': PropertySchema(
      id: 12,
      name: r'proficiencyBonus',
      type: IsarType.long,
    ),
    r'size': PropertySchema(
      id: 13,
      name: r'size',
      type: IsarType.string,
    ),
    r'strength': PropertySchema(
      id: 14,
      name: r'strength',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 15,
      name: r'type',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 16,
      name: r'url',
      type: IsarType.string,
    ),
    r'wisdom': PropertySchema(
      id: 17,
      name: r'wisdom',
      type: IsarType.long,
    )
  },
  estimateSize: _monsterEstimateSize,
  serialize: _monsterSerialize,
  deserialize: _monsterDeserialize,
  deserializeProp: _monsterDeserializeProp,
  idName: r'IsarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _monsterGetId,
  getLinks: _monsterGetLinks,
  attach: _monsterAttach,
  version: '3.1.0+1',
);

int _monsterEstimateSize(
  Monster object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alignment.length * 3;
  bytesCount += 3 + object.hitDice.length * 3;
  bytesCount += 3 + object.hitPointsRoll.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.image.length * 3;
  bytesCount += 3 + object.languages.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.size;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _monsterSerialize(
  Monster object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alignment);
  writer.writeLong(offsets[1], object.charisma);
  writer.writeLong(offsets[2], object.constitution);
  writer.writeLong(offsets[3], object.dexterity);
  writer.writeString(offsets[4], object.hitDice);
  writer.writeLong(offsets[5], object.hitPoints);
  writer.writeString(offsets[6], object.hitPointsRoll);
  writer.writeString(offsets[7], object.id);
  writer.writeString(offsets[8], object.image);
  writer.writeLong(offsets[9], object.intelligence);
  writer.writeString(offsets[10], object.languages);
  writer.writeString(offsets[11], object.name);
  writer.writeLong(offsets[12], object.proficiencyBonus);
  writer.writeString(offsets[13], object.size);
  writer.writeLong(offsets[14], object.strength);
  writer.writeString(offsets[15], object.type);
  writer.writeString(offsets[16], object.url);
  writer.writeLong(offsets[17], object.wisdom);
}

Monster _monsterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Monster(
    alignment: reader.readString(offsets[0]),
    charisma: reader.readLong(offsets[1]),
    constitution: reader.readLong(offsets[2]),
    dexterity: reader.readLong(offsets[3]),
    hitDice: reader.readString(offsets[4]),
    hitPoints: reader.readLong(offsets[5]),
    hitPointsRoll: reader.readStringOrNull(offsets[6]) ?? '',
    id: reader.readString(offsets[7]),
    image: reader.readString(offsets[8]),
    intelligence: reader.readLong(offsets[9]),
    languages: reader.readString(offsets[10]),
    name: reader.readString(offsets[11]),
    proficiencyBonus: reader.readLong(offsets[12]),
    size: reader.readStringOrNull(offsets[13]),
    strength: reader.readLong(offsets[14]),
    type: reader.readString(offsets[15]),
    url: reader.readString(offsets[16]),
    wisdom: reader.readLong(offsets[17]),
  );
  object.IsarId = id;
  return object;
}

P _monsterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _monsterGetId(Monster object) {
  return object.IsarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _monsterGetLinks(Monster object) {
  return [];
}

void _monsterAttach(IsarCollection<dynamic> col, Id id, Monster object) {
  object.IsarId = id;
}

extension MonsterQueryWhereSort on QueryBuilder<Monster, Monster, QWhere> {
  QueryBuilder<Monster, Monster, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MonsterQueryWhere on QueryBuilder<Monster, Monster, QWhereClause> {
  QueryBuilder<Monster, Monster, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Monster, Monster, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Monster, Monster, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Monster, Monster, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MonsterQueryFilter
    on QueryBuilder<Monster, Monster, QFilterCondition> {
  QueryBuilder<Monster, Monster, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'IsarId',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'IsarId',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'IsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'IsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'IsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'IsarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alignment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alignment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alignment',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> alignmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alignment',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> charismaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'charisma',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> charismaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'charisma',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> charismaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'charisma',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> charismaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'charisma',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> constitutionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'constitution',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> constitutionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'constitution',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> constitutionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'constitution',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> constitutionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'constitution',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> dexterityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dexterity',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> dexterityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dexterity',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> dexterityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dexterity',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> dexterityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dexterity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hitDice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hitDice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hitDice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hitDice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hitDice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hitDice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hitDice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hitDice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hitDice',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitDiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hitDice',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hitPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hitPointsRoll',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition>
      hitPointsRollGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hitPointsRoll',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hitPointsRoll',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hitPointsRoll',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hitPointsRoll',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hitPointsRoll',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hitPointsRoll',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hitPointsRoll',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> hitPointsRollIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hitPointsRoll',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition>
      hitPointsRollIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hitPointsRoll',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> intelligenceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intelligence',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> intelligenceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intelligence',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> intelligenceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intelligence',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> intelligenceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intelligence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> languagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> proficiencyBonusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proficiencyBonus',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition>
      proficiencyBonusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proficiencyBonus',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition>
      proficiencyBonusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proficiencyBonus',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> proficiencyBonusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proficiencyBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'size',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> sizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> strengthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strength',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> strengthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strength',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> strengthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strength',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> strengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> wisdomEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wisdom',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> wisdomGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wisdom',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> wisdomLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wisdom',
        value: value,
      ));
    });
  }

  QueryBuilder<Monster, Monster, QAfterFilterCondition> wisdomBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wisdom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MonsterQueryObject
    on QueryBuilder<Monster, Monster, QFilterCondition> {}

extension MonsterQueryLinks
    on QueryBuilder<Monster, Monster, QFilterCondition> {}

extension MonsterQuerySortBy on QueryBuilder<Monster, Monster, QSortBy> {
  QueryBuilder<Monster, Monster, QAfterSortBy> sortByAlignment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByAlignmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByCharisma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charisma', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByCharismaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charisma', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByConstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constitution', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByConstitutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constitution', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByDexterity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dexterity', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByDexterityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dexterity', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByHitDice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitDice', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByHitDiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitDice', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPoints', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByHitPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPoints', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByHitPointsRoll() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPointsRoll', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByHitPointsRollDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPointsRoll', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByIntelligence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intelligence', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByIntelligenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intelligence', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languages', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByLanguagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languages', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByProficiencyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proficiencyBonus', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByProficiencyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proficiencyBonus', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByStrength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByStrengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByWisdom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wisdom', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> sortByWisdomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wisdom', Sort.desc);
    });
  }
}

extension MonsterQuerySortThenBy
    on QueryBuilder<Monster, Monster, QSortThenBy> {
  QueryBuilder<Monster, Monster, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'IsarId', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'IsarId', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByAlignment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByAlignmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByCharisma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charisma', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByCharismaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charisma', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByConstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constitution', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByConstitutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constitution', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByDexterity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dexterity', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByDexterityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dexterity', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByHitDice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitDice', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByHitDiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitDice', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPoints', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByHitPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPoints', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByHitPointsRoll() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPointsRoll', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByHitPointsRollDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitPointsRoll', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByIntelligence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intelligence', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByIntelligenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intelligence', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languages', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByLanguagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languages', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByProficiencyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proficiencyBonus', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByProficiencyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proficiencyBonus', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByStrength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByStrengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByWisdom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wisdom', Sort.asc);
    });
  }

  QueryBuilder<Monster, Monster, QAfterSortBy> thenByWisdomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wisdom', Sort.desc);
    });
  }
}

extension MonsterQueryWhereDistinct
    on QueryBuilder<Monster, Monster, QDistinct> {
  QueryBuilder<Monster, Monster, QDistinct> distinctByAlignment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alignment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByCharisma() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'charisma');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByConstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'constitution');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByDexterity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dexterity');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByHitDice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hitDice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hitPoints');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByHitPointsRoll(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hitPointsRoll',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByIntelligence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intelligence');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByLanguages(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languages', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByProficiencyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proficiencyBonus');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctBySize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByStrength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strength');
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Monster, Monster, QDistinct> distinctByWisdom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wisdom');
    });
  }
}

extension MonsterQueryProperty
    on QueryBuilder<Monster, Monster, QQueryProperty> {
  QueryBuilder<Monster, int, QQueryOperations> IsarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'IsarId');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> alignmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alignment');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> charismaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'charisma');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> constitutionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'constitution');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> dexterityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dexterity');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> hitDiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hitDice');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> hitPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hitPoints');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> hitPointsRollProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hitPointsRoll');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> intelligenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intelligence');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> languagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languages');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> proficiencyBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proficiencyBonus');
    });
  }

  QueryBuilder<Monster, String?, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> strengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strength');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Monster, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<Monster, int, QQueryOperations> wisdomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wisdom');
    });
  }
}
