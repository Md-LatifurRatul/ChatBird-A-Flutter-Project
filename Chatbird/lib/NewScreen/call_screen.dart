import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          callCard(
            "Latifur Islam",
            Icons.call_made,
            Colors.green,
            "November 4, 18:35",
            "01732103831",
          ),
          callCard("Badhon Islam", Icons.call_missed, Colors.red,
              "November 2, 16:35", "01712232423"),
          callCard("Shagor Islam", Icons.call_received, Colors.green,
              "November 1, 3:35", "01932103831"),
          callCard("Latifur Islam", Icons.call_made, Colors.green,
              "November 4, 18:35", "01832103831"),
          callCard("Badhon Islam", Icons.call_missed, Colors.red,
              "November 2, 16:35", "01332103831"),
          callCard("Shagor Islam", Icons.call_received, Colors.green,
              "November 1, 3:35", "01432103831"),
          callCard("Muaz Islam", Icons.call_missed, Colors.red,
              "September 28, 18:35", "01912103830"),
          callCard("Sakhawat Islam", Icons.call_received, Colors.green,
              "September 13, 1:35", "01832103831"),
          callCard("Mahin Islam", Icons.call_made, Colors.green,
              "November 1, 4:35", "01632103831"),
        ],
      ),
    );
  }

  Widget callCard(String name, IconData iconData, Color iconColor, String time,
      String phoneNumber) {
    return Card(
      margin: EdgeInsets.only(bottom: 0.5),
      child: ListTile(
        onTap: () => _launchCaller(phoneNumber),
        leading: CircleAvatar(
          radius: 26,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              time,
              style: TextStyle(fontSize: 12.8),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          size: 28,
          color: Colors.teal,
        ),
      ),
    );
  }

  void _launchCaller(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
