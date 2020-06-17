// GENERATED CODE - DO NOT MODIFY BY HAND

part of character;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Character> _$characterSerializer = new _$CharacterSerializer();

class _$CharacterSerializer implements StructuredSerializer<Character> {
  @override
  final Iterable<Type> types = const [Character, _$Character];
  @override
  final String wireName = 'Character';

  @override
  Iterable<Object> serialize(Serializers serializers, Character object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender, specifiedType: const FullType(String)),
      'culture',
      serializers.serialize(object.culture, specifiedType: const FullType(String)),
      'born',
      serializers.serialize(object.born, specifiedType: const FullType(String)),
      'died',
      serializers.serialize(object.died, specifiedType: const FullType(String)),
      'titles',
      serializers.serialize(object.titles,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'aliases',
      serializers.serialize(object.aliases,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'father',
      serializers.serialize(object.father, specifiedType: const FullType(String)),
      'mother',
      serializers.serialize(object.mother, specifiedType: const FullType(String)),
      'spouse',
      serializers.serialize(object.spouse, specifiedType: const FullType(String)),
      'allegiances',
      serializers.serialize(object.allegiances,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'books',
      serializers.serialize(object.books,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'povBooks',
      serializers.serialize(object.povBooks,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'tvSeries',
      serializers.serialize(object.tvSeries,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'playedBy',
      serializers.serialize(object.playedBy,
          specifiedType: const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Character deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CharacterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'culture':
          result.culture =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'born':
          result.born =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'died':
          result.died =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'titles':
          result.titles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'aliases':
          result.aliases.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'father':
          result.father =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'mother':
          result.mother =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'spouse':
          result.spouse =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'allegiances':
          result.allegiances.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'books':
          result.books.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'povBooks':
          result.povBooks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'tvSeries':
          result.tvSeries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'playedBy':
          result.playedBy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Character extends Character {
  @override
  final String url;
  @override
  final String name;
  @override
  final String gender;
  @override
  final String culture;
  @override
  final String born;
  @override
  final String died;
  @override
  final BuiltList<String> titles;
  @override
  final BuiltList<String> aliases;
  @override
  final String father;
  @override
  final String mother;
  @override
  final String spouse;
  @override
  final BuiltList<String> allegiances;
  @override
  final BuiltList<String> books;
  @override
  final BuiltList<String> povBooks;
  @override
  final BuiltList<String> tvSeries;
  @override
  final BuiltList<String> playedBy;

  factory _$Character([void Function(CharacterBuilder) updates]) =>
      (new CharacterBuilder()..update(updates)).build();

  _$Character._(
      {this.url,
      this.name,
      this.gender,
      this.culture,
      this.born,
      this.died,
      this.titles,
      this.aliases,
      this.father,
      this.mother,
      this.spouse,
      this.allegiances,
      this.books,
      this.povBooks,
      this.tvSeries,
      this.playedBy})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('Character', 'url');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Character', 'name');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('Character', 'gender');
    }
    if (culture == null) {
      throw new BuiltValueNullFieldError('Character', 'culture');
    }
    if (born == null) {
      throw new BuiltValueNullFieldError('Character', 'born');
    }
    if (died == null) {
      throw new BuiltValueNullFieldError('Character', 'died');
    }
    if (titles == null) {
      throw new BuiltValueNullFieldError('Character', 'titles');
    }
    if (aliases == null) {
      throw new BuiltValueNullFieldError('Character', 'aliases');
    }
    if (father == null) {
      throw new BuiltValueNullFieldError('Character', 'father');
    }
    if (mother == null) {
      throw new BuiltValueNullFieldError('Character', 'mother');
    }
    if (spouse == null) {
      throw new BuiltValueNullFieldError('Character', 'spouse');
    }
    if (allegiances == null) {
      throw new BuiltValueNullFieldError('Character', 'allegiances');
    }
    if (books == null) {
      throw new BuiltValueNullFieldError('Character', 'books');
    }
    if (povBooks == null) {
      throw new BuiltValueNullFieldError('Character', 'povBooks');
    }
    if (tvSeries == null) {
      throw new BuiltValueNullFieldError('Character', 'tvSeries');
    }
    if (playedBy == null) {
      throw new BuiltValueNullFieldError('Character', 'playedBy');
    }
  }

  @override
  Character rebuild(void Function(CharacterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterBuilder toBuilder() => new CharacterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Character &&
        url == other.url &&
        name == other.name &&
        gender == other.gender &&
        culture == other.culture &&
        born == other.born &&
        died == other.died &&
        titles == other.titles &&
        aliases == other.aliases &&
        father == other.father &&
        mother == other.mother &&
        spouse == other.spouse &&
        allegiances == other.allegiances &&
        books == other.books &&
        povBooks == other.povBooks &&
        tvSeries == other.tvSeries &&
        playedBy == other.playedBy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc($jc(0, url.hashCode),
                                                                name.hashCode),
                                                            gender.hashCode),
                                                        culture.hashCode),
                                                    born.hashCode),
                                                died.hashCode),
                                            titles.hashCode),
                                        aliases.hashCode),
                                    father.hashCode),
                                mother.hashCode),
                            spouse.hashCode),
                        allegiances.hashCode),
                    books.hashCode),
                povBooks.hashCode),
            tvSeries.hashCode),
        playedBy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Character')
          ..add('url', url)
          ..add('name', name)
          ..add('gender', gender)
          ..add('culture', culture)
          ..add('born', born)
          ..add('died', died)
          ..add('titles', titles)
          ..add('aliases', aliases)
          ..add('father', father)
          ..add('mother', mother)
          ..add('spouse', spouse)
          ..add('allegiances', allegiances)
          ..add('books', books)
          ..add('povBooks', povBooks)
          ..add('tvSeries', tvSeries)
          ..add('playedBy', playedBy))
        .toString();
  }
}

