import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GalleryPhotoRecord extends FirestoreRecord {
  GalleryPhotoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "photo_creator" field.
  DocumentReference? _photoCreator;
  DocumentReference? get photoCreator => _photoCreator;
  bool hasPhotoCreator() => _photoCreator != null;

  // "photo_created_at" field.
  DateTime? _photoCreatedAt;
  DateTime? get photoCreatedAt => _photoCreatedAt;
  bool hasPhotoCreatedAt() => _photoCreatedAt != null;

  // "photo_gallery" field.
  DocumentReference? _photoGallery;
  DocumentReference? get photoGallery => _photoGallery;
  bool hasPhotoGallery() => _photoGallery != null;

  // "photo_approved" field.
  bool? _photoApproved;
  bool get photoApproved => _photoApproved ?? false;
  bool hasPhotoApproved() => _photoApproved != null;

  void _initializeFields() {
    _photo = snapshotData['photo'] as String?;
    _photoCreator = snapshotData['photo_creator'] as DocumentReference?;
    _photoCreatedAt = snapshotData['photo_created_at'] as DateTime?;
    _photoGallery = snapshotData['photo_gallery'] as DocumentReference?;
    _photoApproved = snapshotData['photo_approved'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('GalleryPhoto');

  static Stream<GalleryPhotoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GalleryPhotoRecord.fromSnapshot(s));

  static Future<GalleryPhotoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GalleryPhotoRecord.fromSnapshot(s));

  static GalleryPhotoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GalleryPhotoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GalleryPhotoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GalleryPhotoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GalleryPhotoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GalleryPhotoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGalleryPhotoRecordData({
  String? photo,
  DocumentReference? photoCreator,
  DateTime? photoCreatedAt,
  DocumentReference? photoGallery,
  bool? photoApproved,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo': photo,
      'photo_creator': photoCreator,
      'photo_created_at': photoCreatedAt,
      'photo_gallery': photoGallery,
      'photo_approved': photoApproved,
    }.withoutNulls,
  );

  return firestoreData;
}

class GalleryPhotoRecordDocumentEquality
    implements Equality<GalleryPhotoRecord> {
  const GalleryPhotoRecordDocumentEquality();

  @override
  bool equals(GalleryPhotoRecord? e1, GalleryPhotoRecord? e2) {
    return e1?.photo == e2?.photo &&
        e1?.photoCreator == e2?.photoCreator &&
        e1?.photoCreatedAt == e2?.photoCreatedAt &&
        e1?.photoGallery == e2?.photoGallery &&
        e1?.photoApproved == e2?.photoApproved;
  }

  @override
  int hash(GalleryPhotoRecord? e) => const ListEquality().hash([
        e?.photo,
        e?.photoCreator,
        e?.photoCreatedAt,
        e?.photoGallery,
        e?.photoApproved
      ]);

  @override
  bool isValidKey(Object? o) => o is GalleryPhotoRecord;
}
