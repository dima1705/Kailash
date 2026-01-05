import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/photo/photo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'gallery_page_tour_widget.dart' show GalleryPageTourWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GalleryPageTourModel extends FlutterFlowModel<GalleryPageTourWidget> {
  ///  Local state fields for this page.

  String? photoImg;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  GalleryPhotoRecord? photoDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
