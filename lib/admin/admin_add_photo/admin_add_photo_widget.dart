import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_add_photo_model.dart';
export 'admin_add_photo_model.dart';

class AdminAddPhotoWidget extends StatefulWidget {
  const AdminAddPhotoWidget({
    super.key,
    required this.tour,
    this.gallery,
  });

  final ToursRecord? tour;
  final GalleryRecord? gallery;

  static String routeName = 'AdminAddPhoto';
  static String routePath = '/adminAddPhoto';

  @override
  State<AdminAddPhotoWidget> createState() => _AdminAddPhotoWidgetState();
}

class _AdminAddPhotoWidgetState extends State<AdminAddPhotoWidget> {
  late AdminAddPhotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAddPhotoModel());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF303336),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 60.0, 25.0, 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: Color(0xFFD7D8D8),
                          size: 35.0,
                        ),
                      ),
                      Container(
                        width: 200.0,
                        decoration: BoxDecoration(),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.tour?.tourName,
                            'Япония 26',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 32.0,
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
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final photo = FFAppState().GalleryPhotoTour.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: photo.length,
                          itemBuilder: (context, photoIndex) {
                            final photoItem = photo[photoIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: StreamBuilder<GalleryPhotoRecord>(
                                stream:
                                    GalleryPhotoRecord.getDocument(photoItem),
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

                                  final containerGalleryPhotoRecord =
                                      snapshot.data!;

                                  return Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0x83969696),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  valueOrDefault<String>(
                                                    containerGalleryPhotoRecord
                                                        .photo,
                                                    'https://firebasestorage.googleapis.com/v0/b/r-bgrushapro-xqprbj.firebasestorage.app/o/tqqpSHs1F-w.jpg?alt=media&token=727cf4d0-ba2b-43e8-93ee-31f290f1cbd2',
                                                  ),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x1E606060),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                0.0, 5.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.reject = true;
                                                        _model.confirm = false;
                                                        _model.photoDoc =
                                                            containerGalleryPhotoRecord
                                                                .reference;
                                                        safeSetState(() {});

                                                        await widget!
                                                            .gallery!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'gallery_count_unapproved_photos':
                                                                  FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                              'gallery_photo':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                containerGalleryPhotoRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        FFAppState()
                                                            .removeFromGalleryPhotoTour(
                                                                containerGalleryPhotoRecord
                                                                    .reference);
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: _model
                                                                      .reject &&
                                                                  (_model.photoDoc ==
                                                                      containerGalleryPhotoRecord
                                                                          .reference)
                                                              ? Color(
                                                                  0xFF292929)
                                                              : Color(
                                                                  0x00000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'отклонить',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: _model
                                                                              .reject &&
                                                                          (_model.photoDoc ==
                                                                              containerGalleryPhotoRecord
                                                                                  .reference)
                                                                      ? Color(
                                                                          0xFFFF6600)
                                                                      : Color(
                                                                          0xBDD9D9D9),
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                5.0, 5.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.reject = false;
                                                        _model.confirm = true;
                                                        _model.photoDoc =
                                                            containerGalleryPhotoRecord
                                                                .reference;
                                                        safeSetState(() {});

                                                        await containerGalleryPhotoRecord
                                                            .reference
                                                            .update(
                                                                createGalleryPhotoRecordData(
                                                          photoApproved: true,
                                                        ));

                                                        await widget!
                                                            .gallery!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'gallery_count_unapproved_photos':
                                                                  FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                            },
                                                          ),
                                                        });
                                                        FFAppState()
                                                            .removeFromGalleryPhotoTour(
                                                                containerGalleryPhotoRecord
                                                                    .reference);
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: _model
                                                                      .confirm &&
                                                                  (_model.photoDoc ==
                                                                      containerGalleryPhotoRecord
                                                                          .reference)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .customColor1
                                                              : Color(
                                                                  0x00000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'подтвердить',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: _model
                                                                              .confirm &&
                                                                          (_model.photoDoc ==
                                                                              containerGalleryPhotoRecord
                                                                                  .reference)
                                                                      ? Color(
                                                                          0xAD303336)
                                                                      : Color(
                                                                          0xAEE8EAEC),
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
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
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
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
