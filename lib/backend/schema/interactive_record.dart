import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InteractiveRecord extends FirestoreRecord {
  InteractiveRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "isfree" field.
  bool? _isfree;
  bool get isfree => _isfree ?? false;
  bool hasIsfree() => _isfree != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "isTour" field.
  DocumentReference? _isTour;
  DocumentReference? get isTour => _isTour;
  bool hasIsTour() => _isTour != null;

  // "isVebinar" field.
  DocumentReference? _isVebinar;
  DocumentReference? get isVebinar => _isVebinar;
  bool hasIsVebinar() => _isVebinar != null;

  // "isIvent" field.
  DocumentReference? _isIvent;
  DocumentReference? get isIvent => _isIvent;
  bool hasIsIvent() => _isIvent != null;

  // "isNews" field.
  DocumentReference? _isNews;
  DocumentReference? get isNews => _isNews;
  bool hasIsNews() => _isNews != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _isfree = snapshotData['isfree'] as bool?;
    _location = snapshotData['location'] as String?;
    _isTour = snapshotData['isTour'] as DocumentReference?;
    _isVebinar = snapshotData['isVebinar'] as DocumentReference?;
    _isIvent = snapshotData['isIvent'] as DocumentReference?;
    _isNews = snapshotData['isNews'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interactive');

  static Stream<InteractiveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InteractiveRecord.fromSnapshot(s));

  static Future<InteractiveRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InteractiveRecord.fromSnapshot(s));

  static InteractiveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InteractiveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InteractiveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InteractiveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InteractiveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InteractiveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInteractiveRecordData({
  String? image,
  String? title,
  double? price,
  bool? isfree,
  String? location,
  DocumentReference? isTour,
  DocumentReference? isVebinar,
  DocumentReference? isIvent,
  DocumentReference? isNews,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'title': title,
      'price': price,
      'isfree': isfree,
      'location': location,
      'isTour': isTour,
      'isVebinar': isVebinar,
      'isIvent': isIvent,
      'isNews': isNews,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class InteractiveRecordDocumentEquality implements Equality<InteractiveRecord> {
  const InteractiveRecordDocumentEquality();

  @override
  bool equals(InteractiveRecord? e1, InteractiveRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.isfree == e2?.isfree &&
        e1?.location == e2?.location &&
        e1?.isTour == e2?.isTour &&
        e1?.isVebinar == e2?.isVebinar &&
        e1?.isIvent == e2?.isIvent &&
        e1?.isNews == e2?.isNews &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(InteractiveRecord? e) => const ListEquality().hash([
        e?.image,
        e?.title,
        e?.price,
        e?.isfree,
        e?.location,
        e?.isTour,
        e?.isVebinar,
        e?.isIvent,
        e?.isNews,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is InteractiveRecord;
}
