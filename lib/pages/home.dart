import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Cloud Messaging'),
        centerTitle: true,
      ),
    );
  }

  Future _initialize() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    debugPrint('User granted permission: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await messaging.subscribeToTopic('developers');
      final token = await messaging.getToken();
      debugPrint('Token: $token');

      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(message.notification!.title ?? 'Notification'),
              content: Text(message.notification!.body ?? 'No content.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        }
      });
    }
  }
}
