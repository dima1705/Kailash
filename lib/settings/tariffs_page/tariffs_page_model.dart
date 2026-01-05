import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'tariffs_page_widget.dart' show TariffsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TariffsPageModel extends FlutterFlowModel<TariffsPageWidget> {
  ///  Local state fields for this page.

  bool monthly = false;

  bool year = false;

  bool club108 = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PaymentsRecord? payM;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PaymentsRecord? payY;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PaymentsRecord? pay108;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
