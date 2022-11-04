import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      this.questions,
      required this.questionCount});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['imageUrl']??"",
        description = json['Description'] as String,
        timeSeconds = json['time_seconds'] as int,
        questionCount = 0,
        questions = (json["questions"] as List)
            .map((e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  QuestionPaperModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot['title'] ?? "",
        imageUrl = snapshot['imageUrl'],
        description = snapshot['Description'],
        timeSeconds = snapshot['time_seconds'],
        questionCount = snapshot["question_count"] as int,
        questions = [];

  String timeInMinutes() => "${(timeSeconds/60).ceil()} minutes";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['time_seconds'] = timeSeconds;
    data['question_count'] = questionCount;
    data['questions'] = questions!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;
  String? selectedAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
  :id=snapshot.id,
  question=snapshot["question"],
  answers=[],
  correctAnswer=snapshot["correct_answer"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers!.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, required this.answer});

  Answers.fromJson(Map<String, dynamic> json) :
    identifier = json['identifier'],
    answer = json['Answer'];

  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) :
    identifier = snapshot['identifier'] as String?,
    answer = snapshot['answers'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}
