import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SlideWidget() : Splash1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? SlideWidget() : Splash1Widget(),
        ),
        FFRoute(
          name: Splash1Widget.routeName,
          path: Splash1Widget.routePath,
          builder: (context, params) => Splash1Widget(),
        ),
        FFRoute(
          name: Splash2Widget.routeName,
          path: Splash2Widget.routePath,
          builder: (context, params) => Splash2Widget(),
        ),
        FFRoute(
          name: ChooseRoleWidget.routeName,
          path: ChooseRoleWidget.routePath,
          builder: (context, params) => ChooseRoleWidget(),
        ),
        FFRoute(
          name: RegisterPageWidget.routeName,
          path: RegisterPageWidget.routePath,
          builder: (context, params) => RegisterPageWidget(),
        ),
        FFRoute(
          name: CreateAccauntPageWidget.routeName,
          path: CreateAccauntPageWidget.routePath,
          builder: (context, params) => CreateAccauntPageWidget(),
        ),
        FFRoute(
          name: SlideWidget.routeName,
          path: SlideWidget.routePath,
          builder: (context, params) => SlideWidget(),
        ),
        FFRoute(
          name: TouristHomePageWidget.routeName,
          path: TouristHomePageWidget.routePath,
          builder: (context, params) => TouristHomePageWidget(),
        ),
        FFRoute(
          name: InteractivePageWidget.routeName,
          path: InteractivePageWidget.routePath,
          builder: (context, params) => InteractivePageWidget(
            showVebinars: params.getParam(
              'showVebinars',
              ParamType.bool,
            ),
            showIvents: params.getParam(
              'showIvents',
              ParamType.bool,
            ),
            showTours: params.getParam(
              'showTours',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: TourPageWidget.routeName,
          path: TourPageWidget.routePath,
          asyncParams: {
            'tourDocument': getDoc(['Tours'], ToursRecord.fromSnapshot),
          },
          builder: (context, params) => TourPageWidget(
            tourDocument: params.getParam(
              'tourDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: TourPlanTodayWidget.routeName,
          path: TourPlanTodayWidget.routePath,
          asyncParams: {
            'plan': getDoc(['TourPlan'], TourPlanRecord.fromSnapshot),
          },
          builder: (context, params) => TourPlanTodayWidget(
            plan: params.getParam(
              'plan',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
        ),
        FFRoute(
          name: TourPlanAllWidget.routeName,
          path: TourPlanAllWidget.routePath,
          asyncParams: {
            'tourDocument': getDoc(['Tours'], ToursRecord.fromSnapshot),
          },
          builder: (context, params) => TourPlanAllWidget(
            tourDocument: params.getParam(
              'tourDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: Yyyyy3Widget.routeName,
          path: Yyyyy3Widget.routePath,
          builder: (context, params) => Yyyyy3Widget(),
        ),
        FFRoute(
          name: TourMapWidget.routeName,
          path: TourMapWidget.routePath,
          asyncParams: {
            'tourPlansDocuments':
                getDocList(['TourPlan'], TourPlanRecord.fromSnapshot),
            'tourDocument': getDoc(['Tours'], ToursRecord.fromSnapshot),
          },
          builder: (context, params) => TourMapWidget(
            tourPlansDocuments: params.getParam<TourPlanRecord>(
              'tourPlansDocuments',
              ParamType.Document,
              isList: true,
            ),
            tourDocument: params.getParam(
              'tourDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: TouristProfilePageWidget.routeName,
          path: TouristProfilePageWidget.routePath,
          builder: (context, params) => TouristProfilePageWidget(),
        ),
        FFRoute(
          name: ChangeLanguageWidget.routeName,
          path: ChangeLanguageWidget.routePath,
          builder: (context, params) => ChangeLanguageWidget(),
        ),
        FFRoute(
          name: GidHomePageWidget.routeName,
          path: GidHomePageWidget.routePath,
          builder: (context, params) => GidHomePageWidget(),
        ),
        FFRoute(
          name: GalleryPageTourWidget.routeName,
          path: GalleryPageTourWidget.routePath,
          asyncParams: {
            'tourDoc': getDoc(['Tours'], ToursRecord.fromSnapshot),
            'galleryTour': getDoc(['Gallery'], GalleryRecord.fromSnapshot),
          },
          builder: (context, params) => GalleryPageTourWidget(
            tourDoc: params.getParam(
              'tourDoc',
              ParamType.Document,
            ),
            galleryTour: params.getParam(
              'galleryTour',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: GidProfilePageWidget.routeName,
          path: GidProfilePageWidget.routePath,
          builder: (context, params) => GidProfilePageWidget(),
        ),
        FFRoute(
          name: AdminPageWidget.routeName,
          path: AdminPageWidget.routePath,
          builder: (context, params) => AdminPageWidget(),
        ),
        FFRoute(
          name: AdminAddTourPageWidget.routeName,
          path: AdminAddTourPageWidget.routePath,
          builder: (context, params) => AdminAddTourPageWidget(),
        ),
        FFRoute(
          name: AdminAddTourPlanWidget.routeName,
          path: AdminAddTourPlanWidget.routePath,
          asyncParams: {
            'tourDocument': getDoc(['Tours'], ToursRecord.fromSnapshot),
          },
          builder: (context, params) => AdminAddTourPlanWidget(
            tourDocument: params.getParam(
              'tourDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SplashDimaWidget.routeName,
          path: SplashDimaWidget.routePath,
          builder: (context, params) => SplashDimaWidget(),
        ),
        FFRoute(
          name: AdminTourWidget.routeName,
          path: AdminTourWidget.routePath,
          asyncParams: {
            'tourDocument': getDoc(['Tours'], ToursRecord.fromSnapshot),
          },
          builder: (context, params) => AdminTourWidget(
            tourDocument: params.getParam(
              'tourDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminAddVebinarPageWidget.routeName,
          path: AdminAddVebinarPageWidget.routePath,
          builder: (context, params) => AdminAddVebinarPageWidget(),
        ),
        FFRoute(
          name: VebinarPageWidget.routeName,
          path: VebinarPageWidget.routePath,
          asyncParams: {
            'vebinarDocument':
                getDoc(['Vebinars'], VebinarsRecord.fromSnapshot),
          },
          builder: (context, params) => VebinarPageWidget(
            vebinarDocument: params.getParam(
              'vebinarDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminVebinarWidget.routeName,
          path: AdminVebinarWidget.routePath,
          asyncParams: {
            'vebinarDocument':
                getDoc(['Vebinars'], VebinarsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminVebinarWidget(
            vebinarDocument: params.getParam(
              'vebinarDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: GalleryPageWidget.routeName,
          path: GalleryPageWidget.routePath,
          builder: (context, params) => GalleryPageWidget(),
        ),
        FFRoute(
          name: AdminAddIventPageWidget.routeName,
          path: AdminAddIventPageWidget.routePath,
          builder: (context, params) => AdminAddIventPageWidget(),
        ),
        FFRoute(
          name: AdminIventWidget.routeName,
          path: AdminIventWidget.routePath,
          asyncParams: {
            'iventDocument': getDoc(['Ivents'], IventsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminIventWidget(
            iventDocument: params.getParam(
              'iventDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: IventPageWidget.routeName,
          path: IventPageWidget.routePath,
          asyncParams: {
            'iventDocument': getDoc(['Ivents'], IventsRecord.fromSnapshot),
          },
          builder: (context, params) => IventPageWidget(
            iventDocument: params.getParam(
              'iventDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminAddNewsWidget.routeName,
          path: AdminAddNewsWidget.routePath,
          builder: (context, params) => AdminAddNewsWidget(),
        ),
        FFRoute(
          name: NewsPageWidget.routeName,
          path: NewsPageWidget.routePath,
          builder: (context, params) => NewsPageWidget(),
        ),
        FFRoute(
          name: SingInPageWidget.routeName,
          path: SingInPageWidget.routePath,
          builder: (context, params) => SingInPageWidget(),
        ),
        FFRoute(
          name: TourPageActiveWidget.routeName,
          path: TourPageActiveWidget.routePath,
          asyncParams: {
            'tourDocument': getDoc(['Tours'], ToursRecord.fromSnapshot),
          },
          builder: (context, params) => TourPageActiveWidget(
            tourDocument: params.getParam(
              'tourDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NewsDetailPageWidget.routeName,
          path: NewsDetailPageWidget.routePath,
          asyncParams: {
            'newsDocument': getDoc(['News'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => NewsDetailPageWidget(
            newsDocument: params.getParam(
              'newsDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ThxPageWidget.routeName,
          path: ThxPageWidget.routePath,
          builder: (context, params) => ThxPageWidget(),
        ),
        FFRoute(
          name: ChatAllWidget.routeName,
          path: ChatAllWidget.routePath,
          builder: (context, params) => ChatAllWidget(),
        ),
        FFRoute(
          name: ChatWithUserWidget.routeName,
          path: ChatWithUserWidget.routePath,
          asyncParams: {
            'chatDocument': getDoc(['Chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ChatWithUserWidget(
            chatDocument: params.getParam(
              'chatDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EmptyNotificationsWidget.routeName,
          path: EmptyNotificationsWidget.routePath,
          builder: (context, params) => EmptyNotificationsWidget(),
        ),
        FFRoute(
          name: AddReviewPageWidget.routeName,
          path: AddReviewPageWidget.routePath,
          builder: (context, params) => AddReviewPageWidget(),
        ),
        FFRoute(
          name: AdminAddPhotoWidget.routeName,
          path: AdminAddPhotoWidget.routePath,
          asyncParams: {
            'tour': getDoc(['Tours'], ToursRecord.fromSnapshot),
            'gallery': getDoc(['Gallery'], GalleryRecord.fromSnapshot),
          },
          builder: (context, params) => AdminAddPhotoWidget(
            tour: params.getParam(
              'tour',
              ParamType.Document,
            ),
            gallery: params.getParam(
              'gallery',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SettingsPageWidget.routeName,
          path: SettingsPageWidget.routePath,
          builder: (context, params) => SettingsPageWidget(),
        ),
        FFRoute(
          name: UpdateVebinarWidget.routeName,
          path: UpdateVebinarWidget.routePath,
          asyncParams: {
            'vebinar': getDoc(['Vebinars'], VebinarsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateVebinarWidget(
            vebinar: params.getParam(
              'vebinar',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateIventWidget.routeName,
          path: UpdateIventWidget.routePath,
          asyncParams: {
            'iventDocument': getDoc(['Ivents'], IventsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateIventWidget(
            iventDocument: params.getParam(
              'iventDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditAccauntPageWidget.routeName,
          path: EditAccauntPageWidget.routePath,
          builder: (context, params) => EditAccauntPageWidget(),
        ),
        FFRoute(
          name: TariffsPageWidget.routeName,
          path: TariffsPageWidget.routePath,
          builder: (context, params) => TariffsPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/vnimc_1.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
