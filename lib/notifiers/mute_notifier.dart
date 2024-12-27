import 'package:flutter/material.dart';

class MuteNotifier extends ChangeNotifier {
 
  bool _isAudioMuted = true;
  bool _isVideoMuted = true;

  
  bool get isAudioMuted => _isAudioMuted;
  bool get isVideoMuted => _isVideoMuted;

  void setVideoMuted(bool value) {
    _isVideoMuted = value;
    notifyListeners();
  }

  void setAudioMuted(bool value) {
    _isAudioMuted = value;
    notifyListeners();
  }
}
