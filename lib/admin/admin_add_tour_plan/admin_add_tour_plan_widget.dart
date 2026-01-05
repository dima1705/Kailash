import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_add_tour_plan_model.dart';
export 'admin_add_tour_plan_model.dart';

class AdminAddTourPlanWidget extends StatefulWidget {
  const AdminAddTourPlanWidget({
    super.key,
    required this.tourDocument,
  });

  final ToursRecord? tourDocument;

  static String routeName = 'AdminAddTourPlan';
  static String routePath = '/adminAddTourPlan';

  @override
  State<AdminAddTourPlanWidget> createState() => _AdminAddTourPlanWidgetState();
}

class _AdminAddTourPlanWidgetState extends State<AdminAddTourPlanWidget> {
  late AdminAddTourPlanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAddTourPlanModel());

    _model.scheduleTitleTextController ??= TextEditingController();
    _model.scheduleTitleFocusNode ??= FocusNode();

    _model.scheduleDescriptionTextController ??= TextEditingController();
    _model.scheduleDescriptionFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF303336),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 60.0, 15.0, 100.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'План тура',
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
                                          color: Color(0xFFE3DEDB),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var tourPlanRecordReference =
                                          TourPlanRecord.collection.doc();
                                      await tourPlanRecordReference.set({
                                        ...createTourPlanRecordData(
                                          tour: widget!.tourDocument?.reference,
                                          day: _model.dayNum,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_at':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.tourDay =
                                          TourPlanRecord.getDocumentFromData({
                                        ...createTourPlanRecordData(
                                          tour: widget!.tourDocument?.reference,
                                          day: _model.dayNum,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_at': DateTime.now(),
                                          },
                                        ),
                                      }, tourPlanRecordReference);

                                      await widget!.tourDocument!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'TourPlan': FieldValue.arrayUnion(
                                                [_model.tourDay?.reference]),
                                          },
                                        ),
                                      });
                                      _model.dayNum = _model.dayNum! + 1;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 110.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 50.0,
                                            borderWidth: 2.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color: Color(0xFFE8640C),
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Text(
                                            'день',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFE3DEDB),
                                                  fontSize: 15.0,
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
                                ],
                              ),
                              if (_model.addTimeSchedule)
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final _datePickedTime =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.fromDateTime(
                                                            getCurrentTimestamp),
                                                    builder: (context, child) {
                                                      return wrapInMaterialTimePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            Color(0xFFE8640C),
                                                        headerForegroundColor:
                                                            Color(0x13FFFFFF),
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            Color(0xFFE8640C),
                                                        selectedDateTimeForegroundColor:
                                                            Color(0xFF303336),
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );
                                                  if (_datePickedTime != null) {
                                                    safeSetState(() {
                                                      _model.datePicked =
                                                          DateTime(
                                                        getCurrentTimestamp
                                                            .year,
                                                        getCurrentTimestamp
                                                            .month,
                                                        getCurrentTimestamp.day,
                                                        _datePickedTime.hour,
                                                        _datePickedTime.minute,
                                                      );
                                                    });
                                                  } else if (_model
                                                          .datePicked !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked =
                                                          getCurrentTimestamp;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x13FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat("Hm",
                                                            _model.datePicked),
                                                        'время',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0x76FFFFFF),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x13FFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        8.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .scheduleTitleTextController,
                                                                focusNode: _model
                                                                    .scheduleTitleFocusNode,
                                                                autofocus:
                                                                    false,
                                                                enabled: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  hintText:
                                                                      'Заголовок',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0x76FFFFFF),
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xBDFFFFFF),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.3,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                                maxLines: null,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                enableInteractiveSelection:
                                                                    true,
                                                                validator: _model
                                                                    .scheduleTitleTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
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
                                                                    10.0),
                                                        child:
                                                            FlutterFlowPlacePicker(
                                                          iOSGoogleMapsApiKey:
                                                              'AIzaSyDdC6t9Bx9tekYWubgsLYmFKaS1H4Z1icU',
                                                          androidGoogleMapsApiKey:
                                                              'AIzaSyDZ0bmWY0ybbhlLxdf8fLJLWrk3tYxR2Xk',
                                                          webGoogleMapsApiKey:
                                                              'AIzaSyDSKMWlkCIYip8bOyiPzd1w8HICXD7UGss',
                                                          onSelect:
                                                              (place) async {
                                                            safeSetState(() =>
                                                                _model.placePickerValue =
                                                                    place);
                                                          },
                                                          defaultText:
                                                              'Локация',
                                                          icon: Icon(
                                                            Icons.place,
                                                            color: Color(
                                                                0xCAFFFFFF),
                                                            size: 16.0,
                                                          ),
                                                          buttonOptions:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 40.0,
                                                            color: Color(
                                                                0x13FFFFFF),
                                                            textAlign:
                                                                TextAlign.start,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0x76FFFFFF),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x13FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      8.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .scheduleDescriptionTextController,
                                                              focusNode: _model
                                                                  .scheduleDescriptionFocusNode,
                                                              autofocus: false,
                                                              enabled: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                hintText:
                                                                    'Заголовок',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0x76FFFFFF),
                                                                      fontSize:
                                                                          15.0,
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
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xBDFFFFFF),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.3,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                              maxLines: null,
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              enableInteractiveSelection:
                                                                  true,
                                                              validator: _model
                                                                  .scheduleDescriptionTextControllerValidator
                                                                  .asValidator(
                                                                      context),
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
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.valid2 = true;
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                safeSetState(() =>
                                                    _model.valid2 = false);
                                                return;
                                              }
                                              if (_model.datePicked == null) {
                                                _model.valid2 = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              if (_model.placePickerValue ==
                                                  FFPlace()) {
                                                _model.valid2 = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              if (_model.valid2!) {
                                                var tourDayScheduleRecordReference =
                                                    TourDayScheduleRecord
                                                        .collection
                                                        .doc();
                                                await tourDayScheduleRecordReference
                                                    .set(
                                                        createTourDayScheduleRecordData(
                                                  timeDay: _model.datePicked,
                                                  timeTitle: _model
                                                      .scheduleTitleTextController
                                                      .text,
                                                  timeLocation: _model
                                                      .placePickerValue.name,
                                                  timePlan: _model
                                                      .scheduleDescriptionTextController
                                                      .text,
                                                  tourPlan: _model.day,
                                                ));
                                                _model.daySchedule =
                                                    TourDayScheduleRecord
                                                        .getDocumentFromData(
                                                            createTourDayScheduleRecordData(
                                                              timeDay: _model
                                                                  .datePicked,
                                                              timeTitle: _model
                                                                  .scheduleTitleTextController
                                                                  .text,
                                                              timeLocation: _model
                                                                  .placePickerValue
                                                                  .name,
                                                              timePlan: _model
                                                                  .scheduleDescriptionTextController
                                                                  .text,
                                                              tourPlan:
                                                                  _model.day,
                                                            ),
                                                            tourDayScheduleRecordReference);
                                                if (_model.tourDay?.location ==
                                                    null) {
                                                  await _model.day!.update(
                                                      createTourPlanRecordData(
                                                    tourSchedule: _model
                                                        .daySchedule?.reference,
                                                    tour: widget!.tourDocument
                                                        ?.reference,
                                                    location: _model
                                                        .placePickerValue
                                                        .latLng,
                                                  ));
                                                } else {
                                                  await _model.day!.update(
                                                      createTourPlanRecordData(
                                                    tourSchedule: _model
                                                        .daySchedule?.reference,
                                                    tour: widget!.tourDocument
                                                        ?.reference,
                                                  ));
                                                }

                                                _model.addTimeSchedule =
                                                    !_model.addTimeSchedule;
                                                _model.day = null;
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model
                                                      .scheduleTitleTextController
                                                      ?.clear();
                                                  _model
                                                      .scheduleDescriptionTextController
                                                      ?.clear();
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE8640C),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Добавить событие',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 15.0,
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<List<TourPlanRecord>>(
                                      stream: queryTourPlanRecord(
                                        queryBuilder: (tourPlanRecord) =>
                                            tourPlanRecord
                                                .where(
                                                  'Tour',
                                                  isEqualTo: widget!
                                                      .tourDocument?.reference,
                                                )
                                                .orderBy('Day',
                                                    descending: true),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<TourPlanRecord>
                                            columnTourPlanRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnTourPlanRecordList.length,
                                              (columnIndex) {
                                            final columnTourPlanRecord =
                                                columnTourPlanRecordList[
                                                    columnIndex];
                                            return Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onLongPress: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Удалить день?'),
                                                                        content:
                                                                            Text('Данное действие приведет к удалению дня'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('отмена'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('ок'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await columnTourPlanRecord
                                                                .reference
                                                                .delete();
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                'день ${columnTourPlanRecord.day.toString()}',
                                                                'день 1',
                                                              ),
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
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
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.day =
                                                            columnTourPlanRecord
                                                                .reference;
                                                        _model.addTimeSchedule =
                                                            !_model
                                                                .addTimeSchedule;
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 35.0,
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Icon(
                                                          Icons.add_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                TourDayScheduleRecord>>(
                                                          stream:
                                                              queryTourDayScheduleRecord(
                                                            queryBuilder:
                                                                (tourDayScheduleRecord) =>
                                                                    tourDayScheduleRecord
                                                                        .where(
                                                              'TourPlan',
                                                              isEqualTo:
                                                                  columnTourPlanRecord
                                                                      .reference,
                                                            ),
                                                          ),
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
                                                            List<TourDayScheduleRecord>
                                                                rowTourDayScheduleRecordList =
                                                                snapshot.data!;

                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    rowTourDayScheduleRecordList
                                                                        .length,
                                                                    (rowIndex) {
                                                                  final rowTourDayScheduleRecord =
                                                                      rowTourDayScheduleRecordList[
                                                                          rowIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onLongPress:
                                                                          () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Удалить время?'),
                                                                                  content: Text('Данное действие приведет к удалению временной метки'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('отмена'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('ок'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await rowTourDayScheduleRecord
                                                                              .reference
                                                                              .delete();
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x13FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              dateTimeFormat("Hm", rowTourDayScheduleRecord.timeDay),
                                                                              '11.00',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0x76FFFFFF),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Внимание'),
                                                        content: Text(
                                                            'Отмена добавления плана тура приведет к его удалению'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Продолжить добавление'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('Ок'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            await widget!
                                                .tourDocument!.reference
                                                .delete();
                                            await _model.tourDay!.reference
                                                .delete();
                                            await _model.daySchedule!.reference
                                                .delete();
                                          } else {
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Container(
                                          width: 170.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x36FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Отменить',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isGid,
                                              false)) {
                                            context.pushNamed(
                                              TourPageActiveWidget.routeName,
                                              queryParameters: {
                                                'tourDocument': serializeParam(
                                                  widget!.tourDocument,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'tourDocument':
                                                    widget!.tourDocument,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          } else {
                                            context.pushNamed(
                                              AdminPageWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          }

                                          var chatsRecordReference =
                                              ChatsRecord.collection.doc();
                                          await chatsRecordReference.set({
                                            ...createChatsRecordData(
                                              chatName: widget!
                                                  .tourDocument?.tourName,
                                              chatCreator: currentUserReference,
                                              chatLastMessage: 'чат создан',
                                              chatLastMessageSent:
                                                  currentUserReference,
                                              chatImage: widget!
                                                  .tourDocument?.tourImage,
                                              chatTour: widget!
                                                  .tourDocument?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'chat_created_at': FieldValue
                                                    .serverTimestamp(),
                                                'chat_users': [
                                                  currentUserReference
                                                ],
                                                'chat_last_message_time':
                                                    FieldValue
                                                        .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.chatDocument =
                                              ChatsRecord.getDocumentFromData({
                                            ...createChatsRecordData(
                                              chatName: widget!
                                                  .tourDocument?.tourName,
                                              chatCreator: currentUserReference,
                                              chatLastMessage: 'чат создан',
                                              chatLastMessageSent:
                                                  currentUserReference,
                                              chatImage: widget!
                                                  .tourDocument?.tourImage,
                                              chatTour: widget!
                                                  .tourDocument?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'chat_created_at':
                                                    DateTime.now(),
                                                'chat_users': [
                                                  currentUserReference
                                                ],
                                                'chat_last_message_time':
                                                    DateTime.now(),
                                              },
                                            ),
                                          }, chatsRecordReference);

                                          await widget!.tourDocument!.reference
                                              .update(createToursRecordData(
                                            tourChat:
                                                _model.chatDocument?.reference,
                                          ));

                                          var galleryRecordReference =
                                              GalleryRecord.collection.doc();
                                          await galleryRecordReference
                                              .set(createGalleryRecordData(
                                            galleryTour:
                                                widget!.tourDocument?.reference,
                                            galleryHasUnapprovedPhotos: false,
                                          ));
                                          _model.galleryTour =
                                              GalleryRecord.getDocumentFromData(
                                                  createGalleryRecordData(
                                                    galleryTour: widget!
                                                        .tourDocument
                                                        ?.reference,
                                                    galleryHasUnapprovedPhotos:
                                                        false,
                                                  ),
                                                  galleryRecordReference);

                                          await widget!.tourDocument!.reference
                                              .update(createToursRecordData(
                                            tourGallery:
                                                _model.galleryTour?.reference,
                                          ));

                                          await ChatMessagesRecord.collection
                                              .doc()
                                              .set({
                                            ...createChatMessagesRecordData(
                                              cmUser: currentUserReference,
                                              cmChat: _model
                                                  .chatDocument?.reference,
                                              cmMessage: 'Чат создан',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'cm_message_sent': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });

                                          await InteractiveRecord.collection
                                              .doc()
                                              .set({
                                            ...createInteractiveRecordData(
                                              image: widget!
                                                  .tourDocument?.tourImage,
                                              title: widget!
                                                  .tourDocument?.tourName,
                                              price: widget!
                                                  .tourDocument?.tourPrice,
                                              isfree: false,
                                              location: widget!.tourDocument
                                                  ?.tourLocationName,
                                              isTour: widget!
                                                  .tourDocument?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'created_at': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 170.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE8640C),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Добавить план',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                                    ],
                                  ),
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
          ],
        ),
      ),
    );
  }
}
