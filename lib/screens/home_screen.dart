import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

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
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLarge)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Logo aplikasi (center)
                              Center(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 250,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.school, size: 80, color: Colors.blueAccent),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Aplikasi Kuis Pilihan Ganda',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'PoppinsCustom',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Masukkan nama lalu mulai kuis. Jawaban Anda akan tersimpan saat rotasi atau perpindahan layar.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                        ),
                        const SizedBox(width: 24),
                        // Ganti ilustrasi dengan ikon besar (tidak pakai gambar eksternal)
                      
                      ],
                    )
                  else
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.school, size: 80, color: Colors.blueAccent),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Aplikasi Kuis Pilihan Ganda',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'PoppinsCustom',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Mulai Kuis'),
                        onPressed: () {
                          final name = _nameController.text.trim();
                          if (name.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Masukkan nama terlebih dahulu.'),
                              ),
                            );
                            return;
                          }
                          provider.setUserName(name);
                          Navigator.of(context).pushNamed('/quiz');
                        },
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset'),
                        onPressed: () {
                          provider.resetQuiz();
                          _nameController.clear();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
