class Question{
  String question;
  Map<String, String> answers;
  String correctAnswer;

  Question({required this.question, required this.answers, required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      question: json['Question'],
      answers: {
        'a': json['a'],
        'b': json['b'],
        'c': json['c'],
        'd': json['d']
      },
      correctAnswer: json['correct'],
      );
  }
}