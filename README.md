<div align="center">
  <h1>:incoming_envelope: flutter-firebase-notification</h1>
  <p>Sending notifications to a Flutter application using Firebase Cloud Messaging</p>
</div>

## Tech

- [Flutter][flutter] - Google’s UI toolkit to build apps for mobile, web, & desktop from a single codebase
- [Dart][dart] - Client-optimized language for fast apps on any platform
- [Firebase][firebase] - The tools and infrastructure to build better apps and grow successful businesses
- [Firebase Cloud Messaging][fcm] - Cross-platform messaging solution that lets you reliably send messages at no cost

## Getting started

In order to run this application you need to have [Flutter][flutter] installed in your machine and an Android device or emulator to run it. Unfortunatelly the project is not configured for iOS since I don't have a Mac, but the configuration is pretty straighforward.

### Firebase

Before starting the application you need to setup Firebase. It's very simple, all you have to do is create a project and generate the `google-services.json` file. Please follow the [FlutterFire documentation][flutterfire-docs] for more information.

### Sending messages

Once you have everything configured you can start sending notifications using the **Cloud Messaging** tool of Firebase. You can use either Firebase Console or the API using the service key, both should work the same.

The project is configured to receive both background and foreground notifications. If the application is in the background or killed, it will show a notification in the system tray. Otherwise, it will show an `AlertDialog` with the content of the message.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[flutter]: https://flutter.dev/
[dart]: https://dart.dev/
[firebase]: https://firebase.google.com/
[fcm]: https://firebase.google.com/docs/cloud-messaging
[flutterfire-docs]: https://firebase.flutter.dev/docs/overview/
