import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'admin_page_widget.dart' show AdminPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AdminPageModel extends FlutterFlowModel<AdminPageWidget> {
  ///  Local state fields for this page.

  bool? isTours = true;

  bool isUsers = false;

  bool isImages = false;

  bool isVebinars = false;

  bool isIvents = false;

  bool isNews = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ToursRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? gridViewPagingController;
  Query? gridViewPagingQuery;
  List<StreamSubscription?> gridViewStreamSubscriptions = [];

  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  GalleryPhotoRecord? photoDoc;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, VebinarsRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, IventsRecord>? listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, NewsRecord>? listViewPagingController5;
  Query? listViewPagingQuery5;
  List<StreamSubscription?> listViewStreamSubscriptions5 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    gridViewStreamSubscriptions.forEach((s) => s?.cancel());
    gridViewPagingController?.dispose();

    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();

    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    listViewStreamSubscriptions5.forEach((s) => s?.cancel());
    listViewPagingController5?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ToursRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ToursRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ToursRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryToursRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, UsersRecord> setGridViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController ??= _createGridViewController(query, parent);
    if (gridViewPagingQuery != query) {
      gridViewPagingQuery = query;
      gridViewPagingController?.refresh();
    }
    return gridViewPagingController!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createGridViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          queryBuilder: (_) => gridViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, VebinarsRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, VebinarsRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, VebinarsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryVebinarsRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, IventsRecord> setListViewController4(
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

  PagingController<DocumentSnapshot?, IventsRecord> _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, IventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryIventsRecordPage(
          queryBuilder: (_) => listViewPagingQuery4 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, NewsRecord> setListViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController5 ??= _createListViewController5(query, parent);
    if (listViewPagingQuery5 != query) {
      listViewPagingQuery5 = query;
      listViewPagingController5?.refresh();
    }
    return listViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, NewsRecord> _createListViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, NewsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryNewsRecordPage(
          queryBuilder: (_) => listViewPagingQuery5 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions5,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
