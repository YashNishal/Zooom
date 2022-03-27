import 'package:flutter/material.dart';
import 'package:zooom/resources/firestore_methods.dart';
import 'package:intl/intl.dart';
import 'package:zooom/utils/colors.dart';

class MeetingHistoryScreen extends StatelessWidget {
  const MeetingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(
                  'Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: buttonColor,fontSize: 18),
                ),
                subtitle: Text(
                  'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                ),
              )),
        );
      },
    );
  }
}
