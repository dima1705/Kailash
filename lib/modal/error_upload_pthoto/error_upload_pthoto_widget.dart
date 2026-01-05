import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'error_upload_pthoto_model.dart';
export 'error_upload_pthoto_model.dart';

class ErrorUploadPthotoWidget extends StatefulWidget {
  const ErrorUploadPthotoWidget({super.key});

  @override
  State<ErrorUploadPthotoWidget> createState() =>
      _ErrorUploadPthotoWidgetState();
}

class _ErrorUploadPthotoWidgetState extends State<ErrorUploadPthotoWidget> {
  late ErrorUploadPthotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorUploadPthotoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Color(0xFF303030),
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ошибка',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: Color(0xFFFFF9F9),
                  fontSize: 26.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 20.0),
            child: Text(
              'Произошла ошибка при загрузке изображения',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Color(0x8AD9D9D9),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              width: 240.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).customColor1,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'ок',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFFD9D9D9),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
