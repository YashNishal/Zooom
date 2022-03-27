import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zooom/resources/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JistsiMeetMethods _jistsiMeetMethods = JistsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000000) + 100000000).toString();
    _jistsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }


  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.videocam,
                text: 'New Meeting',
              ),
              HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: 'join Meeting',
              ),
              HomeMeetingButton(
                onPressed: () {},
                icon: Icons.calendar_today,
                text: 'Schedule',
              ),
              HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: 'Share Screen',
              ),
            ],
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
