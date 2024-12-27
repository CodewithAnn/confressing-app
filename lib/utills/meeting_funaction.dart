import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:flutter/cupertino.dart';

/// Joins a Jitsi meeting room with the specified room ID and user name.
Future<void> joinMeeting({required String roomId, required String userName}) async {
  try {
    var options = JitsiMeetConferenceOptions(
      room: roomId,
      userInfo: JitsiMeetUserInfo(
        displayName: userName,
      ),
      configOverrides: {
        "prejoinPageEnabled": false, // Disable pre-join page
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false,
        "security-options.enabled": false,
      },
    );
    await JitsiMeet().join(options);
  } catch (error) {
    debugPrint("Error: $error");
  }
}

/// Creates a Jitsi meeting room as a host with the specified room ID and user name.
Future<void> createMeetingAsHost({required String roomId, required String userName}) async {
  try {
    var options = JitsiMeetConferenceOptions(
      room: roomId,
      userInfo: JitsiMeetUserInfo(
        displayName: userName,
      ),
      configOverrides: {
        "prejoinPageEnabled": false, // Disable pre-join page
        "requireDisplayName": false, // Disable waiting for moderator
        "lobby.enabled": false, // Disable lobby feature
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false,
        "security-options.enabled": false,
        "moderator.enabled": true, // Automatically become moderator
      },
    );
    await JitsiMeet().join(options);
  } catch (error) {
    debugPrint("Error: $error");
  }
}