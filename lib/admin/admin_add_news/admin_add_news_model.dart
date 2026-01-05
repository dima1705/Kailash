import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
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
import 'admin_add_news_widget.dart' show AdminAddNewsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddNewsModel extends FlutterFlowModel<AdminAddNewsWidget> {
  ///  Local state fields for this page.

  String? preview;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_imgNews = false;
  FFUploadedFile uploadedLocalFile_imgNews =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgNews = '';

  // State field(s) for NewsName widget.
  FocusNode? newsNameFocusNode;
  TextEditingController? newsNameTextController;
  String? Function(BuildContext, String?)? newsNameTextControllerValidator;
  String? _newsNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Название тура is required';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for NewsDescription widget.
  FocusNode? newsDescriptionFocusNode;
  TextEditingController? newsDescriptionTextController;
  String? Function(BuildContext, String?)?
      newsDescriptionTextControllerValidator;
  String? _newsDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Описание тура is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Container widget.
  bool? valid;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  NewsRecord? newsDocument;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    newsNameTextControllerValidator = _newsNameTextControllerValidator;
    newsDescriptionTextControllerValidator =
        _newsDescriptionTextControllerValidator;
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    newsNameFocusNode?.dispose();
    newsNameTextController?.dispose();

    newsDescriptionFocusNode?.dispose();
    newsDescriptionTextController?.dispose();

    loadingModel.dispose();
  }
}
