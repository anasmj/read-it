// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opened.file.detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOpenedFileDetailCollection on Isar {
  IsarCollection<OpenedFileDetail> get openedFileDetails => this.collection();
}

const OpenedFileDetailSchema = CollectionSchema(
  name: r'OpenedFileDetail',
  id: 2831938805908434656,
  properties: {
    r'fileData': PropertySchema(
      id: 0,
      name: r'fileData',
      type: IsarType.byteList,
    ),
    r'isLastOpened': PropertySchema(
      id: 1,
      name: r'isLastOpened',
      type: IsarType.bool,
    ),
    r'lastOpen': PropertySchema(
      id: 2,
      name: r'lastOpen',
      type: IsarType.dateTime,
    ),
    r'path': PropertySchema(
      id: 3,
      name: r'path',
      type: IsarType.string,
    )
  },
  estimateSize: _openedFileDetailEstimateSize,
  serialize: _openedFileDetailSerialize,
  deserialize: _openedFileDetailDeserialize,
  deserializeProp: _openedFileDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _openedFileDetailGetId,
  getLinks: _openedFileDetailGetLinks,
  attach: _openedFileDetailAttach,
  version: '3.1.0+1',
);

int _openedFileDetailEstimateSize(
  OpenedFileDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fileData;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _openedFileDetailSerialize(
  OpenedFileDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.fileData);
  writer.writeBool(offsets[1], object.isLastOpened);
  writer.writeDateTime(offsets[2], object.lastOpen);
  writer.writeString(offsets[3], object.path);
}

OpenedFileDetail _openedFileDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OpenedFileDetail(
    fileData: reader.readByteList(offsets[0]),
    isLastOpened: reader.readBoolOrNull(offsets[1]),
    lastOpen: reader.readDateTimeOrNull(offsets[2]),
    path: reader.readStringOrNull(offsets[3]),
  );
  object.id = id;
  return object;
}

P _openedFileDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _openedFileDetailGetId(OpenedFileDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _openedFileDetailGetLinks(OpenedFileDetail object) {
  return [];
}

void _openedFileDetailAttach(
    IsarCollection<dynamic> col, Id id, OpenedFileDetail object) {
  object.id = id;
}

extension OpenedFileDetailQueryWhereSort
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QWhere> {
  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OpenedFileDetailQueryWhere
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QWhereClause> {
  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OpenedFileDetailQueryFilter
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QFilterCondition> {
  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileData',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileData',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileData',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileData',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileData',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      fileDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      isLastOpenedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLastOpened',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      isLastOpenedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLastOpened',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      isLastOpenedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLastOpened',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      lastOpenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastOpen',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      lastOpenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastOpen',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      lastOpenEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      lastOpenGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      lastOpenLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      lastOpenBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastOpen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterFilterCondition>
      pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path',
        value: '',
      ));
    });
  }
}

extension OpenedFileDetailQueryObject
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QFilterCondition> {}

extension OpenedFileDetailQueryLinks
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QFilterCondition> {}

extension OpenedFileDetailQuerySortBy
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QSortBy> {
  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      sortByIsLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      sortByIsLastOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.desc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      sortByLastOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      sortByLastOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.desc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy> sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension OpenedFileDetailQuerySortThenBy
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QSortThenBy> {
  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      thenByIsLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      thenByIsLastOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.desc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      thenByLastOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      thenByLastOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.desc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy> thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QAfterSortBy>
      thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension OpenedFileDetailQueryWhereDistinct
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QDistinct> {
  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QDistinct>
      distinctByFileData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileData');
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QDistinct>
      distinctByIsLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLastOpened');
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QDistinct>
      distinctByLastOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastOpen');
    });
  }

  QueryBuilder<OpenedFileDetail, OpenedFileDetail, QDistinct> distinctByPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }
}

extension OpenedFileDetailQueryProperty
    on QueryBuilder<OpenedFileDetail, OpenedFileDetail, QQueryProperty> {
  QueryBuilder<OpenedFileDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OpenedFileDetail, List<int>?, QQueryOperations>
      fileDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileData');
    });
  }

  QueryBuilder<OpenedFileDetail, bool?, QQueryOperations>
      isLastOpenedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLastOpened');
    });
  }

  QueryBuilder<OpenedFileDetail, DateTime?, QQueryOperations>
      lastOpenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastOpen');
    });
  }

  QueryBuilder<OpenedFileDetail, String?, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }
}
