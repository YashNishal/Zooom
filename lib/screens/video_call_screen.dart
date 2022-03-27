import 'package:flutter/material.dart';
import 'package:zooom/resources/auth_methods.dart';
import 'package:zooom/resources/jitsi_meet_methods.dart';
import 'package:zooom/utils/Colors.dart';
import 'package:zooom/widgets/meeting_option.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JistsiMeetMethods _jistsiMeetMethods = JistsiMeetMethods();

  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  void _joinMeeting() {
    _jistsiMeetMethods.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        userName: nameController.text);
  }

  void toggleChangeAudio(value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  void toggleChangeVideo(value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Join a Meeting',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.all(4)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.all(4)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const Spacer(),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            toggleChange: toggleChangeAudio,
          ),
          MeetingOption(
            text: 'Turn off video',
            isMute: isVideoMuted,
            toggleChange: toggleChangeVideo,
          ),
        ],
      ),
    );
  }
}
