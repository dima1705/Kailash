import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cm_user" field.
  DocumentReference? _cmUser;
  DocumentReference? get cmUser => _cmUser;
  bool hasCmUser() => _cmUser != null;

  // "cm_chat" field.
  DocumentReference? _cmChat;
  DocumentReference? get cmChat => _cmChat;
  bool hasCmChat() => _cmChat != null;

  // "cm_message" field.
  String? _cmMessage;
  String get cmMessage => _cmMessage ?? '';
  bool hasCmMessage() => _cmMessage != null;

  // "cm_message_sent" field.
  DateTime? _cmMessageSent;
  DateTime? get cmMessageSent => _cmMessageSent;
  bool hasCmMessageSent() => _cmMessageSent != null;

  // "cm_image" field.
  String? _cmImage;
  String get cmImage => _cmImage ?? '';
  bool hasCmImage() => _cmImage != null;

  void _initializeFields() {
    _cmUser = snapshotData['cm_user'] as DocumentReference?;
    _cmChat = snapshotData['cm_chat'] as DocumentReference?;
    _cmMessage = snapshotData['cm_message'] as String?;
    _cmMessageSent = snapshotData['cm_message_sent'] as DateTime?;
    _cmImage = snapshotData['cm_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chat_messages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  DocumentReference? cmUser,
  DocumentReference? cmChat,
  String? cmMessage,
  DateTime? cmMessageSent,
  String? cmImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cm_user': cmUser,
      'cm_chat': cmChat,
      'cm_message': cmMessage,
      'cm_message_sent': cmMessageSent,
      'cm_image': cmImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.cmUser == e2?.cmUser &&
        e1?.cmChat == e2?.cmChat &&
        e1?.cmMessage == e2?.cmMessage &&
        e1?.cmMessageSent == e2?.cmMessageSent &&
        e1?.cmImage == e2?.cmImage;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality()
      .hash([e?.cmUser, e?.cmChat, e?.cmMessage, e?.cmMessageSent, e?.cmImage]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
