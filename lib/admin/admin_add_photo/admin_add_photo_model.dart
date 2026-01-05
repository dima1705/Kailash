import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'admin_add_photo_widget.dart' show AdminAddPhotoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddPhotoModel extends FlutterFlowModel<AdminAddPhotoWidget> {
  ///  Local state fields for this page.

  bool confirm = false;

  bool reject = false;

  DocumentReference? photoDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
