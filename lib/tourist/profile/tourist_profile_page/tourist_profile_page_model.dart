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
import '/index.dart';
import 'tourist_profile_page_widget.dart' show TouristProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TouristProfilePageModel
    extends FlutterFlowModel<TouristProfilePageWidget> {
  ///  Local state fields for this page.

  bool showMenu = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadProfileTImg = false;
  FFUploadedFile uploadedLocalFile_uploadProfileTImg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadProfileTImg = '';

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
    navBarModel.dispose();
    loadingModel.dispose();
  }
}
