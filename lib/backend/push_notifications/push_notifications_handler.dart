import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/vnimc_1.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Splash1': ParameterData.none(),
  'Splash2': ParameterData.none(),
  'ChooseRole': ParameterData.none(),
  'RegisterPage': ParameterData.none(),
  'CreateAccauntPage': ParameterData.none(),
  'Slide': ParameterData.none(),
  'TouristHomePage': ParameterData.none(),
  'InteractivePage': (data) async => ParameterData(
        allParams: {
          'showVebinars': getParameter<bool>(data, 'showVebinars'),
          'showIvents': getParameter<bool>(data, 'showIvents'),
          'showTours': getParameter<bool>(data, 'showTours'),
        },
      ),
  'TourPage': (data) async => ParameterData(
        allParams: {
          'tourDocument': await getDocumentParameter<ToursRecord>(
              data, 'tourDocument', ToursRecord.fromSnapshot),
        },
      ),
  'TourPlanToday': (data) async => ParameterData(
        allParams: {
          'plan': await getDocumentParameter<TourPlanRecord>(
              data, 'plan', TourPlanRecord.fromSnapshot),
        },
      ),
  'test': ParameterData.none(),
  'TourPlanAll': (data) async => ParameterData(
        allParams: {
          'tourDocument': await getDocumentParameter<ToursRecord>(
              data, 'tourDocument', ToursRecord.fromSnapshot),
        },
      ),
  'yyyyy3': ParameterData.none(),
  'TourMap': (data) async => ParameterData(
        allParams: {
          'tourDocument': await getDocumentParameter<ToursRecord>(
              data, 'tourDocument', ToursRecord.fromSnapshot),
        },
      ),
  'TouristProfilePage': ParameterData.none(),
  'ChangeLanguage': ParameterData.none(),
  'GidHomePage': ParameterData.none(),
  'GalleryPageTour': (data) async => ParameterData(
        allParams: {
          'tourDoc': await getDocumentParameter<ToursRecord>(
              data, 'tourDoc', ToursRecord.fromSnapshot),
          'galleryTour': await getDocumentParameter<GalleryRecord>(
              data, 'galleryTour', GalleryRecord.fromSnapshot),
        },
      ),
  'GidProfilePage': ParameterData.none(),
  'AdminPage': ParameterData.none(),
  'AdminAddTourPage': ParameterData.none(),
  'AdminAddTourPlan': (data) async => ParameterData(
        allParams: {
          'tourDocument': await getDocumentParameter<ToursRecord>(
              data, 'tourDocument', ToursRecord.fromSnapshot),
        },
      ),
  'SplashDima': ParameterData.none(),
  'AdminTour': (data) async => ParameterData(
        allParams: {
          'tourDocument': await getDocumentParameter<ToursRecord>(
              data, 'tourDocument', ToursRecord.fromSnapshot),
        },
      ),
  'AdminAddVebinarPage': ParameterData.none(),
  'VebinarPage': (data) async => ParameterData(
        allParams: {
          'vebinarDocument': await getDocumentParameter<VebinarsRecord>(
              data, 'vebinarDocument', VebinarsRecord.fromSnapshot),
        },
      ),
  'AdminVebinar': (data) async => ParameterData(
        allParams: {
          'vebinarDocument': await getDocumentParameter<VebinarsRecord>(
              data, 'vebinarDocument', VebinarsRecord.fromSnapshot),
        },
      ),
  'GalleryPage': ParameterData.none(),
  'AdminAddIventPage': ParameterData.none(),
  'AdminIvent': (data) async => ParameterData(
        allParams: {
          'iventDocument': await getDocumentParameter<IventsRecord>(
              data, 'iventDocument', IventsRecord.fromSnapshot),
        },
      ),
  'IventPage': (data) async => ParameterData(
        allParams: {
          'iventDocument': await getDocumentParameter<IventsRecord>(
              data, 'iventDocument', IventsRecord.fromSnapshot),
        },
      ),
  'AdminAddNews': ParameterData.none(),
  'NewsPage': ParameterData.none(),
  'SingInPage': ParameterData.none(),
  'TourPageActive': (data) async => ParameterData(
        allParams: {
          'tourDocument': await getDocumentParameter<ToursRecord>(
              data, 'tourDocument', ToursRecord.fromSnapshot),
        },
      ),
  'NewsDetailPage': (data) async => ParameterData(
        allParams: {
          'newsDocument': await getDocumentParameter<NewsRecord>(
              data, 'newsDocument', NewsRecord.fromSnapshot),
        },
      ),
  'ThxPage': ParameterData.none(),
  'ChatAll': ParameterData.none(),
  'ChatWithUser': (data) async => ParameterData(
        allParams: {
          'chatDocument': await getDocumentParameter<ChatsRecord>(
              data, 'chatDocument', ChatsRecord.fromSnapshot),
        },
      ),
  'EmptyNotifications': ParameterData.none(),
  'AddReviewPage': ParameterData.none(),
  'AdminAddPhoto': (data) async => ParameterData(
        allParams: {
          'tour': await getDocumentParameter<ToursRecord>(
              data, 'tour', ToursRecord.fromSnapshot),
          'gallery': await getDocumentParameter<GalleryRecord>(
              data, 'gallery', GalleryRecord.fromSnapshot),
        },
      ),
  'SettingsPage': ParameterData.none(),
  'UpdateVebinar': (data) async => ParameterData(
        allParams: {
          'vebinar': await getDocumentParameter<VebinarsRecord>(
              data, 'vebinar', VebinarsRecord.fromSnapshot),
        },
      ),
  'UpdateIvent': (data) async => ParameterData(
        allParams: {
          'iventDocument': await getDocumentParameter<IventsRecord>(
              data, 'iventDocument', IventsRecord.fromSnapshot),
        },
      ),
  'EditAccauntPage': ParameterData.none(),
  'TariffsPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
