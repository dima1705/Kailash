import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'swith_component_model.dart';
export 'swith_component_model.dart';

class SwithComponentWidget extends StatefulWidget {
  const SwithComponentWidget({super.key});

  @override
  State<SwithComponentWidget> createState() => _SwithComponentWidgetState();
}

class _SwithComponentWidgetState extends State<SwithComponentWidget> {
  late SwithComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwithComponentModel());

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

    return AuthUserStreamWidget(
      builder: (context) => Container(
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: valueOrDefault<Color>(
              valueOrDefault<bool>(
                          currentUserDocument?.allowNotification, false) ||
                      FFAppState().allowNotification
                  ? Color(0xFFE8640C)
                  : Color(0x7EFFFFFF),
              Color(0xFFE8640C),
            ),
            width: 3.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (valueOrDefault<bool>(
                      currentUserDocument?.allowNotification, false) ||
                  FFAppState().allowNotification) {
                await currentUserReference!.update(createUsersRecordData(
                  allowNotification: false,
                ));
                FFAppState().allowNotification = false;
                safeSetState(() {});
              } else {
                await currentUserReference!.update(createUsersRecordData(
                  allowNotification: true,
                ));
                FFAppState().allowNotification = true;
                safeSetState(() {});
              }
            },
            child: Stack(
              alignment: AlignmentDirectional(
                  valueOrDefault<double>(
                    valueOrDefault<bool>(currentUserDocument?.allowNotification,
                                false) ||
                            FFAppState().allowNotification
                        ? 1.0
                        : -1.0,
                    1.0,
                  ),
                  0.0),
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: valueOrDefault<Color>(
                          valueOrDefault<bool>(
                                      currentUserDocument?.allowNotification,
                                      false) ||
                                  FFAppState().allowNotification
                              ? Color(0xFFE8640C)
                              : Color(0x7EFFFFFF),
                          Color(0xFFE8640C),
                        ),
                        width: 3.0,
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
