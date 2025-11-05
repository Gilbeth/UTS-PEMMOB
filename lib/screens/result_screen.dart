import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

/// Halaman untuk menampilkan hasil akhir kuis.
/// Menunjukkan skor pengguna, nama, dan opsi untuk mengulang atau membagikan hasil.
class ResultScreen extends StatelessWidget {
  static const routeName = '/result';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context, listen: false);
    final score = quiz.calculateScore();
    final total = quiz.questions.length;
    final userName = quiz.userName ?? 'Peserta';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat, $userName!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'PoppinsCustom',
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Skor Anda',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 12),
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Theme.of(context)
                      .primaryColor
                      .withValues(alpha: 0.12), // ✅ Fixed here
                  child: Text(
                    '$score / $total',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.replay),
                  label: const Text('Ulangi Kuis'),
                  onPressed: () {
                    quiz.resetQuiz();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                ),
                
                      
                  
                  
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
