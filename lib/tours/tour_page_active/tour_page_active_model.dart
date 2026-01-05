import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/hard_rating/hard_rating_widget.dart';
import '/components/show_users/show_users_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/modal/show_user_account/show_user_account_widget.dart';
import '/nav_bar/nav_bar/nav_bar_widget.dart';
import 'dart:io';
import 'dart:ui';
import '/index.dart';
import 'tour_page_active_widget.dart' show TourPageActiveWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TourPageActiveModel extends FlutterFlowModel<TourPageActiveWidget> {
  ///  Local state fields for this page.

  bool isEdit = false;

  bool editTitle = false;

  bool editDesc = false;

  bool editInfo = false;

  bool editPrice = false;

  String? preview;

  String? newTitle;

  String? newDesc;

  String? newWeather;

  DateTime? newStart;

  DateTime? newFinish;

  String? newDistance;

  double? newPrice;

  LatLng? newLocation;

  String? newLocationName;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadPreview = false;
  FFUploadedFile uploadedLocalFile_uploadPreview =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPreview = '';

  // State field(s) for TourName widget.
  FocusNode? tourNameFocusNode;
  TextEditingController? tourNameTextController;
  String? Function(BuildContext, String?)? tourNameTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TourDescription widget.
  FocusNode? tourDescriptionFocusNode;
  TextEditingController? tourDescriptionTextController;
  String? Function(BuildContext, String?)?
      tourDescriptionTextControllerValidator;
  // Model for HardRating component.
  late HardRatingModel hardRatingModel1;
  // State field(s) for TourWeather widget.
  FocusNode? tourWeatherFocusNode;
  TextEditingController? tourWeatherTextController;
  String? Function(BuildContext, String?)? tourWeatherTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TourDistance widget.
  FocusNode? tourDistanceFocusNode;
  TextEditingController? tourDistanceTextController;
  String? Function(BuildContext, String?)? tourDistanceTextControllerValidator;
  // Model for HardRating component.
  late HardRatingModel hardRatingModel2;
  // State field(s) for TourPrice widget.
  FocusNode? tourPriceFocusNode;
  TextEditingController? tourPriceTextController;
  String? Function(BuildContext, String?)? tourPriceTextControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    hardRatingModel1 = createModel(context, () => HardRatingModel());
    hardRatingModel2 = createModel(context, () => HardRatingModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tourNameFocusNode?.dispose();
    tourNameTextController?.dispose();

    tourDescriptionFocusNode?.dispose();
    tourDescriptionTextController?.dispose();

    hardRatingModel1.dispose();
    tourWeatherFocusNode?.dispose();
    tourWeatherTextController?.dispose();

    tourDistanceFocusNode?.dispose();
    tourDistanceTextController?.dispose();

    hardRatingModel2.dispose();
    tourPriceFocusNode?.dispose();
    tourPriceTextController?.dispose();

    navBarModel.dispose();
  }
}
