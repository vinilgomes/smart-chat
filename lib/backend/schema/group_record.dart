import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupRecord extends FirestoreRecord {
  GroupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "vector_store_id" field.
  String? _vectorStoreId;
  String get vectorStoreId => _vectorStoreId ?? '';
  bool hasVectorStoreId() => _vectorStoreId != null;

  // "system_prompt" field.
  String? _systemPrompt;
  String get systemPrompt => _systemPrompt ?? '';
  bool hasSystemPrompt() => _systemPrompt != null;

  // "chat_instructions" field.
  String? _chatInstructions;
  String get chatInstructions => _chatInstructions ?? '';
  bool hasChatInstructions() => _chatInstructions != null;

  // "chat_welcome_message" field.
  String? _chatWelcomeMessage;
  String get chatWelcomeMessage => _chatWelcomeMessage ?? '';
  bool hasChatWelcomeMessage() => _chatWelcomeMessage != null;

  // "group_description" field.
  String? _groupDescription;
  String get groupDescription => _groupDescription ?? '';
  bool hasGroupDescription() => _groupDescription != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _groupName = snapshotData['group_name'] as String?;
    _vectorStoreId = snapshotData['vector_store_id'] as String?;
    _systemPrompt = snapshotData['system_prompt'] as String?;
    _chatInstructions = snapshotData['chat_instructions'] as String?;
    _chatWelcomeMessage = snapshotData['chat_welcome_message'] as String?;
    _groupDescription = snapshotData['group_description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('group')
          : FirebaseFirestore.instance.collectionGroup('group');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('group').doc(id);

  static Stream<GroupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupRecord.fromSnapshot(s));

  static Future<GroupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupRecord.fromSnapshot(s));

  static GroupRecord fromSnapshot(DocumentSnapshot snapshot) => GroupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupRecordData({
  String? groupName,
  String? vectorStoreId,
  String? systemPrompt,
  String? chatInstructions,
  String? chatWelcomeMessage,
  String? groupDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group_name': groupName,
      'vector_store_id': vectorStoreId,
      'system_prompt': systemPrompt,
      'chat_instructions': chatInstructions,
      'chat_welcome_message': chatWelcomeMessage,
      'group_description': groupDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupRecordDocumentEquality implements Equality<GroupRecord> {
  const GroupRecordDocumentEquality();

  @override
  bool equals(GroupRecord? e1, GroupRecord? e2) {
    return e1?.groupName == e2?.groupName &&
        e1?.vectorStoreId == e2?.vectorStoreId &&
        e1?.systemPrompt == e2?.systemPrompt &&
        e1?.chatInstructions == e2?.chatInstructions &&
        e1?.chatWelcomeMessage == e2?.chatWelcomeMessage &&
        e1?.groupDescription == e2?.groupDescription;
  }

  @override
  int hash(GroupRecord? e) => const ListEquality().hash([
        e?.groupName,
        e?.vectorStoreId,
        e?.systemPrompt,
        e?.chatInstructions,
        e?.chatWelcomeMessage,
        e?.groupDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupRecord;
}
