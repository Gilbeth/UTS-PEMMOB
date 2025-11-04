import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context, listen: false);
    final score = quiz.calculateScore();
    final total = quiz.questions.length;
    final userName = quiz.userName ?? 'Peserta';

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Kuis'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 700),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Selamat, $userName!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'PoppinsCustom')),
                SizedBox(height: 12),
                Text('Skor Anda', style: TextStyle(fontSize: 18)),
                SizedBox(height: 12),
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.12),
                  child: Text('$score / $total', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor)),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.replay),
                  label: Text('Ulangi Kuis'),
                  onPressed: () {
                    quiz.resetQuiz();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                ),
                SizedBox(height: 10),
                OutlinedButton.icon(
                  icon: Icon(Icons.share),
                  label: Text('Bagikan Hasil'),
                  onPressed: () {
                    // placeholder: share logic can be added
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fitur share belum diimplementasikan.')));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
