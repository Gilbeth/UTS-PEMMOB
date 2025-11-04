import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/sample_data.dart';

class QuizProvider with ChangeNotifier {
  final List<Question> _questions = sampleQuestions;
  final Map<String, int> _answers = {}; // questionId -> selectedIndex

  int _currentIndex = 0;
  String? userName;

  List<Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  Map<String, int> get answers => Map.unmodifiable(_answers);

  Question get currentQuestion => _questions[_currentIndex];

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void selectAnswer(String questionId, int selectedIndex) {
    _answers[questionId] = selectedIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void prevQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void goTo(int index) {
    if (index >= 0 && index < _questions.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  int calculateScore() {
    int score = 0;
    for (var q in _questions) {
      final sel = _answers[q.id];
      if (sel != null && sel == q.correctIndex) score++;
    }
    return score;
  }

  void resetQuiz() {
    _answers.clear();
    _currentIndex = 0;
    userName = null;
    notifyListeners();
  }
}
