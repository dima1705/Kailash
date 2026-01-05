import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:ui';
import '/index.dart';
import 'admin_add_tour_plan_widget.dart' show AdminAddTourPlanWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddTourPlanModel extends FlutterFlowModel<AdminAddTourPlanWidget> {
  ///  Local state fields for this page.

  bool addTimeSchedule = false;

  DocumentReference? day;

  int? dayNum = 1;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TourPlanRecord? tourDay;
  DateTime? datePicked;
  // State field(s) for ScheduleTitle widget.
  FocusNode? scheduleTitleFocusNode;
  TextEditingController? scheduleTitleTextController;
  String? Function(BuildContext, String?)? scheduleTitleTextControllerValidator;
  String? _scheduleTitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заголовок is required';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for ScheduleDescription widget.
  FocusNode? scheduleDescriptionFocusNode;
  TextEditingController? scheduleDescriptionTextController;
  String? Function(BuildContext, String?)?
      scheduleDescriptionTextControllerValidator;
  String? _scheduleDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заголовок is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Container widget.
  bool? valid2;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TourDayScheduleRecord? daySchedule;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? chatDocument;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  GalleryRecord? galleryTour;

  @override
  void initState(BuildContext context) {
    scheduleTitleTextControllerValidator =
        _scheduleTitleTextControllerValidator;
    scheduleDescriptionTextControllerValidator =
        _scheduleDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    scheduleTitleFocusNode?.dispose();
    scheduleTitleTextController?.dispose();

    scheduleDescriptionFocusNode?.dispose();
    scheduleDescriptionTextController?.dispose();
  }
}
