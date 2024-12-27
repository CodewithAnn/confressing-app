import 'package:confressing_app/notifiers/mute_notifier.dart';
import 'package:confressing_app/services/auth_services.dart';
import 'package:confressing_app/services/jitsi_service.dart';
import 'package:confressing_app/utills/colors.dart';
import 'package:confressing_app/widgets/join_meeting_option_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A screen that allows users to join a meeting by entering a room ID and user name.
class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  /// Controller for the room ID input field.
  late TextEditingController _roomIdController;

  /// Controller for the user name input field.
  late TextEditingController _userNameController;

  /// Instance of AuthServices to handle authentication.
  final AuthServices _authservices = AuthServices();

  /// Instance of JitisMeetServices to handle Jitsi Meet operations.
  final JitisMeetServices _jitisMeetServices = JitisMeetServices();

  @override
  void initState() {
    super.initState();
    _roomIdController = TextEditingController();
    _userNameController =
        TextEditingController(text: _authservices.user?.displayName);
  }

  @override
  void dispose() {
    _roomIdController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Meeting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _roomIdController,
                  keyboardType: TextInputType.number,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    fillColor: inputBackground,
                    filled: true,
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: "Meeting Id",
                    contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _userNameController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    fillColor: inputBackground,
                    filled: true,
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: "Name",
                    contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Consumer<MuteNotifier>(
                builder: (context, muteProvider, child) {
                  return InkWell(
                    onTap: () {
                      _jitisMeetServices.createMeeting(
                        roomName: _roomIdController.text,
                        isAudioMuted: muteProvider.isAudioMuted,
                        isVideoMuted: muteProvider.isAudioMuted,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: const Center(
                          child: Text(
                            "Join Meeting",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Consumer<MuteNotifier>(
                builder: (context, muteProvider, child) {
                  return JoinMeetingOptionButton(
                    text: 'Mute Audio',
                    isMute: muteProvider.isAudioMuted,
                    onChange: (val) {
                      muteProvider.setAudioMuted(val);
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Consumer<MuteNotifier>(
                builder: (context, muteProvider, child) {
                  return JoinMeetingOptionButton(
                    text: 'Turn Off My Video',
                    isMute: muteProvider.isVideoMuted,
                    onChange: (val) {
                      muteProvider.setVideoMuted(val);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
