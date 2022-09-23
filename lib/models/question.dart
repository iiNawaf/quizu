class Question{
  String question;
  List<String> answers;
  String correctAnswer;

  Question({required this.question, required this.answers, required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      question: json['Question'],
      answers: [json['a'], json['b'], json['c'], json['d']],
      correctAnswer: json['correct'],
      );
  }
}