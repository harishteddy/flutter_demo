import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:harish_demo/LoginPage.dart';
import 'package:smartech_base/smartech_base.dart';
import 'package:smartech_nudges/listener/px_listener.dart';
import 'package:smartech_nudges/netcore_px.dart';
import 'package:smartech_nudges/px_widget.dart';
import 'package:smartech_nudges/tracker/route_obersver.dart';
import 'package:smartech_push/smartech_push.dart';
import 'package:smartech_push/smt_notification_callback.dart';
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

  /// 🔹 Foreground message handlers
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




  runApp(const MyApp());
}



class _PxDeeplinkListenerImpl extends PxDeeplinkListener {
  @override
  void onLaunchUrl(String url) {
    debugPrint('PXDeeplink: $url');
  }
}

class _PxActionListenerImpl extends PxActionListener {

  @override
  void onActionPerformed(String action) {
    debugPrint('PXAction: $action');
  }
}

class _PxInternalEventsListener extends PxInternalEventsListener {

  @override
  void onEvent(String eventName, Map dataFromHansel) {

    Map<String, dynamic> newMap = Map<String, dynamic>. from(dataFromHansel.map ((key, value) {
      return MapEntry (key.toString(), value);
    }));
    Smartech().trackEvent(eventName, newMap);
    debugPrint('PXEvent: $eventName eventData : $dataFromHansel');
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    NetcorePX.instance.registerPxActionListener("flutter action",_PxActionListenerImpl());
    NetcorePX.instance.registerPxInternalEventsListener(_PxInternalEventsListener());
    NetcorePX.instance.registerPxDeeplinkListener(_PxDeeplinkListenerImpl());
    NetcorePX.instance.enableDebugLogs();
    NetcorePX.instance.enableHierarchyLogs();
    SmartechPush().requestNotificationPermission(MyNotificationPermissionCallback());
    return SmartechPxWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        navigatorObservers: [PxNavigationObserver()],
        home: LoginPage(),
      ),
    );
  }
}

class MyNotificationPermissionCallback implements SMTNotificationPermissionCallback {
  @override
  void notificationPermissionStatus(int status) {
    print('Permission status: $status');
  }
}

