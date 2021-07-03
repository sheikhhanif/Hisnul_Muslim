// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String? image;
  final String? arTitle;
  final String? enTitle;
  final String? bnTitle;
  Category(
      {required this.id, this.image, this.arTitle, this.enTitle, this.bnTitle});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      arTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ar_title']),
      enTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}en_title']),
      bnTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bn_title']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || arTitle != null) {
      map['ar_title'] = Variable<String?>(arTitle);
    }
    if (!nullToAbsent || enTitle != null) {
      map['en_title'] = Variable<String?>(enTitle);
    }
    if (!nullToAbsent || bnTitle != null) {
      map['bn_title'] = Variable<String?>(bnTitle);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      arTitle: arTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(arTitle),
      enTitle: enTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(enTitle),
      bnTitle: bnTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(bnTitle),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String?>(json['image']),
      arTitle: serializer.fromJson<String?>(json['arTitle']),
      enTitle: serializer.fromJson<String?>(json['enTitle']),
      bnTitle: serializer.fromJson<String?>(json['bnTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String?>(image),
      'arTitle': serializer.toJson<String?>(arTitle),
      'enTitle': serializer.toJson<String?>(enTitle),
      'bnTitle': serializer.toJson<String?>(bnTitle),
    };
  }

  Category copyWith(
          {int? id,
          String? image,
          String? arTitle,
          String? enTitle,
          String? bnTitle}) =>
      Category(
        id: id ?? this.id,
        image: image ?? this.image,
        arTitle: arTitle ?? this.arTitle,
        enTitle: enTitle ?? this.enTitle,
        bnTitle: bnTitle ?? this.bnTitle,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('arTitle: $arTitle, ')
          ..write('enTitle: $enTitle, ')
          ..write('bnTitle: $bnTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(image.hashCode,
          $mrjc(arTitle.hashCode, $mrjc(enTitle.hashCode, bnTitle.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.image == this.image &&
          other.arTitle == this.arTitle &&
          other.enTitle == this.enTitle &&
          other.bnTitle == this.bnTitle);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String?> image;
  final Value<String?> arTitle;
  final Value<String?> enTitle;
  final Value<String?> bnTitle;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.arTitle = const Value.absent(),
    this.enTitle = const Value.absent(),
    this.bnTitle = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.arTitle = const Value.absent(),
    this.enTitle = const Value.absent(),
    this.bnTitle = const Value.absent(),
  });
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String?>? image,
    Expression<String?>? arTitle,
    Expression<String?>? enTitle,
    Expression<String?>? bnTitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (arTitle != null) 'ar_title': arTitle,
      if (enTitle != null) 'en_title': enTitle,
      if (bnTitle != null) 'bn_title': bnTitle,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? image,
      Value<String?>? arTitle,
      Value<String?>? enTitle,
      Value<String?>? bnTitle}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      arTitle: arTitle ?? this.arTitle,
      enTitle: enTitle ?? this.enTitle,
      bnTitle: bnTitle ?? this.bnTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (arTitle.present) {
      map['ar_title'] = Variable<String?>(arTitle.value);
    }
    if (enTitle.present) {
      map['en_title'] = Variable<String?>(enTitle.value);
    }
    if (bnTitle.present) {
      map['bn_title'] = Variable<String?>(bnTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('arTitle: $arTitle, ')
          ..write('enTitle: $enTitle, ')
          ..write('bnTitle: $bnTitle')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedTextColumn image = _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _arTitleMeta = const VerificationMeta('arTitle');
  @override
  late final GeneratedTextColumn arTitle = _constructArTitle();
  GeneratedTextColumn _constructArTitle() {
    return GeneratedTextColumn(
      'ar_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enTitleMeta = const VerificationMeta('enTitle');
  @override
  late final GeneratedTextColumn enTitle = _constructEnTitle();
  GeneratedTextColumn _constructEnTitle() {
    return GeneratedTextColumn(
      'en_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bnTitleMeta = const VerificationMeta('bnTitle');
  @override
  late final GeneratedTextColumn bnTitle = _constructBnTitle();
  GeneratedTextColumn _constructBnTitle() {
    return GeneratedTextColumn(
      'bn_title',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, image, arTitle, enTitle, bnTitle];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Category';
  @override
  final String actualTableName = 'Category';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('ar_title')) {
      context.handle(_arTitleMeta,
          arTitle.isAcceptableOrUnknown(data['ar_title']!, _arTitleMeta));
    }
    if (data.containsKey('en_title')) {
      context.handle(_enTitleMeta,
          enTitle.isAcceptableOrUnknown(data['en_title']!, _enTitleMeta));
    }
    if (data.containsKey('bn_title')) {
      context.handle(_bnTitleMeta,
          bnTitle.isAcceptableOrUnknown(data['bn_title']!, _bnTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class DuaGroup extends DataClass implements Insertable<DuaGroup> {
  final int id;
  final String? arTitle;
  final String? enTitle;
  final String? bnTitle;
  final int? categoryId;
  final int? sectionId;
  DuaGroup(
      {required this.id,
      this.arTitle,
      this.enTitle,
      this.bnTitle,
      this.categoryId,
      this.sectionId});
  factory DuaGroup.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DuaGroup(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      arTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ar_title']),
      enTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}en_title']),
      bnTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bn_title']),
      categoryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      sectionId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}section_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || arTitle != null) {
      map['ar_title'] = Variable<String?>(arTitle);
    }
    if (!nullToAbsent || enTitle != null) {
      map['en_title'] = Variable<String?>(enTitle);
    }
    if (!nullToAbsent || bnTitle != null) {
      map['bn_title'] = Variable<String?>(bnTitle);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int?>(categoryId);
    }
    if (!nullToAbsent || sectionId != null) {
      map['section_id'] = Variable<int?>(sectionId);
    }
    return map;
  }

  DuaGroupsCompanion toCompanion(bool nullToAbsent) {
    return DuaGroupsCompanion(
      id: Value(id),
      arTitle: arTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(arTitle),
      enTitle: enTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(enTitle),
      bnTitle: bnTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(bnTitle),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      sectionId: sectionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sectionId),
    );
  }

  factory DuaGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DuaGroup(
      id: serializer.fromJson<int>(json['id']),
      arTitle: serializer.fromJson<String?>(json['arTitle']),
      enTitle: serializer.fromJson<String?>(json['enTitle']),
      bnTitle: serializer.fromJson<String?>(json['bnTitle']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      sectionId: serializer.fromJson<int?>(json['sectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'arTitle': serializer.toJson<String?>(arTitle),
      'enTitle': serializer.toJson<String?>(enTitle),
      'bnTitle': serializer.toJson<String?>(bnTitle),
      'categoryId': serializer.toJson<int?>(categoryId),
      'sectionId': serializer.toJson<int?>(sectionId),
    };
  }

  DuaGroup copyWith(
          {int? id,
          String? arTitle,
          String? enTitle,
          String? bnTitle,
          int? categoryId,
          int? sectionId}) =>
      DuaGroup(
        id: id ?? this.id,
        arTitle: arTitle ?? this.arTitle,
        enTitle: enTitle ?? this.enTitle,
        bnTitle: bnTitle ?? this.bnTitle,
        categoryId: categoryId ?? this.categoryId,
        sectionId: sectionId ?? this.sectionId,
      );
  @override
  String toString() {
    return (StringBuffer('DuaGroup(')
          ..write('id: $id, ')
          ..write('arTitle: $arTitle, ')
          ..write('enTitle: $enTitle, ')
          ..write('bnTitle: $bnTitle, ')
          ..write('categoryId: $categoryId, ')
          ..write('sectionId: $sectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          arTitle.hashCode,
          $mrjc(
              enTitle.hashCode,
              $mrjc(bnTitle.hashCode,
                  $mrjc(categoryId.hashCode, sectionId.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DuaGroup &&
          other.id == this.id &&
          other.arTitle == this.arTitle &&
          other.enTitle == this.enTitle &&
          other.bnTitle == this.bnTitle &&
          other.categoryId == this.categoryId &&
          other.sectionId == this.sectionId);
}

class DuaGroupsCompanion extends UpdateCompanion<DuaGroup> {
  final Value<int> id;
  final Value<String?> arTitle;
  final Value<String?> enTitle;
  final Value<String?> bnTitle;
  final Value<int?> categoryId;
  final Value<int?> sectionId;
  const DuaGroupsCompanion({
    this.id = const Value.absent(),
    this.arTitle = const Value.absent(),
    this.enTitle = const Value.absent(),
    this.bnTitle = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.sectionId = const Value.absent(),
  });
  DuaGroupsCompanion.insert({
    this.id = const Value.absent(),
    this.arTitle = const Value.absent(),
    this.enTitle = const Value.absent(),
    this.bnTitle = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.sectionId = const Value.absent(),
  });
  static Insertable<DuaGroup> custom({
    Expression<int>? id,
    Expression<String?>? arTitle,
    Expression<String?>? enTitle,
    Expression<String?>? bnTitle,
    Expression<int?>? categoryId,
    Expression<int?>? sectionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (arTitle != null) 'ar_title': arTitle,
      if (enTitle != null) 'en_title': enTitle,
      if (bnTitle != null) 'bn_title': bnTitle,
      if (categoryId != null) 'category_id': categoryId,
      if (sectionId != null) 'section_id': sectionId,
    });
  }

  DuaGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? arTitle,
      Value<String?>? enTitle,
      Value<String?>? bnTitle,
      Value<int?>? categoryId,
      Value<int?>? sectionId}) {
    return DuaGroupsCompanion(
      id: id ?? this.id,
      arTitle: arTitle ?? this.arTitle,
      enTitle: enTitle ?? this.enTitle,
      bnTitle: bnTitle ?? this.bnTitle,
      categoryId: categoryId ?? this.categoryId,
      sectionId: sectionId ?? this.sectionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (arTitle.present) {
      map['ar_title'] = Variable<String?>(arTitle.value);
    }
    if (enTitle.present) {
      map['en_title'] = Variable<String?>(enTitle.value);
    }
    if (bnTitle.present) {
      map['bn_title'] = Variable<String?>(bnTitle.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int?>(categoryId.value);
    }
    if (sectionId.present) {
      map['section_id'] = Variable<int?>(sectionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DuaGroupsCompanion(')
          ..write('id: $id, ')
          ..write('arTitle: $arTitle, ')
          ..write('enTitle: $enTitle, ')
          ..write('bnTitle: $bnTitle, ')
          ..write('categoryId: $categoryId, ')
          ..write('sectionId: $sectionId')
          ..write(')'))
        .toString();
  }
}

class $DuaGroupsTable extends DuaGroups
    with TableInfo<$DuaGroupsTable, DuaGroup> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DuaGroupsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _arTitleMeta = const VerificationMeta('arTitle');
  @override
  late final GeneratedTextColumn arTitle = _constructArTitle();
  GeneratedTextColumn _constructArTitle() {
    return GeneratedTextColumn(
      'ar_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enTitleMeta = const VerificationMeta('enTitle');
  @override
  late final GeneratedTextColumn enTitle = _constructEnTitle();
  GeneratedTextColumn _constructEnTitle() {
    return GeneratedTextColumn(
      'en_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bnTitleMeta = const VerificationMeta('bnTitle');
  @override
  late final GeneratedTextColumn bnTitle = _constructBnTitle();
  GeneratedTextColumn _constructBnTitle() {
    return GeneratedTextColumn(
      'bn_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedIntColumn categoryId = _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn(
      'category_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sectionIdMeta = const VerificationMeta('sectionId');
  @override
  late final GeneratedIntColumn sectionId = _constructSectionId();
  GeneratedIntColumn _constructSectionId() {
    return GeneratedIntColumn(
      'section_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, arTitle, enTitle, bnTitle, categoryId, sectionId];
  @override
  $DuaGroupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Dua_Group';
  @override
  final String actualTableName = 'Dua_Group';
  @override
  VerificationContext validateIntegrity(Insertable<DuaGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ar_title')) {
      context.handle(_arTitleMeta,
          arTitle.isAcceptableOrUnknown(data['ar_title']!, _arTitleMeta));
    }
    if (data.containsKey('en_title')) {
      context.handle(_enTitleMeta,
          enTitle.isAcceptableOrUnknown(data['en_title']!, _enTitleMeta));
    }
    if (data.containsKey('bn_title')) {
      context.handle(_bnTitleMeta,
          bnTitle.isAcceptableOrUnknown(data['bn_title']!, _bnTitleMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('section_id')) {
      context.handle(_sectionIdMeta,
          sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DuaGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DuaGroup.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DuaGroupsTable createAlias(String alias) {
    return $DuaGroupsTable(_db, alias);
  }
}

class Section extends DataClass implements Insertable<Section> {
  final int id;
  final String? image;
  final String? arTitle;
  final String? enTitle;
  final String? bnTitle;
  Section(
      {required this.id, this.image, this.arTitle, this.enTitle, this.bnTitle});
  factory Section.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Section(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      arTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ar_title']),
      enTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}en_title']),
      bnTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bn_title']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || arTitle != null) {
      map['ar_title'] = Variable<String?>(arTitle);
    }
    if (!nullToAbsent || enTitle != null) {
      map['en_title'] = Variable<String?>(enTitle);
    }
    if (!nullToAbsent || bnTitle != null) {
      map['bn_title'] = Variable<String?>(bnTitle);
    }
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(
      id: Value(id),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      arTitle: arTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(arTitle),
      enTitle: enTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(enTitle),
      bnTitle: bnTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(bnTitle),
    );
  }

  factory Section.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String?>(json['image']),
      arTitle: serializer.fromJson<String?>(json['arTitle']),
      enTitle: serializer.fromJson<String?>(json['enTitle']),
      bnTitle: serializer.fromJson<String?>(json['bnTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String?>(image),
      'arTitle': serializer.toJson<String?>(arTitle),
      'enTitle': serializer.toJson<String?>(enTitle),
      'bnTitle': serializer.toJson<String?>(bnTitle),
    };
  }

  Section copyWith(
          {int? id,
          String? image,
          String? arTitle,
          String? enTitle,
          String? bnTitle}) =>
      Section(
        id: id ?? this.id,
        image: image ?? this.image,
        arTitle: arTitle ?? this.arTitle,
        enTitle: enTitle ?? this.enTitle,
        bnTitle: bnTitle ?? this.bnTitle,
      );
  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('arTitle: $arTitle, ')
          ..write('enTitle: $enTitle, ')
          ..write('bnTitle: $bnTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(image.hashCode,
          $mrjc(arTitle.hashCode, $mrjc(enTitle.hashCode, bnTitle.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section &&
          other.id == this.id &&
          other.image == this.image &&
          other.arTitle == this.arTitle &&
          other.enTitle == this.enTitle &&
          other.bnTitle == this.bnTitle);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<int> id;
  final Value<String?> image;
  final Value<String?> arTitle;
  final Value<String?> enTitle;
  final Value<String?> bnTitle;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.arTitle = const Value.absent(),
    this.enTitle = const Value.absent(),
    this.bnTitle = const Value.absent(),
  });
  SectionsCompanion.insert({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.arTitle = const Value.absent(),
    this.enTitle = const Value.absent(),
    this.bnTitle = const Value.absent(),
  });
  static Insertable<Section> custom({
    Expression<int>? id,
    Expression<String?>? image,
    Expression<String?>? arTitle,
    Expression<String?>? enTitle,
    Expression<String?>? bnTitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (arTitle != null) 'ar_title': arTitle,
      if (enTitle != null) 'en_title': enTitle,
      if (bnTitle != null) 'bn_title': bnTitle,
    });
  }

  SectionsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? image,
      Value<String?>? arTitle,
      Value<String?>? enTitle,
      Value<String?>? bnTitle}) {
    return SectionsCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      arTitle: arTitle ?? this.arTitle,
      enTitle: enTitle ?? this.enTitle,
      bnTitle: bnTitle ?? this.bnTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (arTitle.present) {
      map['ar_title'] = Variable<String?>(arTitle.value);
    }
    if (enTitle.present) {
      map['en_title'] = Variable<String?>(enTitle.value);
    }
    if (bnTitle.present) {
      map['bn_title'] = Variable<String?>(bnTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('arTitle: $arTitle, ')
          ..write('enTitle: $enTitle, ')
          ..write('bnTitle: $bnTitle')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SectionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedTextColumn image = _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _arTitleMeta = const VerificationMeta('arTitle');
  @override
  late final GeneratedTextColumn arTitle = _constructArTitle();
  GeneratedTextColumn _constructArTitle() {
    return GeneratedTextColumn(
      'ar_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enTitleMeta = const VerificationMeta('enTitle');
  @override
  late final GeneratedTextColumn enTitle = _constructEnTitle();
  GeneratedTextColumn _constructEnTitle() {
    return GeneratedTextColumn(
      'en_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bnTitleMeta = const VerificationMeta('bnTitle');
  @override
  late final GeneratedTextColumn bnTitle = _constructBnTitle();
  GeneratedTextColumn _constructBnTitle() {
    return GeneratedTextColumn(
      'bn_title',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, image, arTitle, enTitle, bnTitle];
  @override
  $SectionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Section';
  @override
  final String actualTableName = 'Section';
  @override
  VerificationContext validateIntegrity(Insertable<Section> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('ar_title')) {
      context.handle(_arTitleMeta,
          arTitle.isAcceptableOrUnknown(data['ar_title']!, _arTitleMeta));
    }
    if (data.containsKey('en_title')) {
      context.handle(_enTitleMeta,
          enTitle.isAcceptableOrUnknown(data['en_title']!, _enTitleMeta));
    }
    if (data.containsKey('bn_title')) {
      context.handle(_bnTitleMeta,
          bnTitle.isAcceptableOrUnknown(data['bn_title']!, _bnTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Section.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(_db, alias);
  }
}

class Dua extends DataClass implements Insertable<Dua> {
  final int id;
  final String? arDua;
  final String? enTranslation;
  final String? bnTranslation;
  final String? arReference;
  final String? enReference;
  final int? groupId;
  final bool fav;
  Dua(
      {required this.id,
      this.arDua,
      this.enTranslation,
      this.bnTranslation,
      this.arReference,
      this.enReference,
      this.groupId,
      required this.fav});
  factory Dua.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Dua(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      arDua: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ar_dua']),
      enTranslation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}en_translation']),
      bnTranslation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bn_translation']),
      arReference: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ar_reference']),
      enReference: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}en_reference']),
      groupId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}group_id']),
      fav: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fav'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || arDua != null) {
      map['ar_dua'] = Variable<String?>(arDua);
    }
    if (!nullToAbsent || enTranslation != null) {
      map['en_translation'] = Variable<String?>(enTranslation);
    }
    if (!nullToAbsent || bnTranslation != null) {
      map['bn_translation'] = Variable<String?>(bnTranslation);
    }
    if (!nullToAbsent || arReference != null) {
      map['ar_reference'] = Variable<String?>(arReference);
    }
    if (!nullToAbsent || enReference != null) {
      map['en_reference'] = Variable<String?>(enReference);
    }
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int?>(groupId);
    }
    map['fav'] = Variable<bool>(fav);
    return map;
  }

  DuasCompanion toCompanion(bool nullToAbsent) {
    return DuasCompanion(
      id: Value(id),
      arDua:
          arDua == null && nullToAbsent ? const Value.absent() : Value(arDua),
      enTranslation: enTranslation == null && nullToAbsent
          ? const Value.absent()
          : Value(enTranslation),
      bnTranslation: bnTranslation == null && nullToAbsent
          ? const Value.absent()
          : Value(bnTranslation),
      arReference: arReference == null && nullToAbsent
          ? const Value.absent()
          : Value(arReference),
      enReference: enReference == null && nullToAbsent
          ? const Value.absent()
          : Value(enReference),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      fav: Value(fav),
    );
  }

  factory Dua.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dua(
      id: serializer.fromJson<int>(json['id']),
      arDua: serializer.fromJson<String?>(json['arDua']),
      enTranslation: serializer.fromJson<String?>(json['enTranslation']),
      bnTranslation: serializer.fromJson<String?>(json['bnTranslation']),
      arReference: serializer.fromJson<String?>(json['arReference']),
      enReference: serializer.fromJson<String?>(json['enReference']),
      groupId: serializer.fromJson<int?>(json['groupId']),
      fav: serializer.fromJson<bool>(json['fav']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'arDua': serializer.toJson<String?>(arDua),
      'enTranslation': serializer.toJson<String?>(enTranslation),
      'bnTranslation': serializer.toJson<String?>(bnTranslation),
      'arReference': serializer.toJson<String?>(arReference),
      'enReference': serializer.toJson<String?>(enReference),
      'groupId': serializer.toJson<int?>(groupId),
      'fav': serializer.toJson<bool>(fav),
    };
  }

  Dua copyWith(
          {int? id,
          String? arDua,
          String? enTranslation,
          String? bnTranslation,
          String? arReference,
          String? enReference,
          int? groupId,
          bool? fav}) =>
      Dua(
        id: id ?? this.id,
        arDua: arDua ?? this.arDua,
        enTranslation: enTranslation ?? this.enTranslation,
        bnTranslation: bnTranslation ?? this.bnTranslation,
        arReference: arReference ?? this.arReference,
        enReference: enReference ?? this.enReference,
        groupId: groupId ?? this.groupId,
        fav: fav ?? this.fav,
      );
  @override
  String toString() {
    return (StringBuffer('Dua(')
          ..write('id: $id, ')
          ..write('arDua: $arDua, ')
          ..write('enTranslation: $enTranslation, ')
          ..write('bnTranslation: $bnTranslation, ')
          ..write('arReference: $arReference, ')
          ..write('enReference: $enReference, ')
          ..write('groupId: $groupId, ')
          ..write('fav: $fav')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          arDua.hashCode,
          $mrjc(
              enTranslation.hashCode,
              $mrjc(
                  bnTranslation.hashCode,
                  $mrjc(
                      arReference.hashCode,
                      $mrjc(enReference.hashCode,
                          $mrjc(groupId.hashCode, fav.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dua &&
          other.id == this.id &&
          other.arDua == this.arDua &&
          other.enTranslation == this.enTranslation &&
          other.bnTranslation == this.bnTranslation &&
          other.arReference == this.arReference &&
          other.enReference == this.enReference &&
          other.groupId == this.groupId &&
          other.fav == this.fav);
}

class DuasCompanion extends UpdateCompanion<Dua> {
  final Value<int> id;
  final Value<String?> arDua;
  final Value<String?> enTranslation;
  final Value<String?> bnTranslation;
  final Value<String?> arReference;
  final Value<String?> enReference;
  final Value<int?> groupId;
  final Value<bool> fav;
  const DuasCompanion({
    this.id = const Value.absent(),
    this.arDua = const Value.absent(),
    this.enTranslation = const Value.absent(),
    this.bnTranslation = const Value.absent(),
    this.arReference = const Value.absent(),
    this.enReference = const Value.absent(),
    this.groupId = const Value.absent(),
    this.fav = const Value.absent(),
  });
  DuasCompanion.insert({
    this.id = const Value.absent(),
    this.arDua = const Value.absent(),
    this.enTranslation = const Value.absent(),
    this.bnTranslation = const Value.absent(),
    this.arReference = const Value.absent(),
    this.enReference = const Value.absent(),
    this.groupId = const Value.absent(),
    required bool fav,
  }) : fav = Value(fav);
  static Insertable<Dua> custom({
    Expression<int>? id,
    Expression<String?>? arDua,
    Expression<String?>? enTranslation,
    Expression<String?>? bnTranslation,
    Expression<String?>? arReference,
    Expression<String?>? enReference,
    Expression<int?>? groupId,
    Expression<bool>? fav,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (arDua != null) 'ar_dua': arDua,
      if (enTranslation != null) 'en_translation': enTranslation,
      if (bnTranslation != null) 'bn_translation': bnTranslation,
      if (arReference != null) 'ar_reference': arReference,
      if (enReference != null) 'en_reference': enReference,
      if (groupId != null) 'group_id': groupId,
      if (fav != null) 'fav': fav,
    });
  }

  DuasCompanion copyWith(
      {Value<int>? id,
      Value<String?>? arDua,
      Value<String?>? enTranslation,
      Value<String?>? bnTranslation,
      Value<String?>? arReference,
      Value<String?>? enReference,
      Value<int?>? groupId,
      Value<bool>? fav}) {
    return DuasCompanion(
      id: id ?? this.id,
      arDua: arDua ?? this.arDua,
      enTranslation: enTranslation ?? this.enTranslation,
      bnTranslation: bnTranslation ?? this.bnTranslation,
      arReference: arReference ?? this.arReference,
      enReference: enReference ?? this.enReference,
      groupId: groupId ?? this.groupId,
      fav: fav ?? this.fav,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (arDua.present) {
      map['ar_dua'] = Variable<String?>(arDua.value);
    }
    if (enTranslation.present) {
      map['en_translation'] = Variable<String?>(enTranslation.value);
    }
    if (bnTranslation.present) {
      map['bn_translation'] = Variable<String?>(bnTranslation.value);
    }
    if (arReference.present) {
      map['ar_reference'] = Variable<String?>(arReference.value);
    }
    if (enReference.present) {
      map['en_reference'] = Variable<String?>(enReference.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int?>(groupId.value);
    }
    if (fav.present) {
      map['fav'] = Variable<bool>(fav.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DuasCompanion(')
          ..write('id: $id, ')
          ..write('arDua: $arDua, ')
          ..write('enTranslation: $enTranslation, ')
          ..write('bnTranslation: $bnTranslation, ')
          ..write('arReference: $arReference, ')
          ..write('enReference: $enReference, ')
          ..write('groupId: $groupId, ')
          ..write('fav: $fav')
          ..write(')'))
        .toString();
  }
}

class $DuasTable extends Duas with TableInfo<$DuasTable, Dua> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DuasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _arDuaMeta = const VerificationMeta('arDua');
  @override
  late final GeneratedTextColumn arDua = _constructArDua();
  GeneratedTextColumn _constructArDua() {
    return GeneratedTextColumn(
      'ar_dua',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enTranslationMeta =
      const VerificationMeta('enTranslation');
  @override
  late final GeneratedTextColumn enTranslation = _constructEnTranslation();
  GeneratedTextColumn _constructEnTranslation() {
    return GeneratedTextColumn(
      'en_translation',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bnTranslationMeta =
      const VerificationMeta('bnTranslation');
  @override
  late final GeneratedTextColumn bnTranslation = _constructBnTranslation();
  GeneratedTextColumn _constructBnTranslation() {
    return GeneratedTextColumn(
      'bn_translation',
      $tableName,
      true,
    );
  }

  final VerificationMeta _arReferenceMeta =
      const VerificationMeta('arReference');
  @override
  late final GeneratedTextColumn arReference = _constructArReference();
  GeneratedTextColumn _constructArReference() {
    return GeneratedTextColumn(
      'ar_reference',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enReferenceMeta =
      const VerificationMeta('enReference');
  @override
  late final GeneratedTextColumn enReference = _constructEnReference();
  GeneratedTextColumn _constructEnReference() {
    return GeneratedTextColumn(
      'en_reference',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  @override
  late final GeneratedIntColumn groupId = _constructGroupId();
  GeneratedIntColumn _constructGroupId() {
    return GeneratedIntColumn(
      'group_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _favMeta = const VerificationMeta('fav');
  @override
  late final GeneratedBoolColumn fav = _constructFav();
  GeneratedBoolColumn _constructFav() {
    return GeneratedBoolColumn(
      'fav',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        arDua,
        enTranslation,
        bnTranslation,
        arReference,
        enReference,
        groupId,
        fav
      ];
  @override
  $DuasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Dua';
  @override
  final String actualTableName = 'Dua';
  @override
  VerificationContext validateIntegrity(Insertable<Dua> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ar_dua')) {
      context.handle(
          _arDuaMeta, arDua.isAcceptableOrUnknown(data['ar_dua']!, _arDuaMeta));
    }
    if (data.containsKey('en_translation')) {
      context.handle(
          _enTranslationMeta,
          enTranslation.isAcceptableOrUnknown(
              data['en_translation']!, _enTranslationMeta));
    }
    if (data.containsKey('bn_translation')) {
      context.handle(
          _bnTranslationMeta,
          bnTranslation.isAcceptableOrUnknown(
              data['bn_translation']!, _bnTranslationMeta));
    }
    if (data.containsKey('ar_reference')) {
      context.handle(
          _arReferenceMeta,
          arReference.isAcceptableOrUnknown(
              data['ar_reference']!, _arReferenceMeta));
    }
    if (data.containsKey('en_reference')) {
      context.handle(
          _enReferenceMeta,
          enReference.isAcceptableOrUnknown(
              data['en_reference']!, _enReferenceMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    }
    if (data.containsKey('fav')) {
      context.handle(
          _favMeta, fav.isAcceptableOrUnknown(data['fav']!, _favMeta));
    } else if (isInserting) {
      context.missing(_favMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dua map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Dua.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DuasTable createAlias(String alias) {
    return $DuasTable(_db, alias);
  }
}

abstract class _$Db extends GeneratedDatabase {
  _$Db(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $DuaGroupsTable duaGroups = $DuaGroupsTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final $DuasTable duas = $DuasTable(this);
  late final AzkarDao azkarDao = AzkarDao(this as Db);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, duaGroups, sections, duas];
}
