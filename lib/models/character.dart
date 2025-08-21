class Character {
  final String id;
  final String name;
  final String nickname;
  final String race;
  final String height;
  final String weight;
  final List<String> weapons;
  final List<String> abilities;
  final String story;
  final String imagePath;
  final List<String> relatedCharacters;
  final CharacterCategory category;

  Character({
    required this.id,
    required this.name,
    required this.nickname,
    required this.race,
    required this.height,
    required this.weight,
    required this.weapons,
    required this.abilities,
    required this.story,
    required this.imagePath,
    required this.relatedCharacters,
    required this.category,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nickname: json['nickname'] ?? '',
      race: json['race'] ?? '',
      height: json['height'] ?? '',
      weight: json['weight'] ?? '',
      weapons: List<String>.from(json['weapons'] ?? []),
      abilities: List<String>.from(json['abilities'] ?? []),
      story: json['story'] ?? '',
      imagePath: json['imagePath'] ?? '',
      relatedCharacters: List<String>.from(json['relatedCharacters'] ?? []),
      category: CharacterCategory.values.firstWhere(
        (e) => e.toString() == 'CharacterCategory.${json['category']}',
        orElse: () => CharacterCategory.men,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nickname': nickname,
      'race': race,
      'height': height,
      'weight': weight,
      'weapons': weapons,
      'abilities': abilities,
      'story': story,
      'imagePath': imagePath,
      'relatedCharacters': relatedCharacters,
      'category': category.toString().split('.').last,
    };
  }
}

enum CharacterCategory {
  elves,
  hobbits,
  dwarves,
  men,
  orcsAndDarkForces,
  wizardsAndMaiar,
}

extension CharacterCategoryExtension on CharacterCategory {
  String get displayName {
    switch (this) {
      case CharacterCategory.elves:
        return 'Elfler';
      case CharacterCategory.hobbits:
        return 'Hobbitler';
      case CharacterCategory.dwarves:
        return 'Cüceler';
      case CharacterCategory.men:
        return 'İnsanlar';
      case CharacterCategory.orcsAndDarkForces:
        return 'Orklar ve Karanlık Güçler';
      case CharacterCategory.wizardsAndMaiar:
        return 'Büyücüler ve Maiar';
    }
  }

  String get description {
    switch (this) {
      case CharacterCategory.elves:
        return 'Büyük bilgelik ve güzelliğe sahip ölümsüz varlıklar';
      case CharacterCategory.hobbits:
        return 'Barışı ve basit zevkleri seven küçük halk';
      case CharacterCategory.dwarves:
        return 'Dağların gururlu madencileri ve zanaatkarları';
      case CharacterCategory.men:
        return 'Orta Dünya\'daki insanlar';
      case CharacterCategory.orcsAndDarkForces:
        return 'Karanlığın ve kötülüğün hizmetkarları';
      case CharacterCategory.wizardsAndMaiar:
        return 'Orta Dünya\'ya rehberlik etmek için gönderilen güçlü varlıklar';
    }
  }
}
