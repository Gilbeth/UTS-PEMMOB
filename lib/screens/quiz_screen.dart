import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (ctx, quiz, child) {
        final q = quiz.currentQuestion;
        final selected = quiz.answers[q.id];
        final total = quiz.questions.length;

        return Scaffold(
          appBar: AppBar(
            title: Text('Soal ${quiz.currentIndex + 1} / $total'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: QuestionCard(
                      question: q,
                      selectedIndex: selected,
                      onSelect: (i) {
                        quiz.selectAnswer(q.id, i);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      if (quiz.currentIndex > 0)
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_back),
                          label: Text('Sebelumnya'),
                          onPressed: quiz.prevQuestion,
                        ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // jump to question list bottom sheet
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Container(
                                padding: EdgeInsets.all(12),
                                child: Wrap(
                                  spacing: 8,
                                  children: List.generate(total, (i) {
                                    final answered = quiz.answers[quiz.questions[i].id] != null;
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: i == quiz.currentIndex ? Theme.of(context).primaryColor : null,
                                      ),
                                      child: Text('${i + 1}${answered ? " ✓" : ""}'),
                                      onPressed: () {
                                        quiz.goTo(i);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  }),
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Daftar Soal'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton.icon(
                        icon: Icon(Icons.arrow_forward),
                        label: Text(quiz.currentIndex == total - 1 ? 'Selesai' : 'Berikutnya'),
                        onPressed: () {
                          if (quiz.currentIndex == total - 1) {
                            Navigator.of(context).pushReplacementNamed(ResultScreen.routeName);
                          } else {
                            quiz.nextQuestion();
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
