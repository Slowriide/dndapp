// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMagicItemCollection on Isar {
  IsarCollection<MagicItem> get magicItems => this.collection();
}

const MagicItemSchema = CollectionSchema(
  name: r'MagicItem',
  id: -4759937436047827798,
  properties: {
    r'desc': PropertySchema(
      id: 0,
      name: r'desc',
      type: IsarType.stringList,
    ),
    r'index': PropertySchema(
      id: 1,
      name: r'index',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 3,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'url': PropertySchema(
      id: 4,
      name: r'url',
      type: IsarType.string,
    ),
    r'variant': PropertySchema(
      id: 5,
      name: r'variant',
      type: IsarType.bool,
    )
  },
  estimateSize: _magicItemEstimateSize,
  serialize: _magicItemSerialize,
  deserialize: _magicItemDeserialize,
  deserializeProp: _magicItemDeserializeProp,
  idName: r'IsarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _magicItemGetId,
  getLinks: _magicItemGetLinks,
  attach: _magicItemAttach,
  version: '3.1.0+1',
);

int _magicItemEstimateSize(
  MagicItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.desc.length * 3;
  {
    for (var i = 0; i < object.desc.length; i++) {
      final value = object.desc[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.index.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _magicItemSerialize(
  MagicItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.desc);
  writer.writeString(offsets[1], object.index);
  writer.writeString(offsets[2], object.name);
  writer.writeDateTime(offsets[3], object.updatedAt);
  writer.writeString(offsets[4], object.url);
  writer.writeBool(offsets[5], object.variant);
}

MagicItem _magicItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MagicItem(
    desc: reader.readStringList(offsets[0]) ?? [],
    index: reader.readString(offsets[1]),
    name: reader.readString(offsets[2]),
    updatedAt: reader.readDateTime(offsets[3]),
    url: reader.readString(offsets[4]),
    variant: reader.readBool(offsets[5]),
  );
  object.IsarId = id;
  return object;
}

P _magicItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _magicItemGetId(MagicItem object) {
  return object.IsarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _magicItemGetLinks(MagicItem object) {
  return [];
}

void _magicItemAttach(IsarCollection<dynamic> col, Id id, MagicItem object) {
  object.IsarId = id;
}

extension MagicItemQueryWhereSort
    on QueryBuilder<MagicItem, MagicItem, QWhere> {
  QueryBuilder<MagicItem, MagicItem, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MagicItemQueryWhere
    on QueryBuilder<MagicItem, MagicItem, QWhereClause> {
  QueryBuilder<MagicItem, MagicItem, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<MagicItem, MagicItem, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterWhereClause> isarIdBetween(
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

extension MagicItemQueryFilter
    on QueryBuilder<MagicItem, MagicItem, QFilterCondition> {
  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'IsarId',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'IsarId',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'IsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition>
      descElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition>
      descElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition>
      descElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition>
      descElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'desc',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'desc',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'desc',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'desc',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition>
      descLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'desc',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> descLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'desc',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'index',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'index',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'index',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'index',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> indexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'index',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlEqualTo(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlGreaterThan(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlLessThan(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlBetween(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlStartsWith(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlEndsWith(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlContains(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlMatches(
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

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterFilterCondition> variantEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variant',
        value: value,
      ));
    });
  }
}

extension MagicItemQueryObject
    on QueryBuilder<MagicItem, MagicItem, QFilterCondition> {}

extension MagicItemQueryLinks
    on QueryBuilder<MagicItem, MagicItem, QFilterCondition> {}

extension MagicItemQuerySortBy on QueryBuilder<MagicItem, MagicItem, QSortBy> {
  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variant', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> sortByVariantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variant', Sort.desc);
    });
  }
}

extension MagicItemQuerySortThenBy
    on QueryBuilder<MagicItem, MagicItem, QSortThenBy> {
  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'IsarId', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'IsarId', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variant', Sort.asc);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QAfterSortBy> thenByVariantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variant', Sort.desc);
    });
  }
}

extension MagicItemQueryWhereDistinct
    on QueryBuilder<MagicItem, MagicItem, QDistinct> {
  QueryBuilder<MagicItem, MagicItem, QDistinct> distinctByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc');
    });
  }

  QueryBuilder<MagicItem, MagicItem, QDistinct> distinctByIndex(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'index', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MagicItem, MagicItem, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MagicItem, MagicItem, QDistinct> distinctByVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variant');
    });
  }
}

extension MagicItemQueryProperty
    on QueryBuilder<MagicItem, MagicItem, QQueryProperty> {
  QueryBuilder<MagicItem, int, QQueryOperations> IsarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'IsarId');
    });
  }

  QueryBuilder<MagicItem, List<String>, QQueryOperations> descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<MagicItem, String, QQueryOperations> indexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'index');
    });
  }

  QueryBuilder<MagicItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MagicItem, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MagicItem, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<MagicItem, bool, QQueryOperations> variantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variant');
    });
  }
}
