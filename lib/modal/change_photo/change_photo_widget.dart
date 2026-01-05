import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_photo_model.dart';
export 'change_photo_model.dart';

class ChangePhotoWidget extends StatefulWidget {
  const ChangePhotoWidget({
    super.key,
    this.photo,
  });

  final String? photo;

  @override
  State<ChangePhotoWidget> createState() => _ChangePhotoWidgetState();
}

class _ChangePhotoWidgetState extends State<ChangePhotoWidget> {
  late ChangePhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePhotoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 50.0, 0.0),
      child: Container(
        width: 150.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).customColor1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().isLoadImg = true;
                      safeSetState(() {});
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        imageQuality: 100,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(
                            () => _model.isDataUploading_photoUser = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                    originalFilename: m.originalFilename,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading_photoUser = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile_photoUser =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl_photoUser =
                                downloadUrls.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          safeSetState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }

                      if (_model.uploadedFileUrl_photoUser != null &&
                          _model.uploadedFileUrl_photoUser != '') {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          photoUrl: _model.uploadedFileUrl_photoUser,
                        ));
                        FFAppState().isLoadImg = false;
                        safeSetState(() {});
                        Navigator.pop(context);
                      } else {
                        FFAppState().isLoadImg = false;
                        safeSetState(() {});
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Изменить фото',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'photo_url': FieldValue.delete(),
                          },
                        ),
                      });
                      await FirebaseStorage.instance
                          .refFromURL(widget!.photo!)
                          .delete();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Удалить',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
