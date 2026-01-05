import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "allowNotification" field.
  bool? _allowNotification;
  bool get allowNotification => _allowNotification ?? false;
  bool hasAllowNotification() => _allowNotification != null;

  // "Tours" field.
  List<DocumentReference>? _tours;
  List<DocumentReference> get tours => _tours ?? const [];
  bool hasTours() => _tours != null;

  // "ToursFavorite" field.
  List<DocumentReference>? _toursFavorite;
  List<DocumentReference> get toursFavorite => _toursFavorite ?? const [];
  bool hasToursFavorite() => _toursFavorite != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "is_Gid" field.
  bool? _isGid;
  bool get isGid => _isGid ?? false;
  bool hasIsGid() => _isGid != null;

  // "is_Tourist" field.
  bool? _isTourist;
  bool get isTourist => _isTourist ?? false;
  bool hasIsTourist() => _isTourist != null;

  // "active_Tour" field.
  DocumentReference? _activeTour;
  DocumentReference? get activeTour => _activeTour;
  bool hasActiveTour() => _activeTour != null;

  // "sub_standart" field.
  bool? _subStandart;
  bool get subStandart => _subStandart ?? false;
  bool hasSubStandart() => _subStandart != null;

  // "sub_premium" field.
  bool? _subPremium;
  bool get subPremium => _subPremium ?? false;
  bool hasSubPremium() => _subPremium != null;

  // "Vebinars" field.
  List<DocumentReference>? _vebinars;
  List<DocumentReference> get vebinars => _vebinars ?? const [];
  bool hasVebinars() => _vebinars != null;

  // "Ivents" field.
  List<DocumentReference>? _ivents;
  List<DocumentReference> get ivents => _ivents ?? const [];
  bool hasIvents() => _ivents != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "Chats" field.
  List<DocumentReference>? _chats;
  List<DocumentReference> get chats => _chats ?? const [];
  bool hasChats() => _chats != null;

  // "male" field.
  bool? _male;
  bool get male => _male ?? false;
  bool hasMale() => _male != null;

  // "female" field.
  bool? _female;
  bool get female => _female ?? false;
  bool hasFemale() => _female != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "DateOfBirth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "GidAbout" field.
  String? _gidAbout;
  String get gidAbout => _gidAbout ?? '';
  bool hasGidAbout() => _gidAbout != null;

  // "GidExpirience" field.
  String? _gidExpirience;
  String get gidExpirience => _gidExpirience ?? '';
  bool hasGidExpirience() => _gidExpirience != null;

  // "GidCertificates" field.
  String? _gidCertificates;
  String get gidCertificates => _gidCertificates ?? '';
  bool hasGidCertificates() => _gidCertificates != null;

  // "GidLanguages" field.
  String? _gidLanguages;
  String get gidLanguages => _gidLanguages ?? '';
  bool hasGidLanguages() => _gidLanguages != null;

  // "GidFinishedGroups" field.
  String? _gidFinishedGroups;
  String get gidFinishedGroups => _gidFinishedGroups ?? '';
  bool hasGidFinishedGroups() => _gidFinishedGroups != null;

  // "DOB_day" field.
  String? _dOBDay;
  String get dOBDay => _dOBDay ?? '';
  bool hasDOBDay() => _dOBDay != null;

  // "DOB_month" field.
  String? _dOBMonth;
  String get dOBMonth => _dOBMonth ?? '';
  bool hasDOBMonth() => _dOBMonth != null;

  // "DOB_year" field.
  String? _dOBYear;
  String get dOBYear => _dOBYear ?? '';
  bool hasDOBYear() => _dOBYear != null;

  // "user_payments" field.
  List<DocumentReference>? _userPayments;
  List<DocumentReference> get userPayments => _userPayments ?? const [];
  bool hasUserPayments() => _userPayments != null;

  // "sub_club108" field.
  bool? _subClub108;
  bool get subClub108 => _subClub108 ?? false;
  bool hasSubClub108() => _subClub108 != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _allowNotification = snapshotData['allowNotification'] as bool?;
    _tours = getDataList(snapshotData['Tours']);
    _toursFavorite = getDataList(snapshotData['ToursFavorite']);
    _isAdmin = snapshotData['is_admin'] as bool?;
    _isGid = snapshotData['is_Gid'] as bool?;
    _isTourist = snapshotData['is_Tourist'] as bool?;
    _activeTour = snapshotData['active_Tour'] as DocumentReference?;
    _subStandart = snapshotData['sub_standart'] as bool?;
    _subPremium = snapshotData['sub_premium'] as bool?;
    _vebinars = getDataList(snapshotData['Vebinars']);
    _ivents = getDataList(snapshotData['Ivents']);
    _photos = getDataList(snapshotData['photos']);
    _chats = getDataList(snapshotData['Chats']);
    _male = snapshotData['male'] as bool?;
    _female = snapshotData['female'] as bool?;
    _country = snapshotData['country'] as String?;
    _dateOfBirth = snapshotData['DateOfBirth'] as String?;
    _gidAbout = snapshotData['GidAbout'] as String?;
    _gidExpirience = snapshotData['GidExpirience'] as String?;
    _gidCertificates = snapshotData['GidCertificates'] as String?;
    _gidLanguages = snapshotData['GidLanguages'] as String?;
    _gidFinishedGroups = snapshotData['GidFinishedGroups'] as String?;
    _dOBDay = snapshotData['DOB_day'] as String?;
    _dOBMonth = snapshotData['DOB_month'] as String?;
    _dOBYear = snapshotData['DOB_year'] as String?;
    _userPayments = getDataList(snapshotData['user_payments']);
    _subClub108 = snapshotData['sub_club108'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? allowNotification,
  bool? isAdmin,
  bool? isGid,
  bool? isTourist,
  DocumentReference? activeTour,
  bool? subStandart,
  bool? subPremium,
  bool? male,
  bool? female,
  String? country,
  String? dateOfBirth,
  String? gidAbout,
  String? gidExpirience,
  String? gidCertificates,
  String? gidLanguages,
  String? gidFinishedGroups,
  String? dOBDay,
  String? dOBMonth,
  String? dOBYear,
  bool? subClub108,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'allowNotification': allowNotification,
      'is_admin': isAdmin,
      'is_Gid': isGid,
      'is_Tourist': isTourist,
      'active_Tour': activeTour,
      'sub_standart': subStandart,
      'sub_premium': subPremium,
      'male': male,
      'female': female,
      'country': country,
      'DateOfBirth': dateOfBirth,
      'GidAbout': gidAbout,
      'GidExpirience': gidExpirience,
      'GidCertificates': gidCertificates,
      'GidLanguages': gidLanguages,
      'GidFinishedGroups': gidFinishedGroups,
      'DOB_day': dOBDay,
      'DOB_month': dOBMonth,
      'DOB_year': dOBYear,
      'sub_club108': subClub108,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.allowNotification == e2?.allowNotification &&
        listEquality.equals(e1?.tours, e2?.tours) &&
        listEquality.equals(e1?.toursFavorite, e2?.toursFavorite) &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isGid == e2?.isGid &&
        e1?.isTourist == e2?.isTourist &&
        e1?.activeTour == e2?.activeTour &&
        e1?.subStandart == e2?.subStandart &&
        e1?.subPremium == e2?.subPremium &&
        listEquality.equals(e1?.vebinars, e2?.vebinars) &&
        listEquality.equals(e1?.ivents, e2?.ivents) &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        listEquality.equals(e1?.chats, e2?.chats) &&
        e1?.male == e2?.male &&
        e1?.female == e2?.female &&
        e1?.country == e2?.country &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.gidAbout == e2?.gidAbout &&
        e1?.gidExpirience == e2?.gidExpirience &&
        e1?.gidCertificates == e2?.gidCertificates &&
        e1?.gidLanguages == e2?.gidLanguages &&
        e1?.gidFinishedGroups == e2?.gidFinishedGroups &&
        e1?.dOBDay == e2?.dOBDay &&
        e1?.dOBMonth == e2?.dOBMonth &&
        e1?.dOBYear == e2?.dOBYear &&
        listEquality.equals(e1?.userPayments, e2?.userPayments) &&
        e1?.subClub108 == e2?.subClub108;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.allowNotification,
        e?.tours,
        e?.toursFavorite,
        e?.isAdmin,
        e?.isGid,
        e?.isTourist,
        e?.activeTour,
        e?.subStandart,
        e?.subPremium,
        e?.vebinars,
        e?.ivents,
        e?.photos,
        e?.chats,
        e?.male,
        e?.female,
        e?.country,
        e?.dateOfBirth,
        e?.gidAbout,
        e?.gidExpirience,
        e?.gidCertificates,
        e?.gidLanguages,
        e?.gidFinishedGroups,
        e?.dOBDay,
        e?.dOBMonth,
        e?.dOBYear,
        e?.userPayments,
        e?.subClub108
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
