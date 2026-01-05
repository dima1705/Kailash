import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/modal/error_upload_pthoto/error_upload_pthoto_widget.dart';
import '/modal/loading/loading_widget.dart';
import '/nav_bar/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'gid_profile_page_widget.dart' show GidProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GidProfilePageModel extends FlutterFlowModel<GidProfilePageWidget> {
  ///  Local state fields for this page.

  bool isEdit = false;

  bool editName = false;

  bool editAbout = false;

  bool editInfo = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadProfileImg = false;
  FFUploadedFile uploadedLocalFile_uploadProfileImg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadProfileImg = '';

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for SecondName widget.
  FocusNode? secondNameFocusNode;
  TextEditingController? secondNameTextController;
  String? Function(BuildContext, String?)? secondNameTextControllerValidator;
  // State field(s) for About widget.
  FocusNode? aboutFocusNode;
  TextEditingController? aboutTextController;
  String? Function(BuildContext, String?)? aboutTextControllerValidator;
  // State field(s) for Experience widget.
  FocusNode? experienceFocusNode;
  TextEditingController? experienceTextController;
  String? Function(BuildContext, String?)? experienceTextControllerValidator;
  // State field(s) for Certificates widget.
  FocusNode? certificatesFocusNode;
  TextEditingController? certificatesTextController;
  String? Function(BuildContext, String?)? certificatesTextControllerValidator;
  // State field(s) for Languages widget.
  FocusNode? languagesFocusNode;
  TextEditingController? languagesTextController;
  String? Function(BuildContext, String?)? languagesTextControllerValidator;
  // State field(s) for CountFinishedTours widget.
  FocusNode? countFinishedToursFocusNode;
  TextEditingController? countFinishedToursTextController;
  String? Function(BuildContext, String?)?
      countFinishedToursTextControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    secondNameFocusNode?.dispose();
    secondNameTextController?.dispose();

    aboutFocusNode?.dispose();
    aboutTextController?.dispose();

    experienceFocusNode?.dispose();
    experienceTextController?.dispose();

    certificatesFocusNode?.dispose();
    certificatesTextController?.dispose();

    languagesFocusNode?.dispose();
    languagesTextController?.dispose();

    countFinishedToursFocusNode?.dispose();
    countFinishedToursTextController?.dispose();

    navBarModel.dispose();
    loadingModel.dispose();
  }
}
