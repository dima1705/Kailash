import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_name" field.
  String? _chatName;
  String get chatName => _chatName ?? '';
  bool hasChatName() => _chatName != null;

  // "chat_users" field.
  List<DocumentReference>? _chatUsers;
  List<DocumentReference> get chatUsers => _chatUsers ?? const [];
  bool hasChatUsers() => _chatUsers != null;

  // "chat_creator" field.
  DocumentReference? _chatCreator;
  DocumentReference? get chatCreator => _chatCreator;
  bool hasChatCreator() => _chatCreator != null;

  // "chat_created_at" field.
  DateTime? _chatCreatedAt;
  DateTime? get chatCreatedAt => _chatCreatedAt;
  bool hasChatCreatedAt() => _chatCreatedAt != null;

  // "chat_last_message" field.
  String? _chatLastMessage;
  String get chatLastMessage => _chatLastMessage ?? '';
  bool hasChatLastMessage() => _chatLastMessage != null;

  // "chat_last_message_time" field.
  DateTime? _chatLastMessageTime;
  DateTime? get chatLastMessageTime => _chatLastMessageTime;
  bool hasChatLastMessageTime() => _chatLastMessageTime != null;

  // "chat_last_message_sent" field.
  DocumentReference? _chatLastMessageSent;
  DocumentReference? get chatLastMessageSent => _chatLastMessageSent;
  bool hasChatLastMessageSent() => _chatLastMessageSent != null;

  // "chat_image" field.
  String? _chatImage;
  String get chatImage => _chatImage ?? '';
  bool hasChatImage() => _chatImage != null;

  // "chat_tour" field.
  DocumentReference? _chatTour;
  DocumentReference? get chatTour => _chatTour;
  bool hasChatTour() => _chatTour != null;

  void _initializeFields() {
    _chatName = snapshotData['chat_name'] as String?;
    _chatUsers = getDataList(snapshotData['chat_users']);
    _chatCreator = snapshotData['chat_creator'] as DocumentReference?;
    _chatCreatedAt = snapshotData['chat_created_at'] as DateTime?;
    _chatLastMessage = snapshotData['chat_last_message'] as String?;
    _chatLastMessageTime = snapshotData['chat_last_message_time'] as DateTime?;
    _chatLastMessageSent =
        snapshotData['chat_last_message_sent'] as DocumentReference?;
    _chatImage = snapshotData['chat_image'] as String?;
    _chatTour = snapshotData['chat_tour'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? chatName,
  DocumentReference? chatCreator,
  DateTime? chatCreatedAt,
  String? chatLastMessage,
  DateTime? chatLastMessageTime,
  DocumentReference? chatLastMessageSent,
  String? chatImage,
  DocumentReference? chatTour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_name': chatName,
      'chat_creator': chatCreator,
      'chat_created_at': chatCreatedAt,
      'chat_last_message': chatLastMessage,
      'chat_last_message_time': chatLastMessageTime,
      'chat_last_message_sent': chatLastMessageSent,
      'chat_image': chatImage,
      'chat_tour': chatTour,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chatName == e2?.chatName &&
        listEquality.equals(e1?.chatUsers, e2?.chatUsers) &&
        e1?.chatCreator == e2?.chatCreator &&
        e1?.chatCreatedAt == e2?.chatCreatedAt &&
        e1?.chatLastMessage == e2?.chatLastMessage &&
        e1?.chatLastMessageTime == e2?.chatLastMessageTime &&
        e1?.chatLastMessageSent == e2?.chatLastMessageSent &&
        e1?.chatImage == e2?.chatImage &&
        e1?.chatTour == e2?.chatTour;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.chatName,
        e?.chatUsers,
        e?.chatCreator,
        e?.chatCreatedAt,
        e?.chatLastMessage,
        e?.chatLastMessageTime,
        e?.chatLastMessageSent,
        e?.chatImage,
        e?.chatTour
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
