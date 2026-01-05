import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'yyyyy3_model.dart';
export 'yyyyy3_model.dart';

class Yyyyy3Widget extends StatefulWidget {
  const Yyyyy3Widget({super.key});

  static String routeName = 'yyyyy3';
  static String routePath = '/yyyyy3';

  @override
  State<Yyyyy3Widget> createState() => _Yyyyy3WidgetState();
}

class _Yyyyy3WidgetState extends State<Yyyyy3Widget> {
  late Yyyyy3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Yyyyy3Model());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 440.0,
                height: 684.54,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.network(
                      'gs://kailash-e332jc.firebasestorage.app/5b3c4b88bc649a65d786e55abb5bcce27feda9b4.png',
                    ).image,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
