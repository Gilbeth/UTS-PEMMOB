import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final mq = MediaQuery.of(context);
    final isLarge = mq.size.width > 600;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 900),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLarge)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/logo.png', height: 80),
                            SizedBox(height: 12),
                            Text(
                              'Aplikasi Kuis Pilihan Ganda',
                              style: TextStyle(fontSize: 28, fontFamily: 'PoppinsCustom', fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Text('Masukkan nama lalu mulai kuis. Jawaban Anda akan tersimpan saat rotasi/perpindahan layar.',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: Image.asset('assets/images/quiz_illustration.png', height: 200),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      Image.asset('assets/images/logo.png', height: 80),
                      SizedBox(height: 12),
                      Text(
                        'Aplikasi Kuis Pilihan Ganda',
                        style: TextStyle(fontSize: 22, fontFamily: 'PoppinsCustom', fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 8),
                      Image.asset('assets/images/quiz_illustration.png', height: 160),
                    ],
                  ),

                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.play_arrow),
                      label: Text('Mulai Kuis'),
                      onPressed: () {
                        final name = _nameController.text.trim();
                        if (name.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Masukkan nama terlebih dahulu.')));
                          return;
                        }
                        provider.setUserName(name);
                        Navigator.of(context).pushNamed('/quiz');
                      },
                    ),
                    SizedBox(width: 12),
                    OutlinedButton.icon(
                      icon: Icon(Icons.refresh),
                      label: Text('Reset'),
                      onPressed: () {
                        provider.resetQuiz();
                        _nameController.clear();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text('Bonus: Responsive layout & custom font included.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