class CharacterBuilder implements Builder<Character, CharacterBuilder> {
  _$Character _$v;

  String _url;

  String get url => _$this._url;

  set url(String url) => _$this._url = url;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  String _gender;

  String get gender => _$this._gender;

  set gender(String gender) => _$this._gender = gender;

  String _culture;

  String get culture => _$this._culture;

  set culture(String culture) => _$this._culture = culture;

  String _born;

  String get born => _$this._born;

  set born(String born) => _$this._born = born;

  String _died;

  String get died => _$this._died;

  set died(String died) => _$this._died = died;

  ListBuilder<String> _titles;

  ListBuilder<String> get titles => _$this._titles ??= new ListBuilder<String>();

  set titles(ListBuilder<String> titles) => _$this._titles = titles;

  ListBuilder<String> _aliases;

  ListBuilder<String> get aliases => _$this._aliases ??= new ListBuilder<String>();

  set aliases(ListBuilder<String> aliases) => _$this._aliases = aliases;

  String _father;

  String get father => _$this._father;

  set father(String father) => _$this._father = father;

  String _mother;

  String get mother => _$this._mother;

  set mother(String mother) => _$this._mother = mother;

  String _spouse;

  String get spouse => _$this._spouse;

  set spouse(String spouse) => _$this._spouse = spouse;

  ListBuilder<String> _allegiances;

  ListBuilder<String> get allegiances => _$this._allegiances ??= new ListBuilder<String>();

  set allegiances(ListBuilder<String> allegiances) => _$this._allegiances = allegiances;

  ListBuilder<String> _books;

  ListBuilder<String> get books => _$this._books ??= new ListBuilder<String>();

  set books(ListBuilder<String> books) => _$this._books = books;

  ListBuilder<String> _povBooks;

  ListBuilder<String> get povBooks => _$this._povBooks ??= new ListBuilder<String>();

  set povBooks(ListBuilder<String> povBooks) => _$this._povBooks = povBooks;

  ListBuilder<String> _tvSeries;

  ListBuilder<String> get tvSeries => _$this._tvSeries ??= new ListBuilder<String>();

  set tvSeries(ListBuilder<String> tvSeries) => _$this._tvSeries = tvSeries;

  ListBuilder<String> _playedBy;

  ListBuilder<String> get playedBy => _$this._playedBy ??= new ListBuilder<String>();

  set playedBy(ListBuilder<String> playedBy) => _$this._playedBy = playedBy;

  CharacterBuilder();

  CharacterBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _name = _$v.name;
      _gender = _$v.gender;
      _culture = _$v.culture;
      _born = _$v.born;
      _died = _$v.died;
      _titles = _$v.titles?.toBuilder();
      _aliases = _$v.aliases?.toBuilder();
      _father = _$v.father;
      _mother = _$v.mother;
      _spouse = _$v.spouse;
      _allegiances = _$v.allegiances?.toBuilder();
      _books = _$v.books?.toBuilder();
      _povBooks = _$v.povBooks?.toBuilder();
      _tvSeries = _$v.tvSeries?.toBuilder();
      _playedBy = _$v.playedBy?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Character other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Character;
  }

  @override
  void update(void Function(CharacterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Character build() {
    _$Character _$result;
    try {
      _$result = _$v ??
          new _$Character._(
              url: url,
              name: name,
              gender: gender,
              culture: culture,
              born: born,
              died: died,
              titles: titles.build(),
              aliases: aliases.build(),
              father: father,
              mother: mother,
              spouse: spouse,
              allegiances: allegiances.build(),
              books: books.build(),
              povBooks: povBooks.build(),
              tvSeries: tvSeries.build(),
              playedBy: playedBy.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'titles';
        titles.build();
        _$failedField = 'aliases';
        aliases.build();

        _$failedField = 'allegiances';
        allegiances.build();
        _$failedField = 'books';
        books.build();
        _$failedField = 'povBooks';
        povBooks.build();
        _$failedField = 'tvSeries';
        tvSeries.build();
        _$failedField = 'playedBy';
        playedBy.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('Character', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
