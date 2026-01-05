import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "payment_time" field.
  DateTime? _paymentTime;
  DateTime? get paymentTime => _paymentTime;
  bool hasPaymentTime() => _paymentTime != null;

  // "payment_user" field.
  DocumentReference? _paymentUser;
  DocumentReference? get paymentUser => _paymentUser;
  bool hasPaymentUser() => _paymentUser != null;

  // "payment_price" field.
  double? _paymentPrice;
  double get paymentPrice => _paymentPrice ?? 0.0;
  bool hasPaymentPrice() => _paymentPrice != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  void _initializeFields() {
    _paymentTime = snapshotData['payment_time'] as DateTime?;
    _paymentUser = snapshotData['payment_user'] as DocumentReference?;
    _paymentPrice = castToType<double>(snapshotData['payment_price']);
    _paymentType = snapshotData['payment_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  DateTime? paymentTime,
  DocumentReference? paymentUser,
  double? paymentPrice,
  String? paymentType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'payment_time': paymentTime,
      'payment_user': paymentUser,
      'payment_price': paymentPrice,
      'payment_type': paymentType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.paymentTime == e2?.paymentTime &&
        e1?.paymentUser == e2?.paymentUser &&
        e1?.paymentPrice == e2?.paymentPrice &&
        e1?.paymentType == e2?.paymentType;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality()
      .hash([e?.paymentTime, e?.paymentUser, e?.paymentPrice, e?.paymentType]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
