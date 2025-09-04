import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "responseId" field.
  String? _responseId;
  String get responseId => _responseId ?? '';
  bool hasResponseId() => _responseId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "imgUrl" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "tokens" field.
  int? _tokens;
  int get tokens => _tokens ?? 0;
  bool hasTokens() => _tokens != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _role = snapshotData['role'] as String?;
    _responseId = snapshotData['responseId'] as String?;
    _text = snapshotData['text'] as String?;
    _imgUrl = snapshotData['imgUrl'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _tokens = castToType<int>(snapshotData['tokens']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('message')
          : FirebaseFirestore.instance.collectionGroup('message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('message').doc(id);

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? userId,
  String? role,
  String? responseId,
  String? text,
  String? imgUrl,
  DateTime? createdAt,
  int? tokens,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'role': role,
      'responseId': responseId,
      'text': text,
      'imgUrl': imgUrl,
      'createdAt': createdAt,
      'tokens': tokens,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.role == e2?.role &&
        e1?.responseId == e2?.responseId &&
        e1?.text == e2?.text &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.createdAt == e2?.createdAt &&
        e1?.tokens == e2?.tokens;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.role,
        e?.responseId,
        e?.text,
        e?.imgUrl,
        e?.createdAt,
        e?.tokens
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
