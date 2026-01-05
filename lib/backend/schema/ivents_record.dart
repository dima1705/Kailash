import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IventsRecord extends FirestoreRecord {
  IventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ivent_title" field.
  String? _iventTitle;
  String get iventTitle => _iventTitle ?? '';
  bool hasIventTitle() => _iventTitle != null;

  // "ivent_description" field.
  String? _iventDescription;
  String get iventDescription => _iventDescription ?? '';
  bool hasIventDescription() => _iventDescription != null;

  // "ivent_location" field.
  LatLng? _iventLocation;
  LatLng? get iventLocation => _iventLocation;
  bool hasIventLocation() => _iventLocation != null;

  // "ivent_location_name" field.
  String? _iventLocationName;
  String get iventLocationName => _iventLocationName ?? '';
  bool hasIventLocationName() => _iventLocationName != null;

  // "ivent_created_at" field.
  DateTime? _iventCreatedAt;
  DateTime? get iventCreatedAt => _iventCreatedAt;
  bool hasIventCreatedAt() => _iventCreatedAt != null;

  // "ivent_start_time" field.
  DateTime? _iventStartTime;
  DateTime? get iventStartTime => _iventStartTime;
  bool hasIventStartTime() => _iventStartTime != null;

  // "ivent_creator" field.
  DocumentReference? _iventCreator;
  DocumentReference? get iventCreator => _iventCreator;
  bool hasIventCreator() => _iventCreator != null;

  // "ivent_participants" field.
  List<DocumentReference>? _iventParticipants;
  List<DocumentReference> get iventParticipants =>
      _iventParticipants ?? const [];
  bool hasIventParticipants() => _iventParticipants != null;

  // "ivent_image" field.
  String? _iventImage;
  String get iventImage => _iventImage ?? '';
  bool hasIventImage() => _iventImage != null;

  // "ivent_price" field.
  double? _iventPrice;
  double get iventPrice => _iventPrice ?? 0.0;
  bool hasIventPrice() => _iventPrice != null;

  // "ivent_applications" field.
  List<DocumentReference>? _iventApplications;
  List<DocumentReference> get iventApplications =>
      _iventApplications ?? const [];
  bool hasIventApplications() => _iventApplications != null;

  // "ivent_max_participants" field.
  int? _iventMaxParticipants;
  int get iventMaxParticipants => _iventMaxParticipants ?? 0;
  bool hasIventMaxParticipants() => _iventMaxParticipants != null;

  void _initializeFields() {
    _iventTitle = snapshotData['ivent_title'] as String?;
    _iventDescription = snapshotData['ivent_description'] as String?;
    _iventLocation = snapshotData['ivent_location'] as LatLng?;
    _iventLocationName = snapshotData['ivent_location_name'] as String?;
    _iventCreatedAt = snapshotData['ivent_created_at'] as DateTime?;
    _iventStartTime = snapshotData['ivent_start_time'] as DateTime?;
    _iventCreator = snapshotData['ivent_creator'] as DocumentReference?;
    _iventParticipants = getDataList(snapshotData['ivent_participants']);
    _iventImage = snapshotData['ivent_image'] as String?;
    _iventPrice = castToType<double>(snapshotData['ivent_price']);
    _iventApplications = getDataList(snapshotData['ivent_applications']);
    _iventMaxParticipants =
        castToType<int>(snapshotData['ivent_max_participants']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ivents');

  static Stream<IventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IventsRecord.fromSnapshot(s));

  static Future<IventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IventsRecord.fromSnapshot(s));

  static IventsRecord fromSnapshot(DocumentSnapshot snapshot) => IventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIventsRecordData({
  String? iventTitle,
  String? iventDescription,
  LatLng? iventLocation,
  String? iventLocationName,
  DateTime? iventCreatedAt,
  DateTime? iventStartTime,
  DocumentReference? iventCreator,
  String? iventImage,
  double? iventPrice,
  int? iventMaxParticipants,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ivent_title': iventTitle,
      'ivent_description': iventDescription,
      'ivent_location': iventLocation,
      'ivent_location_name': iventLocationName,
      'ivent_created_at': iventCreatedAt,
      'ivent_start_time': iventStartTime,
      'ivent_creator': iventCreator,
      'ivent_image': iventImage,
      'ivent_price': iventPrice,
      'ivent_max_participants': iventMaxParticipants,
    }.withoutNulls,
  );

  return firestoreData;
}

class IventsRecordDocumentEquality implements Equality<IventsRecord> {
  const IventsRecordDocumentEquality();

  @override
  bool equals(IventsRecord? e1, IventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iventTitle == e2?.iventTitle &&
        e1?.iventDescription == e2?.iventDescription &&
        e1?.iventLocation == e2?.iventLocation &&
        e1?.iventLocationName == e2?.iventLocationName &&
        e1?.iventCreatedAt == e2?.iventCreatedAt &&
        e1?.iventStartTime == e2?.iventStartTime &&
        e1?.iventCreator == e2?.iventCreator &&
        listEquality.equals(e1?.iventParticipants, e2?.iventParticipants) &&
        e1?.iventImage == e2?.iventImage &&
        e1?.iventPrice == e2?.iventPrice &&
        listEquality.equals(e1?.iventApplications, e2?.iventApplications) &&
        e1?.iventMaxParticipants == e2?.iventMaxParticipants;
  }

  @override
  int hash(IventsRecord? e) => const ListEquality().hash([
        e?.iventTitle,
        e?.iventDescription,
        e?.iventLocation,
        e?.iventLocationName,
        e?.iventCreatedAt,
        e?.iventStartTime,
        e?.iventCreator,
        e?.iventParticipants,
        e?.iventImage,
        e?.iventPrice,
        e?.iventApplications,
        e?.iventMaxParticipants
      ]);

  @override
  bool isValidKey(Object? o) => o is IventsRecord;
}
