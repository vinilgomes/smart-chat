import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationRecord extends FirestoreRecord {
  ConversationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "lastMessageAt" field.
  DateTime? _lastMessageAt;
  DateTime? get lastMessageAt => _lastMessageAt;
  bool hasLastMessageAt() => _lastMessageAt != null;

  // "instanceId" field.
  DocumentReference? _instanceId;
  DocumentReference? get instanceId => _instanceId;
  bool hasInstanceId() => _instanceId != null;

  // "promptId" field.
  DocumentReference? _promptId;
  DocumentReference? get promptId => _promptId;
  bool hasPromptId() => _promptId != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _lastMessageAt = snapshotData['lastMessageAt'] as DateTime?;
    _instanceId = snapshotData['instanceId'] as DocumentReference?;
    _promptId = snapshotData['promptId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversation');

  static Stream<ConversationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationRecord.fromSnapshot(s));

  static Future<ConversationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversationRecord.fromSnapshot(s));

  static ConversationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConversationRecordData({
  DocumentReference? user,
  DateTime? createdAt,
  DateTime? lastMessageAt,
  DocumentReference? instanceId,
  DocumentReference? promptId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'createdAt': createdAt,
      'lastMessageAt': lastMessageAt,
      'instanceId': instanceId,
      'promptId': promptId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversationRecordDocumentEquality
    implements Equality<ConversationRecord> {
  const ConversationRecordDocumentEquality();

  @override
  bool equals(ConversationRecord? e1, ConversationRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.createdAt == e2?.createdAt &&
        e1?.lastMessageAt == e2?.lastMessageAt &&
        e1?.instanceId == e2?.instanceId &&
        e1?.promptId == e2?.promptId;
  }

  @override
  int hash(ConversationRecord? e) => const ListEquality().hash(
      [e?.user, e?.createdAt, e?.lastMessageAt, e?.instanceId, e?.promptId]);

  @override
  bool isValidKey(Object? o) => o is ConversationRecord;
}
