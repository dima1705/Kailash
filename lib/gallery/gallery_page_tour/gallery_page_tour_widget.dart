import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/photo/photo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gallery_page_tour_model.dart';
export 'gallery_page_tour_model.dart';

class GalleryPageTourWidget extends StatefulWidget {
  const GalleryPageTourWidget({
    super.key,
    this.tourDoc,
    this.galleryTour,
  });

  final ToursRecord? tourDoc;
  final GalleryRecord? galleryTour;

  static String routeName = 'GalleryPageTour';
  static String routePath = '/galleryPageTour';

  @override
  State<GalleryPageTourWidget> createState() => _GalleryPageTourWidgetState();
}

class _GalleryPageTourWidgetState extends State<GalleryPageTourWidget> {
  late GalleryPageTourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GalleryPageTourModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
                    child: InkWell(
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
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: PhotoWidget(
                                  photo: _model.photoImg,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.65,
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: AlignmentDirectional(0.0, 0.0),
                            image: Image.network(
                              _model.photoImg != null && _model.photoImg != ''
                                  ? _model.photoImg!
                                  : widget!.tourDoc!.tourImage,
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 1.0,
                                sigmaY: 1.0,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 30.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          '${widget!.tourDoc?.tourPlan?.length?.toString()} дней / ${widget!.tourDoc?.tourDistance} км',
                                          '10 дней / 1 500 км',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFFF9F9),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget!.tourDoc?.tourName,
                                            'NepalNepalNepalNepal',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFFFF9F9),
                                                fontSize: 35.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: StreamBuilder<List<GalleryPhotoRecord>>(
                      stream: queryGalleryPhotoRecord(
                        queryBuilder: (galleryPhotoRecord) => galleryPhotoRecord
                            .where(
                              'photo_gallery',
                              isEqualTo: widget!.galleryTour?.reference,
                            )
                            .where(
                              'photo_approved',
                              isEqualTo: true,
                            )
                            .orderBy('photo_created_at', descending: true),
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
                        List<GalleryPhotoRecord>
                            staggeredViewGalleryPhotoRecordList =
                            snapshot.data!;
                        if (staggeredViewGalleryPhotoRecordList.isEmpty) {
                          return EmptyListWidget(
                            text: 'Галлерея пока пуста...',
                          );
                        }

                        return MasonryGridView.builder(
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          crossAxisSpacing: 6.0,
                          itemCount: staggeredViewGalleryPhotoRecordList.length,
                          itemBuilder: (context, staggeredViewIndex) {
                            final staggeredViewGalleryPhotoRecord =
                                staggeredViewGalleryPhotoRecordList[
                                    staggeredViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 3.0, 10.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.photoImg =
                                      staggeredViewGalleryPhotoRecord.photo;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        staggeredViewGalleryPhotoRecord.photo,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            GalleryPageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: Container(
                          width: 150.0,
                          height: 43.0,
                          decoration: BoxDecoration(
                            color: Color(0xA1606060),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Путешествия',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xE1D9D9D9),
                                    fontSize: 12.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 150.0,
                        height: 43.0,
                        decoration: BoxDecoration(
                          color: Color(0xA0FFF9F9),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Все фото',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xAA000000),
                                  fontSize: 12.0,
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
                    if (valueOrDefault<bool>(
                            currentUserDocument?.isGid, false) &&
                        (widget!.galleryTour!.galleryCountUnapprovedPhotos > 0))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              for (int loop1Index = 0;
                                  loop1Index <
                                      widget!.galleryTour!.galleryPhoto
                                          .map((e) => e)
                                          .toList()
                                          .length;
                                  loop1Index++) {
                                final currentLoop1Item = widget!
                                    .galleryTour!.galleryPhoto
                                    .map((e) => e)
                                    .toList()[loop1Index];
                                _model.photoDoc =
                                    await GalleryPhotoRecord.getDocumentOnce(
                                        currentLoop1Item);
                                if (!_model.photoDoc!.photoApproved) {
                                  FFAppState()
                                      .addToGalleryPhotoTour(currentLoop1Item);
                                  safeSetState(() {});
                                }
                              }

                              context.pushNamed(
                                AdminAddPhotoWidget.routeName,
                                queryParameters: {
                                  'tour': serializeParam(
                                    widget!.tourDoc,
                                    ParamType.Document,
                                  ),
                                  'gallery': serializeParam(
                                    widget!.galleryTour,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'tour': widget!.tourDoc,
                                  'gallery': widget!.galleryTour,
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );

                              safeSetState(() {});
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/guard.png',
                                  ).image,
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
      ),
    );
  }
}
