import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/empty_list/empty_list_widget.dart';
import '/nav_bar/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'tourist_home_page_widget.dart' show TouristHomePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class TouristHomePageModel extends FlutterFlowModel<TouristHomePageWidget> {
  ///  Local state fields for this page.

  bool showVebinars = true;

  bool showIvents = false;

  bool showTours = false;

  bool showAll = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<InteractiveRecord> simpleSearchResults = [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, NewsRecord>? listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    navBarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, NewsRecord> setListViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController4 ??= _createListViewController4(query, parent);
    if (listViewPagingQuery4 != query) {
      listViewPagingQuery4 = query;
      listViewPagingController4?.refresh();
    }
    return listViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, NewsRecord> _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, NewsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryNewsRecordPage(
          queryBuilder: (_) => listViewPagingQuery4 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
