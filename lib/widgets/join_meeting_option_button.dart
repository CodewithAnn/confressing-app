import 'package:flutter/material.dart';

/// A custom widget for displaying a toggle option with a label.
class JoinMeetingOptionButton extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  const JoinMeetingOptionButton({
    super.key,
    required this.text,
    required this.isMute,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onChange,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
