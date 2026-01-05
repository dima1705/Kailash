import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GalleryRecord extends FirestoreRecord {
  GalleryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "gallery_tour" field.
  DocumentReference? _galleryTour;
  DocumentReference? get galleryTour => _galleryTour;
  bool hasGalleryTour() => _galleryTour != null;

  // "gallery_photo" field.
  List<DocumentReference>? _galleryPhoto;
  List<DocumentReference> get galleryPhoto => _galleryPhoto ?? const [];
  bool hasGalleryPhoto() => _galleryPhoto != null;

  // "gallery_has_unapproved_photos" field.
  bool? _galleryHasUnapprovedPhotos;
  bool get galleryHasUnapprovedPhotos => _galleryHasUnapprovedPhotos ?? false;
  bool hasGalleryHasUnapprovedPhotos() => _galleryHasUnapprovedPhotos != null;

  // "gallery_count_unapproved_photos" field.
  int? _galleryCountUnapprovedPhotos;
  int get galleryCountUnapprovedPhotos => _galleryCountUnapprovedPhotos ?? 0;
  bool hasGalleryCountUnapprovedPhotos() =>
      _galleryCountUnapprovedPhotos != null;

  void _initializeFields() {
    _galleryTour = snapshotData['gallery_tour'] as DocumentReference?;
    _galleryPhoto = getDataList(snapshotData['gallery_photo']);
    _galleryHasUnapprovedPhotos =
        snapshotData['gallery_has_unapproved_photos'] as bool?;
    _galleryCountUnapprovedPhotos =
        castToType<int>(snapshotData['gallery_count_unapproved_photos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Gallery');

  static Stream<GalleryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GalleryRecord.fromSnapshot(s));

  static Future<GalleryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GalleryRecord.fromSnapshot(s));

  static GalleryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GalleryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GalleryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GalleryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GalleryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GalleryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGalleryRecordData({
  DocumentReference? galleryTour,
  bool? galleryHasUnapprovedPhotos,
  int? galleryCountUnapprovedPhotos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gallery_tour': galleryTour,
      'gallery_has_unapproved_photos': galleryHasUnapprovedPhotos,
      'gallery_count_unapproved_photos': galleryCountUnapprovedPhotos,
    }.withoutNulls,
  );

  return firestoreData;
}

class GalleryRecordDocumentEquality implements Equality<GalleryRecord> {
  const GalleryRecordDocumentEquality();

  @override
  bool equals(GalleryRecord? e1, GalleryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.galleryTour == e2?.galleryTour &&
        listEquality.equals(e1?.galleryPhoto, e2?.galleryPhoto) &&
        e1?.galleryHasUnapprovedPhotos == e2?.galleryHasUnapprovedPhotos &&
        e1?.galleryCountUnapprovedPhotos == e2?.galleryCountUnapprovedPhotos;
  }

  @override
  int hash(GalleryRecord? e) => const ListEquality().hash([
        e?.galleryTour,
        e?.galleryPhoto,
        e?.galleryHasUnapprovedPhotos,
        e?.galleryCountUnapprovedPhotos
      ]);

  @override
  bool isValidKey(Object? o) => o is GalleryRecord;
}
