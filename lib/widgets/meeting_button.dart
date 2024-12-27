import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// A custom button widget for meeting actions.
class MeetingButton extends StatelessWidget {
  const MeetingButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  /// Callback function to be executed when the button is tapped.
  final VoidCallback onTap;

  /// Icon to be displayed on the button.
  final IconData icon;

  /// Text to be displayed below the icon.
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.green,
              boxShadow: const [
                BoxShadow(
                  color: Colors.lightGreen,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 8),
          AutoSizeText(
            text,
            style: TextStyle(fontSize: 12),
            maxLines: 2,
            minFontSize: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
