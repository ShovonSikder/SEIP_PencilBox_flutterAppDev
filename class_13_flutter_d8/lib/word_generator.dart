import 'package:english_words/english_words.dart' as words;

List levels = [[], [], []];

// List<String> level1List = [];
// List<String> level2List = [];
// List<String> level3List = [];

List<String> generateList({required int length}) {
  List<String> wordList = words.nouns;
  final tempList =
      wordList.where((element) => element.length == length).toList();
  tempList.shuffle();
  return tempList.sublist(0, wordList.length > 10 ? 10 : wordList.length - 1);
}

String shuffleWord(String word) {
  String shuffleWord = '';
  List<String> tempList = word.split('');
  tempList.shuffle();
  return tempList.join('');
}
