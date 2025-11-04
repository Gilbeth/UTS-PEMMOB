import '../models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    text: 'Apa ibukota Indonesia?',
    options: ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
    correctIndex: 0,
  ),
  Question(
    id: 'q2',
    text: 'Bahasa pemrograman untuk Flutter adalah?',
    options: ['Kotlin', 'Dart', 'Swift', 'JavaScript'],
    correctIndex: 1,
  ),
  Question(
    id: 'q3',
    text: '2 + 2 = ?',
    options: ['3', '4', '5', '6'],
    correctIndex: 1,
  ),
  Question(
    id: 'q4',
    text: 'Manakah yang termasuk state management di Flutter?',
    options: ['Provider', 'Photoshop', 'Word', 'Excel'],
    correctIndex: 0,
  ),
];
