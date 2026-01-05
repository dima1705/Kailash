import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToursRecord extends FirestoreRecord {
  ToursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TourName" field.
  String? _tourName;
  String get tourName => _tourName ?? '';
  bool hasTourName() => _tourName != null;

  // "TourDescription" field.
  String? _tourDescription;
  String get tourDescription => _tourDescription ?? '';
  bool hasTourDescription() => _tourDescription != null;

  // "TourWeather" field.
  String? _tourWeather;
  String get tourWeather => _tourWeather ?? '';
  bool hasTourWeather() => _tourWeather != null;

  // "TourDistance" field.
  String? _tourDistance;
  String get tourDistance => _tourDistance ?? '';
  bool hasTourDistance() => _tourDistance != null;

  // "TourHardRate" field.
  double? _tourHardRate;
  double get tourHardRate => _tourHardRate ?? 0.0;
  bool hasTourHardRate() => _tourHardRate != null;

  // "TourPrice" field.
  double? _tourPrice;
  double get tourPrice => _tourPrice ?? 0.0;
  bool hasTourPrice() => _tourPrice != null;

  // "TourImage" field.
  String? _tourImage;
  String get tourImage => _tourImage ?? '';
  bool hasTourImage() => _tourImage != null;

  // "TourGid" field.
  DocumentReference? _tourGid;
  DocumentReference? get tourGid => _tourGid;
  bool hasTourGid() => _tourGid != null;

  // "TourCreatedDate" field.
  DateTime? _tourCreatedDate;
  DateTime? get tourCreatedDate => _tourCreatedDate;
  bool hasTourCreatedDate() => _tourCreatedDate != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "isPastTour" field.
  bool? _isPastTour;
  bool get isPastTour => _isPastTour ?? false;
  bool hasIsPastTour() => _isPastTour != null;

  // "TourParticipants" field.
  List<DocumentReference>? _tourParticipants;
  List<DocumentReference> get tourParticipants => _tourParticipants ?? const [];
  bool hasTourParticipants() => _tourParticipants != null;

  // "TourMap" field.
  String? _tourMap;
  String get tourMap => _tourMap ?? '';
  bool hasTourMap() => _tourMap != null;

  // "TourLocation" field.
  LatLng? _tourLocation;
  LatLng? get tourLocation => _tourLocation;
  bool hasTourLocation() => _tourLocation != null;

  // "TourStart" field.
  DateTime? _tourStart;
  DateTime? get tourStart => _tourStart;
  bool hasTourStart() => _tourStart != null;

  // "TourFinish" field.
  DateTime? _tourFinish;
  DateTime? get tourFinish => _tourFinish;
  bool hasTourFinish() => _tourFinish != null;

  // "TourCreator" field.
  DocumentReference? _tourCreator;
  DocumentReference? get tourCreator => _tourCreator;
  bool hasTourCreator() => _tourCreator != null;

  // "TourPlan" field.
  List<DocumentReference>? _tourPlan;
  List<DocumentReference> get tourPlan => _tourPlan ?? const [];
  bool hasTourPlan() => _tourPlan != null;

  // "TourLocationName" field.
  String? _tourLocationName;
  String get tourLocationName => _tourLocationName ?? '';
  bool hasTourLocationName() => _tourLocationName != null;

  // "TourCreatedTime" field.
  DateTime? _tourCreatedTime;
  DateTime? get tourCreatedTime => _tourCreatedTime;
  bool hasTourCreatedTime() => _tourCreatedTime != null;

  // "TourGallery" field.
  DocumentReference? _tourGallery;
  DocumentReference? get tourGallery => _tourGallery;
  bool hasTourGallery() => _tourGallery != null;

  // "TourApplications" field.
  List<DocumentReference>? _tourApplications;
  List<DocumentReference> get tourApplications => _tourApplications ?? const [];
  bool hasTourApplications() => _tourApplications != null;

  // "TourMaxParticipants" field.
  int? _tourMaxParticipants;
  int get tourMaxParticipants => _tourMaxParticipants ?? 0;
  bool hasTourMaxParticipants() => _tourMaxParticipants != null;

  // "TourChat" field.
  DocumentReference? _tourChat;
  DocumentReference? get tourChat => _tourChat;
  bool hasTourChat() => _tourChat != null;

  // "TourRate" field.
  double? _tourRate;
  double get tourRate => _tourRate ?? 0.0;
  bool hasTourRate() => _tourRate != null;

  // "isActiveNow" field.
  bool? _isActiveNow;
  bool get isActiveNow => _isActiveNow ?? false;
  bool hasIsActiveNow() => _isActiveNow != null;

  // "lastStatusUpdate" field.
  DateTime? _lastStatusUpdate;
  DateTime? get lastStatusUpdate => _lastStatusUpdate;
  bool hasLastStatusUpdate() => _lastStatusUpdate != null;

  // "isFutureTour" field.
  bool? _isFutureTour;
  bool get isFutureTour => _isFutureTour ?? false;
  bool hasIsFutureTour() => _isFutureTour != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "activatedAt" field.
  DateTime? _activatedAt;
  DateTime? get activatedAt => _activatedAt;
  bool hasActivatedAt() => _activatedAt != null;

  // "finishedAt" field.
  DateTime? _finishedAt;
  DateTime? get finishedAt => _finishedAt;
  bool hasFinishedAt() => _finishedAt != null;

  void _initializeFields() {
    _tourName = snapshotData['TourName'] as String?;
    _tourDescription = snapshotData['TourDescription'] as String?;
    _tourWeather = snapshotData['TourWeather'] as String?;
    _tourDistance = snapshotData['TourDistance'] as String?;
    _tourHardRate = castToType<double>(snapshotData['TourHardRate']);
    _tourPrice = castToType<double>(snapshotData['TourPrice']);
    _tourImage = snapshotData['TourImage'] as String?;
    _tourGid = snapshotData['TourGid'] as DocumentReference?;
    _tourCreatedDate = snapshotData['TourCreatedDate'] as DateTime?;
    _isActive = snapshotData['isActive'] as bool?;
    _isPastTour = snapshotData['isPastTour'] as bool?;
    _tourParticipants = getDataList(snapshotData['TourParticipants']);
    _tourMap = snapshotData['TourMap'] as String?;
    _tourLocation = snapshotData['TourLocation'] as LatLng?;
    _tourStart = snapshotData['TourStart'] as DateTime?;
    _tourFinish = snapshotData['TourFinish'] as DateTime?;
    _tourCreator = snapshotData['TourCreator'] as DocumentReference?;
    _tourPlan = getDataList(snapshotData['TourPlan']);
    _tourLocationName = snapshotData['TourLocationName'] as String?;
    _tourCreatedTime = snapshotData['TourCreatedTime'] as DateTime?;
    _tourGallery = snapshotData['TourGallery'] as DocumentReference?;
    _tourApplications = getDataList(snapshotData['TourApplications']);
    _tourMaxParticipants = castToType<int>(snapshotData['TourMaxParticipants']);
    _tourChat = snapshotData['TourChat'] as DocumentReference?;
    _tourRate = castToType<double>(snapshotData['TourRate']);
    _isActiveNow = snapshotData['isActiveNow'] as bool?;
    _lastStatusUpdate = snapshotData['lastStatusUpdate'] as DateTime?;
    _isFutureTour = snapshotData['isFutureTour'] as bool?;
    _status = snapshotData['status'] as String?;
    _activatedAt = snapshotData['activatedAt'] as DateTime?;
    _finishedAt = snapshotData['finishedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tours');

  static Stream<ToursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToursRecord.fromSnapshot(s));

  static Future<ToursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToursRecord.fromSnapshot(s));

  static ToursRecord fromSnapshot(DocumentSnapshot snapshot) => ToursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToursRecordData({
  String? tourName,
  String? tourDescription,
  String? tourWeather,
  String? tourDistance,
  double? tourHardRate,
  double? tourPrice,
  String? tourImage,
  DocumentReference? tourGid,
  DateTime? tourCreatedDate,
  bool? isActive,
  bool? isPastTour,
  String? tourMap,
  LatLng? tourLocation,
  DateTime? tourStart,
  DateTime? tourFinish,
  DocumentReference? tourCreator,
  String? tourLocationName,
  DateTime? tourCreatedTime,
  DocumentReference? tourGallery,
  int? tourMaxParticipants,
  DocumentReference? tourChat,
  double? tourRate,
  bool? isActiveNow,
  DateTime? lastStatusUpdate,
  bool? isFutureTour,
  String? status,
  DateTime? activatedAt,
  DateTime? finishedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TourName': tourName,
      'TourDescription': tourDescription,
      'TourWeather': tourWeather,
      'TourDistance': tourDistance,
      'TourHardRate': tourHardRate,
      'TourPrice': tourPrice,
      'TourImage': tourImage,
      'TourGid': tourGid,
      'TourCreatedDate': tourCreatedDate,
      'isActive': isActive,
      'isPastTour': isPastTour,
      'TourMap': tourMap,
      'TourLocation': tourLocation,
      'TourStart': tourStart,
      'TourFinish': tourFinish,
      'TourCreator': tourCreator,
      'TourLocationName': tourLocationName,
      'TourCreatedTime': tourCreatedTime,
      'TourGallery': tourGallery,
      'TourMaxParticipants': tourMaxParticipants,
      'TourChat': tourChat,
      'TourRate': tourRate,
      'isActiveNow': isActiveNow,
      'lastStatusUpdate': lastStatusUpdate,
      'isFutureTour': isFutureTour,
      'status': status,
      'activatedAt': activatedAt,
      'finishedAt': finishedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToursRecordDocumentEquality implements Equality<ToursRecord> {
  const ToursRecordDocumentEquality();

  @override
  bool equals(ToursRecord? e1, ToursRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tourName == e2?.tourName &&
        e1?.tourDescription == e2?.tourDescription &&
        e1?.tourWeather == e2?.tourWeather &&
        e1?.tourDistance == e2?.tourDistance &&
        e1?.tourHardRate == e2?.tourHardRate &&
        e1?.tourPrice == e2?.tourPrice &&
        e1?.tourImage == e2?.tourImage &&
        e1?.tourGid == e2?.tourGid &&
        e1?.tourCreatedDate == e2?.tourCreatedDate &&
        e1?.isActive == e2?.isActive &&
        e1?.isPastTour == e2?.isPastTour &&
        listEquality.equals(e1?.tourParticipants, e2?.tourParticipants) &&
        e1?.tourMap == e2?.tourMap &&
        e1?.tourLocation == e2?.tourLocation &&
        e1?.tourStart == e2?.tourStart &&
        e1?.tourFinish == e2?.tourFinish &&
        e1?.tourCreator == e2?.tourCreator &&
        listEquality.equals(e1?.tourPlan, e2?.tourPlan) &&
        e1?.tourLocationName == e2?.tourLocationName &&
        e1?.tourCreatedTime == e2?.tourCreatedTime &&
        e1?.tourGallery == e2?.tourGallery &&
        listEquality.equals(e1?.tourApplications, e2?.tourApplications) &&
        e1?.tourMaxParticipants == e2?.tourMaxParticipants &&
        e1?.tourChat == e2?.tourChat &&
        e1?.tourRate == e2?.tourRate &&
        e1?.isActiveNow == e2?.isActiveNow &&
        e1?.lastStatusUpdate == e2?.lastStatusUpdate &&
        e1?.isFutureTour == e2?.isFutureTour &&
        e1?.status == e2?.status &&
        e1?.activatedAt == e2?.activatedAt &&
        e1?.finishedAt == e2?.finishedAt;
  }

  @override
  int hash(ToursRecord? e) => const ListEquality().hash([
        e?.tourName,
        e?.tourDescription,
        e?.tourWeather,
        e?.tourDistance,
        e?.tourHardRate,
        e?.tourPrice,
        e?.tourImage,
        e?.tourGid,
        e?.tourCreatedDate,
        e?.isActive,
        e?.isPastTour,
        e?.tourParticipants,
        e?.tourMap,
        e?.tourLocation,
        e?.tourStart,
        e?.tourFinish,
        e?.tourCreator,
        e?.tourPlan,
        e?.tourLocationName,
        e?.tourCreatedTime,
        e?.tourGallery,
        e?.tourApplications,
        e?.tourMaxParticipants,
        e?.tourChat,
        e?.tourRate,
        e?.isActiveNow,
        e?.lastStatusUpdate,
        e?.isFutureTour,
        e?.status,
        e?.activatedAt,
        e?.finishedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ToursRecord;
}
