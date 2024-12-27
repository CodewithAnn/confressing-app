import 'package:confressing_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitisMeetServices {
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    AuthServices _authservices = AuthServices();
    try {
      var options = JitsiMeetConferenceOptions(
        // serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": "JitsiwithFlutter",
          // "localSubject": "localJitsiwithFlutter",
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false,
          "security-options.enabled": false
        },
        userInfo: JitsiMeetUserInfo(
          displayName: _authservices.user?.displayName ?? 'Guest',
          email: _authservices.user?.email,
          avatar: _authservices.user?.photoURL,
        ),
      );
      await JitsiMeet().join(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
