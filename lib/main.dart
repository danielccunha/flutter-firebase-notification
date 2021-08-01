import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_notification/pages/home.dart';
import 'package:flutter_firebase_notification/pages/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (ctx, snapshot) {
        return MaterialApp(
          title: 'Firebase Cloud Messaging',
          theme: ThemeData(primarySwatch: Colors.indigo),
          home: snapshot.connectionState == ConnectionState.done
              ? const HomePage()
              : const LoadingPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
