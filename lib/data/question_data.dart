import '../models/question.dart';
import '../models/character.dart';

class QuestionData {
  static List<Question> getAllQuestions() {
    return [
      // ELF SORULARI
      Question(
        id: 'elf_001',
        text: 'Legolas\'ın babasının adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Thranduil', 'Elrond', 'Gil-galad', 'Celeborn'],
        correctAnswerIndex: 0,
        explanation: 'Thranduil, Orman Diyarı\'nın Elf Kralı ve Legolas\'ın babasıdır.',
        category: CharacterCategory.elves,
        difficulty: 'easy',
      ),
      Question(
        id: 'elf_002',
        text: 'Elrond hangi diyarı yönetir?',
        type: QuestionType.multipleChoice,
        options: ['Lothlórien', 'Rivendell', 'Mirkwood', 'Gri Limanlar'],
        correctAnswerIndex: 1,
        explanation: 'Rivendell (İmladris), Lord Elrond tarafından yönetilen diyardır.',
        category: CharacterCategory.elves,
        difficulty: 'easy',
      ),
      Question(
        id: 'elf_003',
        text: 'Galadriel üç Elf yüzüğünden birine sahiptir.',
        type: QuestionType.trueFalse,
        options: ['Doğru', 'Yanlış'],
        correctAnswerIndex: 0,
        correctAnswer: 'true',
        explanation: 'Galadriel, üç Elf yüzüğünden biri olan Su Yüzüğü Nenya\'ya sahiptir.',
        category: CharacterCategory.elves,
        difficulty: 'medium',
      ),

      // HOBBIT SORULARI
      Question(
        id: 'hobbit_001',
        text: 'Frodo\'nun bahçıvanının adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Samwise Gamgee', 'Meriadoc Brandybuck', 'Peregrin Took', 'Bilbo Baggins'],
        correctAnswerIndex: 0,
        explanation: 'Samwise Gamgee, Frodo\'nun sadık bahçıvanı ve yoldaşıdır.',
        category: CharacterCategory.hobbits,
        difficulty: 'easy',
      ),
      Question(
        id: 'hobbit_002',
        text: 'Hobbitler esas olarak nerede yaşar?',
        type: QuestionType.multipleChoice,
        options: ['Rohan', 'Gondor', 'Shire', 'Bree'],
        correctAnswerIndex: 2,
        explanation: 'Shire (Köy), Hobbitlerin ana vatanıdır.',
        category: CharacterCategory.hobbits,
        difficulty: 'easy',
      ),
      Question(
        id: 'hobbit_003',
        text: 'Bilbo Baggins Tek Yüzük\'ü Gollum\'un mağarasında buldu.',
        type: QuestionType.trueFalse,
        options: ['Doğru', 'Yanlış'],
        correctAnswerIndex: 0,
        correctAnswer: 'true',
        explanation: 'Bilbo, Hobbit olayları sırasında Yüzük\'ü Gollum\'un mağarasında buldu.',
        category: CharacterCategory.hobbits,
        difficulty: 'medium',
      ),

