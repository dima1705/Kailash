import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "news_title" field.
  String? _newsTitle;
  String get newsTitle => _newsTitle ?? '';
  bool hasNewsTitle() => _newsTitle != null;

  // "news_location" field.
  LatLng? _newsLocation;
  LatLng? get newsLocation => _newsLocation;
  bool hasNewsLocation() => _newsLocation != null;

  // "news_location_name" field.
  String? _newsLocationName;
  String get newsLocationName => _newsLocationName ?? '';
  bool hasNewsLocationName() => _newsLocationName != null;

  // "news_description" field.
  String? _newsDescription;
  String get newsDescription => _newsDescription ?? '';
  bool hasNewsDescription() => _newsDescription != null;

  // "news_created_at" field.
  DateTime? _newsCreatedAt;
  DateTime? get newsCreatedAt => _newsCreatedAt;
  bool hasNewsCreatedAt() => _newsCreatedAt != null;

  // "news_creator" field.
  DocumentReference? _newsCreator;
  DocumentReference? get newsCreator => _newsCreator;
  bool hasNewsCreator() => _newsCreator != null;

  // "news_image" field.
  String? _newsImage;
  String get newsImage => _newsImage ?? '';
  bool hasNewsImage() => _newsImage != null;

  void _initializeFields() {
    _newsTitle = snapshotData['news_title'] as String?;
    _newsLocation = snapshotData['news_location'] as LatLng?;
    _newsLocationName = snapshotData['news_location_name'] as String?;
    _newsDescription = snapshotData['news_description'] as String?;
    _newsCreatedAt = snapshotData['news_created_at'] as DateTime?;
    _newsCreator = snapshotData['news_creator'] as DocumentReference?;
    _newsImage = snapshotData['news_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('News');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? newsTitle,
  LatLng? newsLocation,
  String? newsLocationName,
  String? newsDescription,
  DateTime? newsCreatedAt,
  DocumentReference? newsCreator,
  String? newsImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'news_title': newsTitle,
      'news_location': newsLocation,
      'news_location_name': newsLocationName,
      'news_description': newsDescription,
      'news_created_at': newsCreatedAt,
      'news_creator': newsCreator,
      'news_image': newsImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.newsTitle == e2?.newsTitle &&
        e1?.newsLocation == e2?.newsLocation &&
        e1?.newsLocationName == e2?.newsLocationName &&
        e1?.newsDescription == e2?.newsDescription &&
        e1?.newsCreatedAt == e2?.newsCreatedAt &&
        e1?.newsCreator == e2?.newsCreator &&
        e1?.newsImage == e2?.newsImage;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash([
        e?.newsTitle,
        e?.newsLocation,
        e?.newsLocationName,
        e?.newsDescription,
        e?.newsCreatedAt,
        e?.newsCreator,
        e?.newsImage
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
