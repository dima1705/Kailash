import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TourDayScheduleRecord extends FirestoreRecord {
  TourDayScheduleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TimeDay" field.
  DateTime? _timeDay;
  DateTime? get timeDay => _timeDay;
  bool hasTimeDay() => _timeDay != null;

  // "TimeTitle" field.
  String? _timeTitle;
  String get timeTitle => _timeTitle ?? '';
  bool hasTimeTitle() => _timeTitle != null;

  // "TimeLocation" field.
  String? _timeLocation;
  String get timeLocation => _timeLocation ?? '';
  bool hasTimeLocation() => _timeLocation != null;

  // "TimePlan" field.
  String? _timePlan;
  String get timePlan => _timePlan ?? '';
  bool hasTimePlan() => _timePlan != null;

  // "TourPlan" field.
  DocumentReference? _tourPlan;
  DocumentReference? get tourPlan => _tourPlan;
  bool hasTourPlan() => _tourPlan != null;

  void _initializeFields() {
    _timeDay = snapshotData['TimeDay'] as DateTime?;
    _timeTitle = snapshotData['TimeTitle'] as String?;
    _timeLocation = snapshotData['TimeLocation'] as String?;
    _timePlan = snapshotData['TimePlan'] as String?;
    _tourPlan = snapshotData['TourPlan'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TourDaySchedule');

  static Stream<TourDayScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TourDayScheduleRecord.fromSnapshot(s));

  static Future<TourDayScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TourDayScheduleRecord.fromSnapshot(s));

  static TourDayScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TourDayScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TourDayScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TourDayScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TourDayScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TourDayScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTourDayScheduleRecordData({
  DateTime? timeDay,
  String? timeTitle,
  String? timeLocation,
  String? timePlan,
  DocumentReference? tourPlan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TimeDay': timeDay,
      'TimeTitle': timeTitle,
      'TimeLocation': timeLocation,
      'TimePlan': timePlan,
      'TourPlan': tourPlan,
    }.withoutNulls,
  );

  return firestoreData;
}

class TourDayScheduleRecordDocumentEquality
    implements Equality<TourDayScheduleRecord> {
  const TourDayScheduleRecordDocumentEquality();

  @override
  bool equals(TourDayScheduleRecord? e1, TourDayScheduleRecord? e2) {
    return e1?.timeDay == e2?.timeDay &&
        e1?.timeTitle == e2?.timeTitle &&
        e1?.timeLocation == e2?.timeLocation &&
        e1?.timePlan == e2?.timePlan &&
        e1?.tourPlan == e2?.tourPlan;
  }

  @override
  int hash(TourDayScheduleRecord? e) => const ListEquality().hash(
      [e?.timeDay, e?.timeTitle, e?.timeLocation, e?.timePlan, e?.tourPlan]);

  @override
  bool isValidKey(Object? o) => o is TourDayScheduleRecord;
}
