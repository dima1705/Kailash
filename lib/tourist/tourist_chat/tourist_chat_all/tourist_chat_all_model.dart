import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import 'tourist_chat_all_widget.dart' show TouristChatAllWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TouristChatAllModel extends FlutterFlowModel<TouristChatAllWidget> {
  ///  Local state fields for this page.

  bool onDelete = false;

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
