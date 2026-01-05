import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible:
          valueOrDefault<bool>(currentUserDocument?.isAdmin, false) == false,
      child: AuthUserStreamWidget(
        builder: (context) => Container(
          width: 310.0,
          height: 65.0,
          decoration: BoxDecoration(
            color: Color(0xFF303030),
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (valueOrDefault<bool>(
                          currentUserDocument?.isGid, false)) {
                        context.pushNamed(
                          GidHomePageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      } else {
                        context.pushNamed(
                          TouristHomePageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      }

                      FFAppState().NavHome = true;
                      FFAppState().NavTours = false;
                      FFAppState().NavChat = false;
                      FFAppState().NavProfile = false;
                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (FFAppState().NavHome)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/Group_224.png',
                                    ).image,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          if (FFAppState().NavHome == false)
                            Opacity(
                              opacity: 0.3,
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/icon_(34).png',
                                    ).image,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().NavHome = false;
                      FFAppState().NavTours = true;
                      FFAppState().NavChat = false;
                      FFAppState().NavProfile = false;
                      safeSetState(() {});

                      context.pushNamed(
                        InteractivePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (FFAppState().NavTours)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/icon_(12).png',
                                    ).image,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          if (FFAppState().NavTours == false)
                            Container(
                              width: 23.0,
                              height: 23.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/Clip_path_group-1.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ChatAllWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );

                      FFAppState().NavHome = false;
                      FFAppState().NavTours = false;
                      FFAppState().NavChat = true;
                      FFAppState().NavProfile = false;
                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (FFAppState().NavChat)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/icon_(15).png',
                                    ).image,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          if (FFAppState().NavChat == false)
                            Container(
                              width: 23.0,
                              height: 23.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/Clip_path_group-2.png',
                                  ).image,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (FFAppState().NavStore)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 9.0, 0.0, 0.0),
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/icon_(18).png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        if (FFAppState().NavStore == false)
                          Container(
                            width: 23.0,
                            height: 23.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: Image.asset(
                                  'assets/images/Clip_path_group-3.png',
                                ).image,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (valueOrDefault<bool>(
                          currentUserDocument?.isGid, false)) {
                        context.pushNamed(
                          GidProfilePageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      } else {
                        context.pushNamed(
                          TouristProfilePageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      }

                      FFAppState().NavHome = false;
                      FFAppState().NavTours = false;
                      FFAppState().NavChat = false;
                      FFAppState().NavProfile = true;
                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (FFAppState().NavProfile)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 9.0, 0.0, 0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/icon_(20).png',
                                    ).image,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          if (FFAppState().NavProfile == false)
                            Container(
                              width: 23.0,
                              height: 23.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/Clip_path_group.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
