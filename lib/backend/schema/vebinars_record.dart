import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VebinarsRecord extends FirestoreRecord {
  VebinarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vebinar_title" field.
  String? _vebinarTitle;
  String get vebinarTitle => _vebinarTitle ?? '';
  bool hasVebinarTitle() => _vebinarTitle != null;

  // "vebinar_description" field.
  String? _vebinarDescription;
  String get vebinarDescription => _vebinarDescription ?? '';
  bool hasVebinarDescription() => _vebinarDescription != null;

  // "vebinar_participants" field.
  List<DocumentReference>? _vebinarParticipants;
  List<DocumentReference> get vebinarParticipants =>
      _vebinarParticipants ?? const [];
  bool hasVebinarParticipants() => _vebinarParticipants != null;

  // "vebinar_creator" field.
  DocumentReference? _vebinarCreator;
  DocumentReference? get vebinarCreator => _vebinarCreator;
  bool hasVebinarCreator() => _vebinarCreator != null;

  // "vebinar_created_at" field.
  DateTime? _vebinarCreatedAt;
  DateTime? get vebinarCreatedAt => _vebinarCreatedAt;
  bool hasVebinarCreatedAt() => _vebinarCreatedAt != null;

  // "vebinar_image" field.
  String? _vebinarImage;
  String get vebinarImage => _vebinarImage ?? '';
  bool hasVebinarImage() => _vebinarImage != null;

  // "vebinar_url_link" field.
  String? _vebinarUrlLink;
  String get vebinarUrlLink => _vebinarUrlLink ?? '';
  bool hasVebinarUrlLink() => _vebinarUrlLink != null;

  // "vebinar_start_time" field.
  DateTime? _vebinarStartTime;
  DateTime? get vebinarStartTime => _vebinarStartTime;
  bool hasVebinarStartTime() => _vebinarStartTime != null;

  // "vebinar_price" field.
  double? _vebinarPrice;
  double get vebinarPrice => _vebinarPrice ?? 0.0;
  bool hasVebinarPrice() => _vebinarPrice != null;

  // "vebinar_applications" field.
  List<DocumentReference>? _vebinarApplications;
  List<DocumentReference> get vebinarApplications =>
      _vebinarApplications ?? const [];
  bool hasVebinarApplications() => _vebinarApplications != null;

  // "vebinar_max_participants" field.
  int? _vebinarMaxParticipants;
  int get vebinarMaxParticipants => _vebinarMaxParticipants ?? 0;
  bool hasVebinarMaxParticipants() => _vebinarMaxParticipants != null;

  void _initializeFields() {
    _vebinarTitle = snapshotData['vebinar_title'] as String?;
    _vebinarDescription = snapshotData['vebinar_description'] as String?;
    _vebinarParticipants = getDataList(snapshotData['vebinar_participants']);
    _vebinarCreator = snapshotData['vebinar_creator'] as DocumentReference?;
    _vebinarCreatedAt = snapshotData['vebinar_created_at'] as DateTime?;
    _vebinarImage = snapshotData['vebinar_image'] as String?;
    _vebinarUrlLink = snapshotData['vebinar_url_link'] as String?;
    _vebinarStartTime = snapshotData['vebinar_start_time'] as DateTime?;
    _vebinarPrice = castToType<double>(snapshotData['vebinar_price']);
    _vebinarApplications = getDataList(snapshotData['vebinar_applications']);
    _vebinarMaxParticipants =
        castToType<int>(snapshotData['vebinar_max_participants']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Vebinars');

  static Stream<VebinarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VebinarsRecord.fromSnapshot(s));

  static Future<VebinarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VebinarsRecord.fromSnapshot(s));

  static VebinarsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VebinarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VebinarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VebinarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VebinarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VebinarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVebinarsRecordData({
  String? vebinarTitle,
  String? vebinarDescription,
  DocumentReference? vebinarCreator,
  DateTime? vebinarCreatedAt,
  String? vebinarImage,
  String? vebinarUrlLink,
  DateTime? vebinarStartTime,
  double? vebinarPrice,
  int? vebinarMaxParticipants,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vebinar_title': vebinarTitle,
      'vebinar_description': vebinarDescription,
      'vebinar_creator': vebinarCreator,
      'vebinar_created_at': vebinarCreatedAt,
      'vebinar_image': vebinarImage,
      'vebinar_url_link': vebinarUrlLink,
      'vebinar_start_time': vebinarStartTime,
      'vebinar_price': vebinarPrice,
      'vebinar_max_participants': vebinarMaxParticipants,
    }.withoutNulls,
  );

  return firestoreData;
}

class VebinarsRecordDocumentEquality implements Equality<VebinarsRecord> {
  const VebinarsRecordDocumentEquality();

  @override
  bool equals(VebinarsRecord? e1, VebinarsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.vebinarTitle == e2?.vebinarTitle &&
        e1?.vebinarDescription == e2?.vebinarDescription &&
        listEquality.equals(e1?.vebinarParticipants, e2?.vebinarParticipants) &&
        e1?.vebinarCreator == e2?.vebinarCreator &&
        e1?.vebinarCreatedAt == e2?.vebinarCreatedAt &&
        e1?.vebinarImage == e2?.vebinarImage &&
        e1?.vebinarUrlLink == e2?.vebinarUrlLink &&
        e1?.vebinarStartTime == e2?.vebinarStartTime &&
        e1?.vebinarPrice == e2?.vebinarPrice &&
        listEquality.equals(e1?.vebinarApplications, e2?.vebinarApplications) &&
        e1?.vebinarMaxParticipants == e2?.vebinarMaxParticipants;
  }

  @override
  int hash(VebinarsRecord? e) => const ListEquality().hash([
        e?.vebinarTitle,
        e?.vebinarDescription,
        e?.vebinarParticipants,
        e?.vebinarCreator,
        e?.vebinarCreatedAt,
        e?.vebinarImage,
        e?.vebinarUrlLink,
        e?.vebinarStartTime,
        e?.vebinarPrice,
        e?.vebinarApplications,
        e?.vebinarMaxParticipants
      ]);

  @override
  bool isValidKey(Object? o) => o is VebinarsRecord;
}
