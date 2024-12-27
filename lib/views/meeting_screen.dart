import 'dart:math';

import 'package:confressing_app/services/jitsi_service.dart';
import 'package:confressing_app/widgets/meeting_button.dart';
import 'package:flutter/material.dart';

/// The screen that contains buttons for creating, joining, and scheduling meetings.
class MeetingScreen extends StatelessWidget {
  MeetingScreen({
    super.key,
  });

  final JitisMeetServices _jitsiMeetServices = JitisMeetServices();

  /// Creates a new meeting with a random room name.
  void createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetServices.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  /// Navigates to the join meeting screen.
  void joinMeeting(BuildContext context) {
    // Implement logic to join meeting
    Navigator.pushNamed(context, '/join-meeting');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          MeetingButton(
            onTap: () {
              joinMeeting(context);
            },
            icon: Icons.add,
            text: """Join Meeting""",
          ),
          MeetingButton(
            onTap: () {},
            icon: Icons.calendar_today,
            text: "Schedule Meeting",
          ),
          MeetingButton(
            onTap: createNewMeeting,
            icon: Icons.video_call,
            text: " Start Meeting",
          ),
        ],
      ),
    );
  }
}
