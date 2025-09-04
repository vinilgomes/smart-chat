import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptRecord extends FirestoreRecord {
  PromptRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prompt_name" field.
  String? _promptName;
  String get promptName => _promptName ?? '';
  bool hasPromptName() => _promptName != null;

  // "prompt_description" field.
  String? _promptDescription;
  String get promptDescription => _promptDescription ?? '';
  bool hasPromptDescription() => _promptDescription != null;

  // "system_prompt" field.
  String? _systemPrompt;
  String get systemPrompt => _systemPrompt ?? '';
  bool hasSystemPrompt() => _systemPrompt != null;

  // "instructions" field.
  String? _instructions;
  String get instructions => _instructions ?? '';
  bool hasInstructions() => _instructions != null;

  // "chat_welcome_message" field.
  String? _chatWelcomeMessage;
  String get chatWelcomeMessage => _chatWelcomeMessage ?? '';
  bool hasChatWelcomeMessage() => _chatWelcomeMessage != null;

  // "vector_store_id" field.
  String? _vectorStoreId;
  String get vectorStoreId => _vectorStoreId ?? '';
  bool hasVectorStoreId() => _vectorStoreId != null;

  // "promptId" field.
  String? _promptId;
  String get promptId => _promptId ?? '';
  bool hasPromptId() => _promptId != null;

  // "instanceId" field.
  DocumentReference? _instanceId;
  DocumentReference? get instanceId => _instanceId;
  bool hasInstanceId() => _instanceId != null;

  // "groupId" field.
  DocumentReference? _groupId;
  DocumentReference? get groupId => _groupId;
  bool hasGroupId() => _groupId != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "visibility" field.
  String? _visibility;
  String get visibility => _visibility ?? '';
  bool hasVisibility() => _visibility != null;

  // "web_search" field.
  bool? _webSearch;
  bool get webSearch => _webSearch ?? false;
  bool hasWebSearch() => _webSearch != null;

  // "functions" field.
  List<DocumentReference>? _functions;
  List<DocumentReference> get functions => _functions ?? const [];
  bool hasFunctions() => _functions != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "top_p" field.
  double? _topP;
  double get topP => _topP ?? 0.0;
  bool hasTopP() => _topP != null;

  // "is_published" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  void _initializeFields() {
    _promptName = snapshotData['prompt_name'] as String?;
    _promptDescription = snapshotData['prompt_description'] as String?;
    _systemPrompt = snapshotData['system_prompt'] as String?;
    _instructions = snapshotData['instructions'] as String?;
    _chatWelcomeMessage = snapshotData['chat_welcome_message'] as String?;
    _vectorStoreId = snapshotData['vector_store_id'] as String?;
    _promptId = snapshotData['promptId'] as String?;
    _instanceId = snapshotData['instanceId'] as DocumentReference?;
    _groupId = snapshotData['groupId'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _visibility = snapshotData['visibility'] as String?;
    _webSearch = snapshotData['web_search'] as bool?;
    _functions = getDataList(snapshotData['functions']);
    _temperature = castToType<double>(snapshotData['temperature']);
    _topP = castToType<double>(snapshotData['top_p']);
    _isPublished = snapshotData['is_published'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prompt');

  static Stream<PromptRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromptRecord.fromSnapshot(s));

  static Future<PromptRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromptRecord.fromSnapshot(s));

  static PromptRecord fromSnapshot(DocumentSnapshot snapshot) => PromptRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromptRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromptRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromptRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromptRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromptRecordData({
  String? promptName,
  String? promptDescription,
  String? systemPrompt,
  String? instructions,
  String? chatWelcomeMessage,
  String? vectorStoreId,
  String? promptId,
  DocumentReference? instanceId,
  DocumentReference? groupId,
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? visibility,
  bool? webSearch,
  double? temperature,
  double? topP,
  bool? isPublished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prompt_name': promptName,
      'prompt_description': promptDescription,
      'system_prompt': systemPrompt,
      'instructions': instructions,
      'chat_welcome_message': chatWelcomeMessage,
      'vector_store_id': vectorStoreId,
      'promptId': promptId,
      'instanceId': instanceId,
      'groupId': groupId,
      'created_by': createdBy,
      'created_at': createdAt,
      'visibility': visibility,
      'web_search': webSearch,
      'temperature': temperature,
      'top_p': topP,
      'is_published': isPublished,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromptRecordDocumentEquality implements Equality<PromptRecord> {
  const PromptRecordDocumentEquality();

  @override
  bool equals(PromptRecord? e1, PromptRecord? e2) {
    const listEquality = ListEquality();
    return e1?.promptName == e2?.promptName &&
        e1?.promptDescription == e2?.promptDescription &&
        e1?.systemPrompt == e2?.systemPrompt &&
        e1?.instructions == e2?.instructions &&
        e1?.chatWelcomeMessage == e2?.chatWelcomeMessage &&
        e1?.vectorStoreId == e2?.vectorStoreId &&
        e1?.promptId == e2?.promptId &&
        e1?.instanceId == e2?.instanceId &&
        e1?.groupId == e2?.groupId &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.visibility == e2?.visibility &&
        e1?.webSearch == e2?.webSearch &&
        listEquality.equals(e1?.functions, e2?.functions) &&
        e1?.temperature == e2?.temperature &&
        e1?.topP == e2?.topP &&
        e1?.isPublished == e2?.isPublished;
  }

  @override
  int hash(PromptRecord? e) => const ListEquality().hash([
        e?.promptName,
        e?.promptDescription,
        e?.systemPrompt,
        e?.instructions,
        e?.chatWelcomeMessage,
        e?.vectorStoreId,
        e?.promptId,
        e?.instanceId,
        e?.groupId,
        e?.createdBy,
        e?.createdAt,
        e?.visibility,
        e?.webSearch,
        e?.functions,
        e?.temperature,
        e?.topP,
        e?.isPublished
      ]);

  @override
  bool isValidKey(Object? o) => o is PromptRecord;
}
