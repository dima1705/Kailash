import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TourPlanRecord extends FirestoreRecord {
  TourPlanRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Day" field.
  int? _day;
  int get day => _day ?? 0;
  bool hasDay() => _day != null;

  // "TourSchedule" field.
  DocumentReference? _tourSchedule;
  DocumentReference? get tourSchedule => _tourSchedule;
  bool hasTourSchedule() => _tourSchedule != null;

  // "Tour" field.
  DocumentReference? _tour;
  DocumentReference? get tour => _tour;
  bool hasTour() => _tour != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "LocationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _day = castToType<int>(snapshotData['Day']);
    _tourSchedule = snapshotData['TourSchedule'] as DocumentReference?;
    _tour = snapshotData['Tour'] as DocumentReference?;
    _location = snapshotData['Location'] as LatLng?;
    _locationName = snapshotData['LocationName'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TourPlan');

  static Stream<TourPlanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TourPlanRecord.fromSnapshot(s));

  static Future<TourPlanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TourPlanRecord.fromSnapshot(s));

  static TourPlanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TourPlanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TourPlanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TourPlanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TourPlanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TourPlanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTourPlanRecordData({
  int? day,
  DocumentReference? tourSchedule,
  DocumentReference? tour,
  LatLng? location,
  String? locationName,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Day': day,
      'TourSchedule': tourSchedule,
      'Tour': tour,
      'Location': location,
      'LocationName': locationName,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TourPlanRecordDocumentEquality implements Equality<TourPlanRecord> {
  const TourPlanRecordDocumentEquality();

  @override
  bool equals(TourPlanRecord? e1, TourPlanRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.tourSchedule == e2?.tourSchedule &&
        e1?.tour == e2?.tour &&
        e1?.location == e2?.location &&
        e1?.locationName == e2?.locationName &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TourPlanRecord? e) => const ListEquality().hash([
        e?.day,
        e?.tourSchedule,
        e?.tour,
        e?.location,
        e?.locationName,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is TourPlanRecord;
}
