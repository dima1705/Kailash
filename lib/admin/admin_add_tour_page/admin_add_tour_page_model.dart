import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/hard_rating/hard_rating_widget.dart';
import '/components/show_gids/show_gids_widget.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/modal/error_add_form/error_add_form_widget.dart';
import '/modal/loading/loading_widget.dart';
import 'dart:io';
import 'dart:ui';
import '/index.dart';
import 'admin_add_tour_page_widget.dart' show AdminAddTourPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddTourPageModel extends FlutterFlowModel<AdminAddTourPageWidget> {
  ///  Local state fields for this page.

  String? preview;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_tourImage = false;
  FFUploadedFile uploadedLocalFile_tourImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_tourImage = '';

  // State field(s) for TourName widget.
  FocusNode? tourNameFocusNode;
  TextEditingController? tourNameTextController;
  String? Function(BuildContext, String?)? tourNameTextControllerValidator;
  String? _tourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Название тура is required';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TourDescription widget.
  FocusNode? tourDescriptionFocusNode;
  TextEditingController? tourDescriptionTextController;
  String? Function(BuildContext, String?)?
      tourDescriptionTextControllerValidator;
  String? _tourDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Описание тура is required';
    }

    return null;
  }

  // State field(s) for TourWeather widget.
  FocusNode? tourWeatherFocusNode;
  TextEditingController? tourWeatherTextController;
  String? Function(BuildContext, String?)? tourWeatherTextControllerValidator;
  String? _tourWeatherTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'в °C is required';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TourDistance widget.
  FocusNode? tourDistanceFocusNode;
  TextEditingController? tourDistanceTextController;
  String? Function(BuildContext, String?)? tourDistanceTextControllerValidator;
  String? _tourDistanceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'в км is required';
    }

    return null;
  }

  // Model for HardRating component.
  late HardRatingModel hardRatingModel;
  // State field(s) for MaxParticipants widget.
  FocusNode? maxParticipantsFocusNode;
  TextEditingController? maxParticipantsTextController;
  String? Function(BuildContext, String?)?
      maxParticipantsTextControllerValidator;
  // State field(s) for TourPrice widget.
  FocusNode? tourPriceFocusNode;
  TextEditingController? tourPriceTextController;
  String? Function(BuildContext, String?)? tourPriceTextControllerValidator;
  String? _tourPriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Цена is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Container widget.
  bool? valid;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ToursRecord? tourDocument;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    tourNameTextControllerValidator = _tourNameTextControllerValidator;
    tourDescriptionTextControllerValidator =
        _tourDescriptionTextControllerValidator;
    tourWeatherTextControllerValidator = _tourWeatherTextControllerValidator;
    tourDistanceTextControllerValidator = _tourDistanceTextControllerValidator;
    hardRatingModel = createModel(context, () => HardRatingModel());
    tourPriceTextControllerValidator = _tourPriceTextControllerValidator;
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    tourNameFocusNode?.dispose();
    tourNameTextController?.dispose();

    tourDescriptionFocusNode?.dispose();
    tourDescriptionTextController?.dispose();

    tourWeatherFocusNode?.dispose();
    tourWeatherTextController?.dispose();

    tourDistanceFocusNode?.dispose();
    tourDistanceTextController?.dispose();

    hardRatingModel.dispose();
    maxParticipantsFocusNode?.dispose();
    maxParticipantsTextController?.dispose();

    tourPriceFocusNode?.dispose();
    tourPriceTextController?.dispose();

    loadingModel.dispose();
  }
}
