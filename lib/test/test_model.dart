import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'dart:ui';
import '/index.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'test_widget.dart' show TestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TourLocation widget.
  FocusNode? tourLocationFocusNode;
  TextEditingController? tourLocationTextController;
  String? Function(BuildContext, String?)? tourLocationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tourLocationFocusNode?.dispose();
    tourLocationTextController?.dispose();
  }
}
