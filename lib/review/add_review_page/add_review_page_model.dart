import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/hard_rating/hard_rating_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_review_page_widget.dart' show AddReviewPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddReviewPageModel extends FlutterFlowModel<AddReviewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HardRating component.
  late HardRatingModel hardRatingModel1;
  // Model for HardRating component.
  late HardRatingModel hardRatingModel2;
  // Model for HardRating component.
  late HardRatingModel hardRatingModel3;

  @override
  void initState(BuildContext context) {
    hardRatingModel1 = createModel(context, () => HardRatingModel());
    hardRatingModel2 = createModel(context, () => HardRatingModel());
    hardRatingModel3 = createModel(context, () => HardRatingModel());
  }

  @override
  void dispose() {
    hardRatingModel1.dispose();
    hardRatingModel2.dispose();
    hardRatingModel3.dispose();
  }
}