      // CÜCE SORULARI
      Question(
        id: 'dwarf_001',
        text: 'Gimli\'nin babasının adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Glóin', 'Balin', 'Dáin', 'Óin'],
        correctAnswerIndex: 0,
        explanation: 'Glóin, Gimli\'nin babasıdır ve Hobbit\'teki on üç cüceden biriydi.',
        category: CharacterCategory.dwarves,
        difficulty: 'medium',
      ),
      Question(
        id: 'dwarf_002',
        text: 'Dağ altındaki eski Cüce krallığının adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Khazad-dûm', 'Erebor', 'Demir Tepeler', 'Mavi Dağlar'],
        correctAnswerIndex: 0,
        explanation: 'Khazad-dûm (Moria), Sisli Dağlar altındaki en büyük Cüce krallığıydı.',
        category: CharacterCategory.dwarves,
        difficulty: 'hard',
      ),

      // İNSAN SORULARI
      Question(
        id: 'men_001',
        text: 'Aragorn kral olduğunda aldığı kraliyet adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Elessar', 'Telcontar', 'Strider', 'Chieftain'],
        correctAnswerIndex: 0,
        explanation: 'Aragorn, Gondor Kralı olduğunda Elessar adını alır.',
        category: CharacterCategory.men,
        difficulty: 'medium',
      ),
      Question(
        id: 'men_002',
        text: 'Gondor\'un başkenti hangi şehirdir?',
        type: QuestionType.multipleChoice,
        options: ['Edoras', 'Minas Tirith', 'Osgiliath', 'Dol Amroth'],
        correctAnswerIndex: 1,
        explanation: 'Minas Tirith, Gondor\'un başkent şehridir.',
        category: CharacterCategory.men,
        difficulty: 'easy',
      ),
      Question(
        id: 'men_003',
        text: 'Boromir, Gondor Naiplerinin oğluydu.',
        type: QuestionType.trueFalse,
        options: ['Doğru', 'Yanlış'],
        correctAnswerIndex: 0,
        correctAnswer: 'true',
        explanation: 'Boromir, Gondor\'un Yönetici Naibi Denethor\'un oğluydu.',
        category: CharacterCategory.men,
        difficulty: 'easy',
      ),

      // ORK VE KARA GÜÇLER SORULARI
      Question(
        id: 'dark_001',
        text: 'Sauron\'un kalesi nerede bulunur?',
        type: QuestionType.multipleChoice,
        options: ['Isengard', 'Mordor', 'Dol Guldur', 'Minas Morgul'],
        correctAnswerIndex: 1,
        explanation: 'Sauron\'un kalesi Barad-dûr, Mordor\'da bulunur.',
        category: CharacterCategory.orcsAndDarkForces,
        difficulty: 'easy',
      ),
      Question(
        id: 'dark_002',
        text: 'Nazgûl Kralı\'nın bindiği yaratığın adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Fell beast', 'Warg', 'Kara at', 'Ejder'],
        correctAnswerIndex: 0,
        explanation: 'Nazgûl Kralı, karanlığın kanatlı yaratığı olan fell beast\'e biner.',
        category: CharacterCategory.orcsAndDarkForces,
        difficulty: 'medium',
      ),

      // BÜYÜCÜ VE MAİAR SORULARI
      Question(
        id: 'wizard_001',
        text: 'Orta Dünya\'ya kaç Istari (Büyücü) gönderildi?',
        type: QuestionType.multipleChoice,
        options: ['3', '4', '5', '6'],
        correctAnswerIndex: 2,
        explanation: 'Beş Istari gönderildi: Gandalf, Saruman, Radagast ve iki Mavi Büyücü.',
        category: CharacterCategory.wizardsAndMaiar,
        difficulty: 'hard',
      ),
      Question(
        id: 'wizard_002',
        text: 'Gandalf\'ın kılıcının adı nedir?',
        type: QuestionType.multipleChoice,
        options: ['Glamdring', 'Orcrist', 'Sting', 'Andúril'],
        correctAnswerIndex: 0,
        explanation: 'Glamdring (Düşman Çekici), Gandalf\'ın kılıcıdır.',
        category: CharacterCategory.wizardsAndMaiar,
        difficulty: 'medium',
      ),
      Question(
        id: 'wizard_003',
        text: 'Saruman, başlangıçta Beyaz Meclis\'in başıydı.',
        type: QuestionType.trueFalse,
        options: ['Doğru', 'Yanlış'],
        correctAnswerIndex: 0,
        correctAnswer: 'true',
        explanation: 'Saruman, düşmeden önce gerçekten de Beyaz Meclis\'in başıydı.',
        category: CharacterCategory.wizardsAndMaiar,
        difficulty: 'medium',
      ),
    ];
  }

  static List<Question> getQuestionsByCategory(CharacterCategory category, {int limit = 10}) {
    final categoryQuestions = getAllQuestions()
        .where((question) => question.category == category)
        .toList();
    
    categoryQuestions.shuffle();
    return categoryQuestions.take(limit).toList();
  }

  static List<Question> getRandomQuestions({int limit = 10}) {
    final allQuestions = getAllQuestions();
    allQuestions.shuffle();
    return allQuestions.take(limit).toList();
  }

  static List<Question> getQuestionsByDifficulty(String difficulty) {
    return getAllQuestions()
        .where((question) => question.difficulty == difficulty)
        .toList();
  }
}
