import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final bool disabled;
  final VoidCallback onTap;

  const OptionTile({
    Key? key,
    required this.text,
    required this.selected,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // responsive sizing
    final width = MediaQuery.of(context).size.width;
    final fontSize = width > 600 ? 18.0 : 14.0;

    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor.withOpacity(0.12) : Colors.white,
          border: Border.all(
            color: selected ? Theme.of(context).primaryColor : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: fontSize,
              backgroundColor: selected ? Theme.of(context).primaryColor : Colors.grey.shade200,
              child: Text(
                text.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontSize: fontSize - 2,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: fontSize, height: 1.22, fontFamily: 'PoppinsCustom'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
