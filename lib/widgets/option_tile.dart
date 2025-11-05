import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final bool disabled;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    // Responsif: atur ukuran font berdasarkan lebar layar
    final width = MediaQuery.of(context).size.width;
    final fontSize = width > 600 ? 18.0 : 14.0;

    return InkWell(
      onTap: disabled ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor.withValues(alpha: 0.12) // ✅ Ganti .withOpacity() → .withValues()
              : Colors.white,
          border: Border.all(
            color: selected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03), // ✅ Ganti juga di sini
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: fontSize,
              backgroundColor: selected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade200,
              child: Text(
                
                "O".toUpperCase(),
                style: TextStyle(
                  fontSize: fontSize - 2,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.22,
                  fontFamily: 'PoppinsCustom',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
