import 'package:fetch_mobile_numbers/fetch_mobile_numbers.dart';
import 'package:fetch_mobile_numbers/sim_card/sim_card_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:harish_demo/LoginPage.dart';
import 'package:smartech_base/smartech_base.dart';
import 'package:smartech_push/smartech_push.dart';
import 'package:url_launcher/url_launcher.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(); // Ensure Firebase is initialized here too

  bool isFromSmt = await SmartechPush()
      .isNotificationFromSmartech(message.data.toString());
  if (isFromSmt) {
    SmartechPush().handlePushNotification(message.data.toString());
    print("pn background mode: ${message.data}");
    return;
  }
  // Handle if not from Smartech
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🔹 Initialize Firebase before runApp
  await Firebase.initializeApp();

  /// 🔹 Register background handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// 🔹 Request permission & set push token
  SmartechPush().updateNotificationPermission();

  final androidToken = await FirebaseMessaging.instance.getToken();
  if (androidToken != null) {
    SmartechPush().setDevicePushToken(androidToken);
    print("pn data: $androidToken");
  } else {
    print("pn token is null");
  }

  /// 🔹 Foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    bool isFromSmt = await SmartechPush()
        .isNotificationFromSmartech(message.data.toString());
    if (isFromSmt) {
      SmartechPush().handlePushNotification(message.data.toString());
      print("pn foreground mode: ${message.data}");
      return;
    }
    // Handle if not from Smartech
  });

  /// 🔹 Deeplink handler
  Smartech().onHandleDeeplink((
      String? smtDeeplinkSource,
      String? smtDeeplink,
      Map<dynamic, dynamic>? smtPayload,
      Map<dynamic, dynamic>? smtCustomPayload,
      ) async {
    print("smtDeeplinkSource: $smtDeeplinkSource, smtDeeplink: $smtDeeplink");

    if (smtDeeplink == null || smtDeeplink.trim().isEmpty) {
      print("Deep link is null or empty");
      return;
    }

    try {
      final Uri url = Uri.parse(smtDeeplink.trim());

      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        print("Could not launch $url");
      }
    } catch (e) {
      print("Error launching deeplink: $e");
    }
  });

  /// 🔹 Fetch SIM card numbers after everything is initialized
  final fetchMobileNumbers = FetchMobileNumbers();

  try {
    List<SimCard>? simCards = await fetchMobileNumbers.getMobileNumbers();
    print("Carrier Name: ${simCards}");
    if (simCards != null && simCards.isNotEmpty) {
      for (var simCard in simCards) {
        print("------ SIM INFO ------");
        print("Slot Index: ${simCard.slotIndex}");
        print("Carrier Name: ${simCard.carrierName}");
        print("Number: ${simCard.number}");
        print("----------------------");
      }
    } else {
      print("No SIM cards found.");
    }
  } catch (e) {
    print("Error fetching SIM cards: $e");
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
