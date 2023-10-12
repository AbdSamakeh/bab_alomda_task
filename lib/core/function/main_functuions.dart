// import '../../app/my_app.dart';
// import '../../router/app_router.dart';

//Firebase Notification Listener
// void firebaseNotificationListener() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     var androidDetails = const AndroidNotificationDetails(
//       '0',
//       'Pill Store Chanel',
//       channelDescription: 'Hande Push Notification',
//       importance: Importance.high,
//     );
//     var platformDetails = NotificationDetails(android: androidDetails);
//     await FlutterLocalNotificationsPlugin().show(
//       0,
//       message.notification!.title,
//       message.notification!.body,
//       platformDetails,
//       payload: message.data['payload'],
//     );
//   });
// }

// //Open Notification Handller
// Future<void> onOpenNotification() async {
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//     // _onNotificationTap(message.data['payload']);
//     await MyApp.myAppKey.currentState!
//         .pushNamed(RouteNamedScreens.notificationNameRoute);
//   });
//   await FlutterLocalNotificationsPlugin().initialize(
//     const InitializationSettings(
//       iOS: DarwinInitializationSettings(),
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//     ),
//     onDidReceiveNotificationResponse: (details) async {
//       await MyApp.myAppKey.currentState!
//           .pushNamed(RouteNamedScreens.notificationNameRoute);
//     },
//   );
// }

// //Notification Firebase Background Handller
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   var androidDetails = const AndroidNotificationDetails(
//       '1', 'Background Pill Store Chanel',
//       channelDescription: 'your channel description',
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: 'ticker');
//   var iosDetails = const DarwinNotificationDetails();
//   var generalNotificationDetails =
//       NotificationDetails(android: androidDetails, iOS: iosDetails);
//   await flutterLocalNotificationsPlugin.show(
//     message.notification.hashCode,
//     message.notification!.title,
//     message.notification!.body,
//     generalNotificationDetails,
//     payload: message.data['payload'],
//   );
// }

// //Dynamic Links
// Future<void> listenDynamicLinks() async {
//   FirebaseDynamicLinks firebaseLink = FirebaseDynamicLinks.instance;
//   final PendingDynamicLinkData? data = await firebaseLink.getInitialLink();
//   final Uri? initialLink = data?.link;
//   // final dynamicLinkParams = DynamicLinkParameters(
//   //   link: Uri.parse("https://www.example.com/"),
//   //   uriPrefix: "https://example.page.link",
//   //   androidParameters:
//   //       const AndroidParameters(packageName: "com.example.pill_store"),
//   //   iosParameters: const IOSParameters(bundleId: "com.example.pillStore"),
//   // );
//   // final dynamicLink =
//   //     await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

//   if (initialLink != null) {
//     moveByDynamicLink(initialLink);
//   }
//   await Future.delayed(const Duration(seconds: 1));

//   firebaseLink.onLink.listen((PendingDynamicLinkData dynamicLink) async {
//     // dynamicLinks.add(dynamicLink);
//     // final Uri curLink = dynamicLinks.last.link;
//     // moveByDynamicLink(curLink);
//     moveByDynamicLink(dynamicLink.link);
//   });
// }

// //Navigate Throw Dynamic Link
// void moveByDynamicLink(Uri dynamicLink) {
//   // Handle the deep link by navigating to a specific page in your app
//   // You can use the data in the dynamic link to determine which page to navigate to
//   // For example, if the dynamic link is https://yourapp.com/product-detail?id=1234
//   // you can extract the product ID "1234" from the link and pass it to the
//   // product detail page.
//   // You can use the Navigator class to navigate to the desired page.

//   // Example code to extract query parameters from the dynamic link
//   final queryParams = dynamicLink.queryParameters;
//   // ignore: unused_local_variable
//   final productId = queryParams['id'];

//   // Example code to navigate to a product detail page
//   // Navigator.push(
//   //   context,
//   //   MaterialPageRoute(builder: (context) => ProductDetailPage(productId)),
//   // );
// }
