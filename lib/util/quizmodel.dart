class Question {
  final String text;
  final List<Option> options;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.selectedOption
  });

  @override
  String toString() {
    return  'Question{text: $text, selectedOption: ${selectedOption?.isCorrect}}';
  }
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    this.isCorrect = false
  });
}