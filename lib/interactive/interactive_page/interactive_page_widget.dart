import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/empty_interactive/empty_interactive_widget.dart';
import '/nav_bar/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'interactive_page_model.dart';
export 'interactive_page_model.dart';

class InteractivePageWidget extends StatefulWidget {
  const InteractivePageWidget({
    super.key,
    bool? showVebinars,
    bool? showIvents,
    bool? showTours,
  })  : this.showVebinars = showVebinars ?? false,
        this.showIvents = showIvents ?? false,
        this.showTours = showTours ?? false;

  final bool showVebinars;
  final bool showIvents;
  final bool showTours;

  static String routeName = 'InteractivePage';
  static String routePath = '/interactivePage';

  @override
  State<InteractivePageWidget> createState() => _InteractivePageWidgetState();
}

class _InteractivePageWidgetState extends State<InteractivePageWidget> {
  late InteractivePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteractivePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.showVebinars) {
        _model.showVebinars = true;
        _model.showIvents = false;
        _model.showTours = false;
        safeSetState(() {});
      } else if (widget!.showIvents) {
        _model.showVebinars = false;
        _model.showIvents = true;
        _model.showTours = false;
        safeSetState(() {});
      } else {
        _model.showVebinars = false;
        _model.showIvents = false;
        _model.showTours = true;
        safeSetState(() {});
      }
    });

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
        body: Stack(
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF323538),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/b8obz_.png',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xF1323538),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 50.0, 20.0, 100.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      children: [
                                        Container(
                                          width: 82.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x2B606060),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
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
                                                    _model.showVebinars = true;
                                                    _model.showIvents = false;
                                                    _model.showTours = false;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: _model.showVebinars
                                                          ? Color(0xFFE8640C)
                                                          : Color(0x00000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Вебинары',
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
                                                              color: Color(
                                                                  0x95E3DEDB),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: Color(0x33E3DEDB),
                                                ),
                                              ),
                                              Expanded(
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
                                                    _model.showVebinars = false;
                                                    _model.showIvents = true;
                                                    _model.showTours = false;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: _model.showIvents
                                                          ? Color(0xFFE8640C)
                                                          : Color(0x00000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Ивенты',
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
                                                              color: Color(
                                                                  0x95E3DEDB),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: Color(0x33E3DEDB),
                                                ),
                                              ),
                                              Expanded(
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
                                                    _model.showVebinars = false;
                                                    _model.showIvents = false;
                                                    _model.showTours = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: _model.showTours
                                                          ? Color(0xFFE8640C)
                                                          : Color(0x00000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Путешествия',
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
                                                              color: Color(
                                                                  0x95E3DEDB),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (_model.showVebinars) {
                                  return Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          VebinarsRecord>(
                                        pagingController:
                                            _model.setListViewController1(
                                          VebinarsRecord.collection.orderBy(
                                              'vebinar_created_at',
                                              descending: true),
                                        ),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                VebinarsRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Center(
                                            child: EmptyInteractiveWidget(),
                                          ),
                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewVebinarsRecord =
                                                _model
                                                    .listViewPagingController1!
                                                    .itemList![listViewIndex];
                                            return Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 0.0, 20.0,
                                                          30.0),
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
                                                      context.pushNamed(
                                                        VebinarPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'vebinarDocument':
                                                              serializeParam(
                                                            listViewVebinarsRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'vebinarDocument':
                                                              listViewVebinarsRecord,
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 10.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              listViewVebinarsRecord
                                                                  .vebinarImage,
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 0.3,
                                                        sigmaY: 0.3,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    3.0,
                                                                    3.0,
                                                                    3.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 0.6,
                                                              sigmaY: 0.6,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          3.0,
                                                                          3.0,
                                                                          3.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10.0),
                                                                ),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter:
                                                                      ImageFilter
                                                                          .blur(
                                                                    sigmaX: 0.8,
                                                                    sigmaY: 0.8,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            3.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(20.0),
                                                                        bottomRight:
                                                                            Radius.circular(20.0),
                                                                        topLeft:
                                                                            Radius.circular(10.0),
                                                                        topRight:
                                                                            Radius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          BackdropFilter(
                                                                        filter:
                                                                            ImageFilter.blur(
                                                                          sigmaX:
                                                                              1.0,
                                                                          sigmaY:
                                                                              1.0,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(3.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(20.0),
                                                                              topLeft: Radius.circular(10.0),
                                                                              topRight: Radius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                BackdropFilter(
                                                                              filter: ImageFilter.blur(
                                                                                sigmaX: 1.2,
                                                                                sigmaY: 1.2,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(3.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(20.0),
                                                                                    bottomRight: Radius.circular(20.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                  child: BackdropFilter(
                                                                                    filter: ImageFilter.blur(
                                                                                      sigmaX: 1.5,
                                                                                      sigmaY: 1.5,
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 30.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewVebinarsRecord.vebinarTitle,
                                                                                                'Гав',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFFFFF9F9),
                                                                                                    fontSize: 32.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                            ),
                                                                                            if (listViewVebinarsRecord.vebinarParticipants.isNotEmpty)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Stack(
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 31.0,
                                                                                                            height: 31.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/93e1dbafa5c363a041901f88ecda320f8cf6c795.png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              shape: BoxShape.circle,
                                                                                                              border: Border.all(
                                                                                                                color: Color(0xD6D6D6C7),
                                                                                                                width: 3.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 31.0,
                                                                                                              height: 31.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                image: DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: Image.asset(
                                                                                                                    'assets/images/4a98f5d40dc6a4840e98b24d97c70e792bdbf1d0.png',
                                                                                                                  ).image,
                                                                                                                ),
                                                                                                                shape: BoxShape.circle,
                                                                                                                border: Border.all(
                                                                                                                  color: Color(0xD6D6D6C7),
                                                                                                                  width: 3.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 31.0,
                                                                                                              height: 31.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                image: DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: Image.asset(
                                                                                                                    'assets/images/796b773e17297902e2473b629d596fffafde7147.png',
                                                                                                                  ).image,
                                                                                                                ),
                                                                                                                shape: BoxShape.circle,
                                                                                                                border: Border.all(
                                                                                                                  color: Color(0xD6D6D6C7),
                                                                                                                  width: 3.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Осталось ${(listViewVebinarsRecord.vebinarMaxParticipants - listViewVebinarsRecord.vebinarParticipants.length).toString()} мест на вебинар',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFFFFF9F9),
                                                                                                            fontSize: 13.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
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
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (_model.showIvents) {
                                  return Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          IventsRecord>(
                                        pagingController:
                                            _model.setListViewController2(
                                          IventsRecord.collection.orderBy(
                                              'ivent_created_at',
                                              descending: true),
                                        ),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                IventsRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Center(
                                            child: EmptyInteractiveWidget(),
                                          ),
                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewIventsRecord = _model
                                                .listViewPagingController2!
                                                .itemList![listViewIndex];
                                            return Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 0.0, 20.0,
                                                          30.0),
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
                                                      context.pushNamed(
                                                        IventPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'iventDocument':
                                                              serializeParam(
                                                            listViewIventsRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'iventDocument':
                                                              listViewIventsRecord,
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 10.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewIventsRecord
                                                                    .iventImage,
                                                                'https://firebasestorage.googleapis.com/v0/b/kailash-e332jc.firebasestorage.app/o/users%2FGuMGhxOlseYezNEp2I8a2KwD0Jo1%2Fuploads%2F1765193706700000.png?alt=media&token=f20f48ff-e918-473d-9b3f-5344f122f1ac',
                                                              ),
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 0.3,
                                                        sigmaY: 0.3,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    3.0,
                                                                    3.0,
                                                                    3.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 0.6,
                                                              sigmaY: 0.6,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          3.0,
                                                                          3.0,
                                                                          3.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10.0),
                                                                ),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter:
                                                                      ImageFilter
                                                                          .blur(
                                                                    sigmaX: 0.8,
                                                                    sigmaY: 0.8,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            3.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(20.0),
                                                                        bottomRight:
                                                                            Radius.circular(20.0),
                                                                        topLeft:
                                                                            Radius.circular(10.0),
                                                                        topRight:
                                                                            Radius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          BackdropFilter(
                                                                        filter:
                                                                            ImageFilter.blur(
                                                                          sigmaX:
                                                                              1.0,
                                                                          sigmaY:
                                                                              1.0,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(3.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(20.0),
                                                                              topLeft: Radius.circular(10.0),
                                                                              topRight: Radius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                BackdropFilter(
                                                                              filter: ImageFilter.blur(
                                                                                sigmaX: 1.2,
                                                                                sigmaY: 1.2,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(3.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(20.0),
                                                                                    bottomRight: Radius.circular(20.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                  child: BackdropFilter(
                                                                                    filter: ImageFilter.blur(
                                                                                      sigmaX: 1.5,
                                                                                      sigmaY: 1.5,
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 30.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewIventsRecord.iventTitle,
                                                                                                'Гав',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFFFFF9F9),
                                                                                                    fontSize: 32.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 31.0,
                                                                                                          height: 31.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/93e1dbafa5c363a041901f88ecda320f8cf6c795.png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: Color(0xD6D6D6C7),
                                                                                                              width: 3.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 31.0,
                                                                                                            height: 31.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/4a98f5d40dc6a4840e98b24d97c70e792bdbf1d0.png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              shape: BoxShape.circle,
                                                                                                              border: Border.all(
                                                                                                                color: Color(0xD6D6D6C7),
                                                                                                                width: 3.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 31.0,
                                                                                                            height: 31.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/796b773e17297902e2473b629d596fffafde7147.png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              shape: BoxShape.circle,
                                                                                                              border: Border.all(
                                                                                                                color: Color(0xD6D6D6C7),
                                                                                                                width: 3.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Осталось ${(listViewIventsRecord.iventParticipants.length - listViewIventsRecord.iventMaxParticipants).toString()} мест в ивенте',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFFFFF9F9),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
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
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        ToursRecord>(
                                      pagingController:
                                          _model.setListViewController3(
                                        ToursRecord.collection,
                                      ),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              ToursRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
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
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
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
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewToursRecord = _model
                                              .listViewPagingController3!
                                              .itemList![listViewIndex];
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 30.0),
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
                                                    if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isTourist,
                                                        false)) {
                                                      if ((currentUserDocument
                                                                  ?.tours
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(
                                                              listViewToursRecord
                                                                  .reference)) {
                                                        context.pushNamed(
                                                          TourPageActiveWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'tourDocument':
                                                                serializeParam(
                                                              listViewToursRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'tourDocument':
                                                                listViewToursRecord,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          TourPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'tourDocument':
                                                                serializeParam(
                                                              listViewToursRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'tourDocument':
                                                                listViewToursRecord,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isGid,
                                                          false)) {
                                                        if (listViewToursRecord
                                                                .tourGid ==
                                                            currentUserReference) {
                                                          context.pushNamed(
                                                            TourPageActiveWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tourDocument':
                                                                  serializeParam(
                                                                listViewToursRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'tourDocument':
                                                                  listViewToursRecord,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                              ),
                                                            },
                                                          );
                                                        } else {
                                                          context.pushNamed(
                                                            TourPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tourDocument':
                                                                  serializeParam(
                                                                listViewToursRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'tourDocument':
                                                                  listViewToursRecord,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                              ),
                                                            },
                                                          );
                                                        }
                                                      } else {
                                                        context.pushNamed(
                                                          TourPageActiveWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'tourDocument':
                                                                serializeParam(
                                                              listViewToursRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'tourDocument':
                                                                listViewToursRecord,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    }
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 20.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.45,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewToursRecord
                                                                  .tourImage,
                                                              'https://firebasestorage.googleapis.com/v0/b/kailash-e332jc.firebasestorage.app/o/users%2FGuMGhxOlseYezNEp2I8a2KwD0Jo1%2Fuploads%2F1765547312297000.jpg?alt=media&token=e19c9583-60c2-4cb8-bf9c-38b29e947510',
                                                            ),
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 10.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        0.0,
                                                                        30.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${listViewToursRecord.tourPlan.length.toString()} дней / ${listViewToursRecord.tourDistance} км',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFFFFF9F9),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20.0),
                                                    bottomRight:
                                                        Radius.circular(20.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 0.3,
                                                      sigmaY: 0.3,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  3.0,
                                                                  3.0,
                                                                  3.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                        child: BackdropFilter(
                                                          filter:
                                                              ImageFilter.blur(
                                                            sigmaX: 0.6,
                                                            sigmaY: 0.6,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3.0,
                                                                        3.0,
                                                                        3.0,
                                                                        3.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                              ),
                                                              child:
                                                                  BackdropFilter(
                                                                filter:
                                                                    ImageFilter
                                                                        .blur(
                                                                  sigmaX: 0.8,
                                                                  sigmaY: 0.8,
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              20.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        BackdropFilter(
                                                                      filter: ImageFilter
                                                                          .blur(
                                                                        sigmaX:
                                                                            1.0,
                                                                        sigmaY:
                                                                            1.0,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(3.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(20.0),
                                                                            bottomRight:
                                                                                Radius.circular(20.0),
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              BackdropFilter(
                                                                            filter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 1.2,
                                                                              sigmaY: 1.2,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(3.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(20.0),
                                                                                  bottomRight: Radius.circular(20.0),
                                                                                  topLeft: Radius.circular(10.0),
                                                                                  topRight: Radius.circular(10.0),
                                                                                ),
                                                                                child: BackdropFilter(
                                                                                  filter: ImageFilter.blur(
                                                                                    sigmaX: 1.5,
                                                                                    sigmaY: 1.5,
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 30.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewToursRecord.tourName,
                                                                                              'Каилас 2025Каилас 2025Каилас 2025',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFFFFF9F9),
                                                                                                  fontSize: 32.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            overflow: TextOverflow.ellipsis,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 31.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          image: DecorationImage(
                                                                                                            fit: BoxFit.cover,
                                                                                                            image: Image.asset(
                                                                                                              'assets/images/93e1dbafa5c363a041901f88ecda320f8cf6c795.png',
                                                                                                            ).image,
                                                                                                          ),
                                                                                                          shape: BoxShape.circle,
                                                                                                          border: Border.all(
                                                                                                            color: Color(0xD6D6D6C7),
                                                                                                            width: 3.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: 31.0,
                                                                                                          height: 31.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/4a98f5d40dc6a4840e98b24d97c70e792bdbf1d0.png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: Color(0xD6D6D6C7),
                                                                                                              width: 3.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: 31.0,
                                                                                                          height: 31.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            image: DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: Image.asset(
                                                                                                                'assets/images/796b773e17297902e2473b629d596fffafde7147.png',
                                                                                                              ).image,
                                                                                                            ),
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: Color(0xD6D6D6C7),
                                                                                                              width: 3.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'Осталось ${(listViewToursRecord.tourMaxParticipants - listViewToursRecord.tourParticipants.length).toString()} мест в группе',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFFFFF9F9),
                                                                                                        fontSize: 13.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
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
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => safeSetState(() {}),
                child: NavBarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
