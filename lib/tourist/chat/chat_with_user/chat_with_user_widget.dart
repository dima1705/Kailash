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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_with_user_model.dart';
export 'chat_with_user_model.dart';

class ChatWithUserWidget extends StatefulWidget {
  const ChatWithUserWidget({
    super.key,
    required this.chatDocument,
  });

  final ChatsRecord? chatDocument;

  static String routeName = 'ChatWithUser';
  static String routePath = '/chatWithUser';

  @override
  State<ChatWithUserWidget> createState() => _ChatWithUserWidgetState();
}

class _ChatWithUserWidgetState extends State<ChatWithUserWidget> {
  late ChatWithUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWithUserModel());

    _model.messageTextController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF303336),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.chevron_left_rounded,
                                  color: Color(0x51FFFFFF),
                                  size: 35.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.chatDocument?.chatName,
                                  'Япония 26Япония 26Япония 26',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 20.0),
                      child: StreamBuilder<List<ToursRecord>>(
                        stream: queryToursRecord(
                          queryBuilder: (toursRecord) => toursRecord.where(
                            'TourChat',
                            isEqualTo: widget!.chatDocument?.reference,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ToursRecord> containerToursRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerToursRecord =
                              containerToursRecordList.isNotEmpty
                                  ? containerToursRecordList.first
                                  : null;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => InkWell(
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
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading_chatImage =
                                                  true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_chatImage =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_chatImage =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_chatImage =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl_chatImage !=
                                                null &&
                                            _model.uploadedFileUrl_chatImage !=
                                                '') {
                                          _model.galleryDoc =
                                              await queryGalleryRecordOnce(
                                            queryBuilder: (galleryRecord) =>
                                                galleryRecord.where(
                                              'gallery_tour',
                                              isEqualTo: widget!
                                                  .chatDocument?.chatTour,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);

                                          var galleryPhotoRecordReference =
                                              GalleryPhotoRecord.collection
                                                  .doc();
                                          await galleryPhotoRecordReference
                                              .set({
                                            ...createGalleryPhotoRecordData(
                                              photo: _model
                                                  .uploadedFileUrl_chatImage,
                                              photoCreator:
                                                  currentUserReference,
                                              photoGallery: containerToursRecord
                                                  ?.tourGallery,
                                              photoApproved: false,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'photo_created_at': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.galleryPhoto =
                                              GalleryPhotoRecord
                                                  .getDocumentFromData({
                                            ...createGalleryPhotoRecordData(
                                              photo: _model
                                                  .uploadedFileUrl_chatImage,
                                              photoCreator:
                                                  currentUserReference,
                                              photoGallery: containerToursRecord
                                                  ?.tourGallery,
                                              photoApproved: false,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'photo_created_at':
                                                    DateTime.now(),
                                              },
                                            ),
                                          }, galleryPhotoRecordReference);

                                          await _model.galleryDoc!.reference
                                              .update({
                                            ...createGalleryRecordData(
                                              galleryHasUnapprovedPhotos: true,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'gallery_photo':
                                                    FieldValue.arrayUnion([
                                                  _model.galleryPhoto?.reference
                                                ]),
                                                'gallery_count_unapproved_photos':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child:
                                                      AddPhotoToGalleryWidget(),
                                                ),
                                              );
                                            },
                                          );

                                          FFAppState().isLoadImg = false;
                                          safeSetState(() {});
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child:
                                                      ErrorUploadPthotoWidget(),
                                                ),
                                              );
                                            },
                                          );

                                          FFAppState().isLoadImg = false;
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xC6D6D6D6),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.add_rounded,
                                                  color: Color(0xC6D6D6D6),
                                                  size: 35.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'фото',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFFFF9F9),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: StreamBuilder<GalleryRecord>(
                                    stream: GalleryRecord.getDocument(
                                        containerToursRecord!.tourGallery!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerGalleryRecord =
                                          snapshot.data!;

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            GalleryPageTourWidget.routeName,
                                            queryParameters: {
                                              'tourDoc': serializeParam(
                                                containerToursRecord,
                                                ParamType.Document,
                                              ),
                                              'galleryTour': serializeParam(
                                                containerGalleryRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'tourDoc': containerToursRecord,
                                              'galleryTour':
                                                  containerGalleryRecord,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/95e63c3b754a303bf412d592239371305a716a7f.png',
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xC6D6D6D6),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'галлерея',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFFFF9F9),
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: ShowUsersWidget(
                                                  users: containerToursRecord
                                                      ?.tourParticipants,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/a8776397b1bee75c2a635bf243092f4e6a18f945.png',
                                                    ).image,
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xC6D6D6D6),
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'путники',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFFFF9F9),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: StreamBuilder<List<TourPlanRecord>>(
                                    stream: queryTourPlanRecord(
                                      queryBuilder: (tourPlanRecord) =>
                                          tourPlanRecord.where(
                                        'Tour',
                                        isEqualTo:
                                            containerToursRecord?.reference,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<TourPlanRecord>
                                          containerTourPlanRecordList =
                                          snapshot.data!;

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            TourMapWidget.routeName,
                                            queryParameters: {
                                              'tourPlansDocuments':
                                                  serializeParam(
                                                containerTourPlanRecordList,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                              'tourDocument': serializeParam(
                                                containerToursRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'tourPlansDocuments':
                                                  containerTourPlanRecordList,
                                              'tourDocument':
                                                  containerToursRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/8c7b09d6bd6a2d6f3ec6471b0682ed956206901c.png',
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xC6D6D6D6),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'карта',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFFFF9F9),
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        TourPlanAllWidget.routeName,
                                        queryParameters: {
                                          'tourDocument': serializeParam(
                                            containerToursRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'tourDocument': containerToursRecord,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/1e4796d1c4c2a3abeb9d3f9552c13838522e0360.png',
                                                  ).image,
                                                ),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color(0xC6D6D6D6),
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'рассписание',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFFF9F9),
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Opacity(
                      opacity: 0.8,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/6d0f8034d90e685a9c1f03f2dcd3e5368feec51d.png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5.0,
                              sigmaY: 5.0,
                            ),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xC6D6D6D6),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 40.0, 15.0, 0.0),
                                      child: StreamBuilder<
                                          List<ChatMessagesRecord>>(
                                        stream: queryChatMessagesRecord(
                                          queryBuilder: (chatMessagesRecord) =>
                                              chatMessagesRecord
                                                  .where(
                                                    'cm_chat',
                                                    isEqualTo: widget!
                                                        .chatDocument
                                                        ?.reference,
                                                  )
                                                  .orderBy('cm_message_sent',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ChatMessagesRecord>
                                              listViewChatMessagesRecordList =
                                              snapshot.data!;

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            reverse: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewChatMessagesRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewChatMessagesRecord =
                                                  listViewChatMessagesRecordList[
                                                      listViewIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (listViewChatMessagesRecord
                                                          .cmUser !=
                                                      currentUserReference)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                listViewChatMessagesRecord
                                                                    .cmUser!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final containerUsersRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: ShowUserAccountWidget(
                                                                                            user: containerUsersRecord.reference,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          containerUsersRecord.photoUrl,
                                                                                          'https://firebasestorage.googleapis.com/v0/b/r-bgrushapro-xqprbj.firebasestorage.app/o/tqqpSHs1F-w.jpg?alt=media&token=727cf4d0-ba2b-43e8-93ee-31f290f1cbd2',
                                                                                        ),
                                                                                      ).image,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: valueOrDefault<Color>(
                                                                                        containerUsersRecord.isGid ? FlutterFlowTheme.of(context).customColor1 : Color(0xAAFFFFFF),
                                                                                        FlutterFlowTheme.of(context).customColor1,
                                                                                      ),
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                if (listViewChatMessagesRecord.cmImage != null && listViewChatMessagesRecord.cmImage != '')
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 5.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: containerUsersRecord.isGid ? FlutterFlowTheme.of(context).customColor1 : Color(0x30FFFFFF),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                'https://picsum.photos/seed/886/600',
                                                                                                width: 200.0,
                                                                                                height: 200.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (listViewChatMessagesRecord.cmMessage != null && listViewChatMessagesRecord.cmMessage != '')
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 0.65,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: containerUsersRecord.isGid ? FlutterFlowTheme.of(context).customColor1 : Color(0x30FFFFFF),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewChatMessagesRecord.cmMessage,
                                                                                              'Hey! How are you?Hey! How are you?Hey! How are you?Hey! How are you?Hey! How are you?',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: containerUsersRecord.isGid ? Color(0xA6FFFFFF) : Color(0xCD14181B),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              55.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat("jm",
                                                                                listViewChatMessagesRecord.cmMessageSent!),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xCD14181B),
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  if (listViewChatMessagesRecord
                                                          .cmUser ==
                                                      currentUserReference)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (listViewChatMessagesRecord
                                                                          .cmImage !=
                                                                      null &&
                                                                  listViewChatMessagesRecord
                                                                          .cmImage !=
                                                                      '')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              10.0,
                                                                              10.0,
                                                                              10.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              listViewChatMessagesRecord.cmImage,
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (listViewChatMessagesRecord.cmMessage !=
                                                                              null &&
                                                                          listViewChatMessagesRecord.cmMessage !=
                                                                              '')
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  listViewChatMessagesRecord.cmMessage,
                                                                                  'Hey! How are you?Hey! How are you?Hey! How are you?Hey! How are you?Hey! How are you?',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xA6FFFFFF),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                              "jm",
                                                                              listViewChatMessagesRecord.cmMessageSent!),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xCD14181B),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 50.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              width: 270.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                border: Border.all(
                                                  color: Color(0x80FFFFFF),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 5.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .messageTextController,
                                                    focusNode:
                                                        _model.messageFocusNode,
                                                    autofocus: false,
                                                    enabled: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText: 'Сообщение',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0x413A4936),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xCD14181B),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.3,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.0,
                                                        ),
                                                    maxLines: 5,
                                                    minLines: 1,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    enableInteractiveSelection:
                                                        true,
                                                    validator: _model
                                                        .messageTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await ChatMessagesRecord
                                                    .collection
                                                    .doc()
                                                    .set({
                                                  ...createChatMessagesRecordData(
                                                    cmUser:
                                                        currentUserReference,
                                                    cmChat: widget!.chatDocument
                                                        ?.reference,
                                                    cmMessage: _model
                                                        .messageTextController
                                                        .text,
                                                    cmImage: _model.image !=
                                                                null &&
                                                            _model.image != ''
                                                        ? _model.image
                                                        : null,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'cm_message_sent':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });

                                                await widget!
                                                    .chatDocument!.reference
                                                    .update({
                                                  ...createChatsRecordData(
                                                    chatLastMessage: _model
                                                                    .image !=
                                                                null &&
                                                            _model.image != ''
                                                        ? 'вложение'
                                                        : _model
                                                            .messageTextController
                                                            .text,
                                                    chatLastMessageSent:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'chat_last_message_time':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                _model.image = null;
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model.messageTextController
                                                      ?.clear();
                                                });
                                              },
                                              child: Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: Image.asset(
                                                      'assets/images/chat_(1).png',
                                                    ).image,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
            if (FFAppState().isLoadImg)
              wrapWithModel(
                model: _model.loadingModel,
                updateCallback: () => safeSetState(() {}),
                child: LoadingWidget(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
