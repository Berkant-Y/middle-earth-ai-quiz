import '../models/character.dart';

class CharacterData {
  static List<Character> getAllCharacters() {
    return [
      // ELVES
      Character(
        id: 'legolas',
        name: 'Legolas',
        nickname: 'Prince of the Woodland Realm',
        race: 'Elf',
        height: '1.83 m',
        weight: '70 kg',
        weapons: ['Galadhrim Yayı', 'Beyaz Hançerler'],
        abilities: ['Mükemmel Okçuluk', 'Gelişmiş Duyular', 'Ölümsüzlük'],
        story: 'Orman Krallığı Kralı Thranduil\'in oğlu. Yüzük Kardeşliği\'nin üyesi ve efsanevi okçu. Cüce Gimli ile dostluğu iki ırk arasındaki bağları güçlendirdi.',
        imagePath: 'assets/images/Legolas.jpg',
        relatedCharacters: ['Gimli', 'Aragorn', 'Thranduil'],
        category: CharacterCategory.elves,
      ),
      Character(
        id: 'elrond',
        name: 'Elrond',
        nickname: 'Lord of Rivendell',
        race: 'Half-elf',
        height: '1.96 m',
        weight: '80 kg',
        weapons: ['Hadhafang Kılıcı', 'Vilya (Hava Yüzüğü)'],
        abilities: ['Öngörü', 'İyileştirme', 'Kadim Bilgelik'],
        story: 'Rivendell\'in efendisi ve üç Elf yüzüğünden birinin koruyucusu. Aragorn\'u büyüttü ve kızı Arwen\'le evlenmesine izin verdi. Bilge lider ve iyileştirici.',
        imagePath: 'assets/images/Elrond.jpg',
        relatedCharacters: ['Arwen', 'Aragorn', 'Galadriel'],
        category: CharacterCategory.elves,
      ),
      Character(
        id: 'galadriel',
        name: 'Galadriel',
        nickname: 'Lady of Light',
        race: 'Elf',
        height: '1.93 m',
        weight: '65 kg',
        weapons: ['Nenya (Su Yüzüğü)', 'Galadriel Aynası'],
        abilities: ['Telepati', 'Önceden Görme', 'Yüzük Taşıyıcısı'],
        story: 'Lothlórien\'in hanımefendisi ve üç Elf yüzüğünden birinin sahibi. Aynası ile gelecek ve geçmişi görebilir. Frodo\'ya ışık veren şişeyi hediye etti.',
        imagePath: 'assets/images/Galadriel.jpg',
        relatedCharacters: ['Celeborn', 'Elrond', 'Gandalf'],
        category: CharacterCategory.elves,
      ),

      // HOBBITS
      Character(
        id: 'frodo',
        name: 'Frodo Baggins',
        nickname: 'Ring Bearer',
        race: 'Hobbit',
        height: '1.06 m',
        weight: '29 kg',
        weapons: ['İğne Kılıcı', 'Mithril Zırh'],
        abilities: ['Yüzük Direnci', 'Cesaret', 'Gizlilik'],
        story: 'Tek Yüzük\'ün taşıyıcısı ve Yüzük Savaşı\'nın kahramanı. Büyük tehlikeye rağmen yüzüğü Mordor\'a taşıyıp yok etti. Shire\'dan uzak diyarlara yolculuk etti.',
        imagePath: 'assets/images/Frodo.jpg',
        relatedCharacters: ['Sam', 'Gandalf', 'Bilbo'],
        category: CharacterCategory.hobbits,
      ),
      Character(
        id: 'sam',
        name: 'Samwise Gamgee',
        nickname: 'Sam the Brave',
        race: 'Hobbit',
        height: '1.02 m',
        weight: '32 kg',
        weapons: ['Höyük Kılıcı', 'Elf Halatı', 'Tava'],
        abilities: ['Sadakat', 'Bahçıvanlık', 'Cesaret'],
        story: 'Frodo\'nun sadık bahçıvanı ve yüzüğü yok etme görevindeki en yakın arkadaşı. Gerçek bir kahraman ve dostluk örneği. Rosie Cotton ile evlendi.',
        imagePath: 'assets/images/Sam.jpg',
        relatedCharacters: ['Frodo', 'Rosie Cotton', 'Merry', 'Pippin'],
        category: CharacterCategory.hobbits,
      ),

      // DWARVES
      Character(
        id: 'gimli',
        name: 'Gimli',
        nickname: 'Son of Glóin',
        race: 'Dwarf',
        height: '1.35 m',
        weight: '118 kg',
        weapons: ['Savaş Baltası', 'Yürüyüş Baltası'],
        abilities: ['Usta Zanaatkar', 'Savaş Öfkesi', 'Taş Hissi'],
        story: 'Yüzük Kardeşliği üyesi ve Cücelerin temsilcisi. Elf Legolas ile derin dostluk kurdu. Mahir savaşçı ve usta zanaatkar. Moria\'nın trajik hikayesine tanık oldu.',
        imagePath: 'assets/images/Gimli.jpg',
        relatedCharacters: ['Legolas', 'Glóin', 'Balin'],
        category: CharacterCategory.dwarves,
      ),

      // MEN
      Character(
        id: 'aragorn',
        name: 'Aragorn',
        nickname: 'Strider, King Elessar',
        race: 'Man (Dúnadan)',
        height: '1.98 m',
        weight: '95 kg',
        weapons: ['Andúril Kılıcı', 'Yay', 'Hançer'],
        abilities: ['İz Sürme', 'İyileştirme', 'Liderlik'],
        story: 'Gondor\'un gerçek kralı ve Yüzük Kardeşliği üyesi. Arwen ile evlendi. Andúril kılıcıyla İsengard ve Mordor güçlerini yendi. Bilge ve adil hükümdar.',
        imagePath: 'assets/images/Aragorn.jpg',
        relatedCharacters: ['Arwen', 'Boromir', 'Elrond'],
        category: CharacterCategory.men,
      ),
      Character(
        id: 'boromir',
        name: 'Boromir',
        nickname: 'Captain of Gondor',
        race: 'Man',
        height: '1.93 m',
        weight: '105 kg',
        weapons: ['Kılıç', 'Kalkan', 'Gondor Borusu'],
        abilities: ['Kılıç Ustalığı', 'Liderlik', 'Cesaret'],
        story: 'Denethor\'un oğlu ve Gondor\'un kaptanı. Yüzük Kardeşliği üyesi oldu ama yüzüğün gücüne kapıldı. Merry ve Pippin\'i korurken kahramanca öldü.',
        imagePath: 'assets/images/Boromir.jpg',
        relatedCharacters: ['Faramir', 'Denethor', 'Aragorn'],
        category: CharacterCategory.men,
      ),

      // ORCS & DARK FORCES
      Character(
        id: 'sauron',
        name: 'Sauron',
        nickname: 'The Dark Lord',
        race: 'Maia (corrupted)',
        height: '2.4 m (in physical form)',
        weight: 'Unknown',
        weapons: ['Tek Yüzük', 'Gürz'],
        abilities: ['Şekil Değiştirme', 'Zihin Kontrolü', 'Karanlık Büyü'],
        story: 'Karanlık Lord ve Tek Yüzük\'ün yaratıcısı. Tüm yüzükleri kontrol etmek istedi. Mordor\'un efendisi ve Orta Dünya\'nın en büyük tehdidi.',
        imagePath: 'assets/images/Sauron.jpg',
        relatedCharacters: ['Saruman', 'Witch-king', 'Mouth of Sauron'],
        category: CharacterCategory.orcsAndDarkForces,
      ),

      // WIZARDS & MAIAR
      Character(
        id: 'gandalf',
        name: 'Gandalf',
        nickname: 'Mithrandir, Grey/White Wizard',
        race: 'Maia (Wizard)',
        height: '1.80 m',
        weight: '75 kg',
        weapons: ['Glamdring Kılıcı', 'Büyücü Asası', 'Narya (Ateş Yüzüğü)'],
        abilities: ['Büyücülük', 'Bilgelik', 'Ateş Kontrolü'],
        story: 'Bilge büyücü ve Yüzük Kardeşliği\'nin rehberi. Balrog ile savaştıktan sonra Beyaz Büyücü oldu. Üç Elf yüzüğünden birinin taşıyıcısı.',
        imagePath: 'assets/images/Gandalf.jpg',
        relatedCharacters: ['Frodo', 'Aragorn', 'Saruman'],
        category: CharacterCategory.wizardsAndMaiar,
      ),
      Character(
        id: 'saruman',
        name: 'Saruman',
        nickname: 'The White, The Many-Colored',
        race: 'Maia (Wizard)',
        height: '1.85 m',
        weight: '80 kg',
        weapons: ['Güç Asası', 'Palantír Kristali'],
        abilities: ['Güçlü Ses', 'Endüstriyel Büyü', 'Yozlaştırma'],
        story: 'Eski Beyaz Konsey başkanı, karanlığa düşen büyücü. İsengard\'ı endüstriyel üsse çevirdi. Sauron ile işbirliği yaptı ama sonunda mağlup edildi.',
        imagePath: 'assets/images/Saruman.jpg',
        relatedCharacters: ['Gandalf', 'Sauron', 'Wormtongue'],
        category: CharacterCategory.wizardsAndMaiar,
      ),
    ];
  }

  static List<Character> getCharactersByCategory(CharacterCategory category) {
    return getAllCharacters().where((character) => character.category == category).toList();
  }

  static Character? getCharacterById(String id) {
    try {
      return getAllCharacters().firstWhere((character) => character.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<String> getMainCharacterAvatars() {
    return [
      'frodo',
      'gandalf',
      'legolas',
      'aragorn',
      'gimli',
      'boromir',
      'galadriel',
      'sauron',
    ];
  }
}
