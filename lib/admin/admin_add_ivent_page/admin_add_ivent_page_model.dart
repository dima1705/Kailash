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
import 'admin_add_ivent_page_widget.dart' show AdminAddIventPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddIventPageModel extends FlutterFlowModel<AdminAddIventPageWidget> {
  ///  Local state fields for this page.

  String? preview;

  bool isFree = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_imgIvent = false;
  FFUploadedFile uploadedLocalFile_imgIvent =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgIvent = '';

  // State field(s) for IventName widget.
  FocusNode? iventNameFocusNode;
  TextEditingController? iventNameTextController;
  String? Function(BuildContext, String?)? iventNameTextControllerValidator;
  String? _iventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Название тура is required';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for IventDescription widget.
  FocusNode? iventDescriptionFocusNode;
  TextEditingController? iventDescriptionTextController;
  String? Function(BuildContext, String?)?
      iventDescriptionTextControllerValidator;
  String? _iventDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Описание тура is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for MaxParticipants widget.
  FocusNode? maxParticipantsFocusNode;
  TextEditingController? maxParticipantsTextController;
  String? Function(BuildContext, String?)?
      maxParticipantsTextControllerValidator;
  // State field(s) for IventPrice widget.
  FocusNode? iventPriceFocusNode;
  TextEditingController? iventPriceTextController;
  String? Function(BuildContext, String?)? iventPriceTextControllerValidator;
  String? _iventPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Цена is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Container widget.
  bool? valid;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  IventsRecord? iventDocument;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    iventNameTextControllerValidator = _iventNameTextControllerValidator;
    iventDescriptionTextControllerValidator =
        _iventDescriptionTextControllerValidator;
    iventPriceTextControllerValidator = _iventPriceTextControllerValidator;
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    iventNameFocusNode?.dispose();
    iventNameTextController?.dispose();

    iventDescriptionFocusNode?.dispose();
    iventDescriptionTextController?.dispose();

    maxParticipantsFocusNode?.dispose();
    maxParticipantsTextController?.dispose();

    iventPriceFocusNode?.dispose();
    iventPriceTextController?.dispose();

    loadingModel.dispose();
  }
}
