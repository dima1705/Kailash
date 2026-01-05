import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/show_users/show_users_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/modal/add_photo_to_gallery/add_photo_to_gallery_widget.dart';
import '/modal/error_upload_pthoto/error_upload_pthoto_widget.dart';
import '/modal/loading/loading_widget.dart';
import '/modal/show_user_account/show_user_account_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'chat_with_user_widget.dart' show ChatWithUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatWithUserModel extends FlutterFlowModel<ChatWithUserWidget> {
  ///  Local state fields for this page.

  String? image;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_chatImage = false;
  FFUploadedFile uploadedLocalFile_chatImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_chatImage = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  GalleryRecord? galleryDoc;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  GalleryPhotoRecord? galleryPhoto;
  // State field(s) for Message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    messageFocusNode?.dispose();
    messageTextController?.dispose();

    loadingModel.dispose();
  }
}
