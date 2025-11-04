import 'package:flutter/material.dart';
import '../models/question.dart';
import 'option_tile.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int? selectedIndex;
  final void Function(int) onSelect;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.selectedIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // adaptive padding
    final width = MediaQuery.of(context).size.width;
    final padding = width > 600 ? 24.0 : 16.0;
    final titleSize = width > 600 ? 20.0 : 16.0;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: EdgeInsets.all(padding),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w600, fontFamily: 'PoppinsCustom'),
            ),
            SizedBox(height: 12),
            ...List.generate(question.options.length, (i) {
              return OptionTile(
                text: question.options[i],
                selected: selectedIndex == i,
                onTap: () => onSelect(i),
              );
            }),
          ],
        ),
      ),
    );
  }
}
