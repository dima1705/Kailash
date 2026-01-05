import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/modal/error_add_form/error_add_form_widget.dart';
import '/modal/loading/loading_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'admin_add_vebinar_page_widget.dart' show AdminAddVebinarPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddVebinarPageModel
    extends FlutterFlowModel<AdminAddVebinarPageWidget> {
  ///  Local state fields for this page.

  bool isFree = false;

  String? preview;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_imgVebinarUPD = false;
  FFUploadedFile uploadedLocalFile_imgVebinarUPD =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgVebinarUPD = '';

  // State field(s) for VebinarName widget.
  FocusNode? vebinarNameFocusNode;
  TextEditingController? vebinarNameTextController;
  String? Function(BuildContext, String?)? vebinarNameTextControllerValidator;
  String? _vebinarNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Название тура is required';
    }

    return null;
  }

  // State field(s) for VebinarDescription widget.
  FocusNode? vebinarDescriptionFocusNode;
  TextEditingController? vebinarDescriptionTextController;
  String? Function(BuildContext, String?)?
      vebinarDescriptionTextControllerValidator;
  String? _vebinarDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Описание тура is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for url widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlTextController;
  String? Function(BuildContext, String?)? urlTextControllerValidator;
  String? _urlTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ссылка на вебинар is required';
    }

    return null;
  }

  // State field(s) for MaxParticipants widget.
  FocusNode? maxParticipantsFocusNode;
  TextEditingController? maxParticipantsTextController;
  String? Function(BuildContext, String?)?
      maxParticipantsTextControllerValidator;
  // State field(s) for VebinarPrice widget.
  FocusNode? vebinarPriceFocusNode;
  TextEditingController? vebinarPriceTextController;
  String? Function(BuildContext, String?)? vebinarPriceTextControllerValidator;
  String? _vebinarPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Цена is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Container widget.
  bool? valid;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  VebinarsRecord? vebinarDocument;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    vebinarNameTextControllerValidator = _vebinarNameTextControllerValidator;
    vebinarDescriptionTextControllerValidator =
        _vebinarDescriptionTextControllerValidator;
    urlTextControllerValidator = _urlTextControllerValidator;
    vebinarPriceTextControllerValidator = _vebinarPriceTextControllerValidator;
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    vebinarNameFocusNode?.dispose();
    vebinarNameTextController?.dispose();

    vebinarDescriptionFocusNode?.dispose();
    vebinarDescriptionTextController?.dispose();

    urlFocusNode?.dispose();
    urlTextController?.dispose();

    maxParticipantsFocusNode?.dispose();
    maxParticipantsTextController?.dispose();

    vebinarPriceFocusNode?.dispose();
    vebinarPriceTextController?.dispose();

    loadingModel.dispose();
  }
}
