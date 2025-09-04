import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParamsRecord extends FirestoreRecord {
  ParamsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "instance_name" field.
  String? _instanceName;
  String get instanceName => _instanceName ?? '';
  bool hasInstanceName() => _instanceName != null;

  // "instance_photo" field.
  String? _instancePhoto;
  String get instancePhoto => _instancePhoto ?? '';
  bool hasInstancePhoto() => _instancePhoto != null;

  // "instance_persona" field.
  String? _instancePersona;
  String get instancePersona => _instancePersona ?? '';
  bool hasInstancePersona() => _instancePersona != null;

  // "openai_key" field.
  String? _openaiKey;
  String get openaiKey => _openaiKey ?? '';
  bool hasOpenaiKey() => _openaiKey != null;

  // "vector_store_files" field.
  List<String>? _vectorStoreFiles;
  List<String> get vectorStoreFiles => _vectorStoreFiles ?? const [];
  bool hasVectorStoreFiles() => _vectorStoreFiles != null;

  // "primary_color" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  bool hasPrimaryColor() => _primaryColor != null;

  // "secondary_color" field.
  Color? _secondaryColor;
  Color? get secondaryColor => _secondaryColor;
  bool hasSecondaryColor() => _secondaryColor != null;

  // "chat_instructions" field.
  String? _chatInstructions;
  String get chatInstructions => _chatInstructions ?? '';
  bool hasChatInstructions() => _chatInstructions != null;

  // "vector_store_id" field.
  String? _vectorStoreId;
  String get vectorStoreId => _vectorStoreId ?? '';
  bool hasVectorStoreId() => _vectorStoreId != null;

  // "chat_welcome_message" field.
  String? _chatWelcomeMessage;
  String get chatWelcomeMessage => _chatWelcomeMessage ?? '';
  bool hasChatWelcomeMessage() => _chatWelcomeMessage != null;

  // "system_prompt" field.
  String? _systemPrompt;
  String get systemPrompt => _systemPrompt ?? '';
  bool hasSystemPrompt() => _systemPrompt != null;

  // "assistant_name" field.
  String? _assistantName;
  String get assistantName => _assistantName ?? '';
  bool hasAssistantName() => _assistantName != null;

  // "instance_id" field.
  String? _instanceId;
  String get instanceId => _instanceId ?? '';
  bool hasInstanceId() => _instanceId != null;

  // "instance_type" field.
  String? _instanceType;
  String get instanceType => _instanceType ?? '';
  bool hasInstanceType() => _instanceType != null;

  // "instance_description" field.
  String? _instanceDescription;
  String get instanceDescription => _instanceDescription ?? '';
  bool hasInstanceDescription() => _instanceDescription != null;

  // "web_search" field.
  bool? _webSearch;
  bool get webSearch => _webSearch ?? false;
  bool hasWebSearch() => _webSearch != null;

  void _initializeFields() {
    _instanceName = snapshotData['instance_name'] as String?;
    _instancePhoto = snapshotData['instance_photo'] as String?;
    _instancePersona = snapshotData['instance_persona'] as String?;
    _openaiKey = snapshotData['openai_key'] as String?;
    _vectorStoreFiles = getDataList(snapshotData['vector_store_files']);
    _primaryColor = getSchemaColor(snapshotData['primary_color']);
    _secondaryColor = getSchemaColor(snapshotData['secondary_color']);
    _chatInstructions = snapshotData['chat_instructions'] as String?;
    _vectorStoreId = snapshotData['vector_store_id'] as String?;
    _chatWelcomeMessage = snapshotData['chat_welcome_message'] as String?;
    _systemPrompt = snapshotData['system_prompt'] as String?;
    _assistantName = snapshotData['assistant_name'] as String?;
    _instanceId = snapshotData['instance_id'] as String?;
    _instanceType = snapshotData['instance_type'] as String?;
    _instanceDescription = snapshotData['instance_description'] as String?;
    _webSearch = snapshotData['web_search'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('params');

  static Stream<ParamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParamsRecord.fromSnapshot(s));

  static Future<ParamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParamsRecord.fromSnapshot(s));

  static ParamsRecord fromSnapshot(DocumentSnapshot snapshot) => ParamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParamsRecordData({
  String? instanceName,
  String? instancePhoto,
  String? instancePersona,
  String? openaiKey,
  Color? primaryColor,
  Color? secondaryColor,
  String? chatInstructions,
  String? vectorStoreId,
  String? chatWelcomeMessage,
  String? systemPrompt,
  String? assistantName,
  String? instanceId,
  String? instanceType,
  String? instanceDescription,
  bool? webSearch,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'instance_name': instanceName,
      'instance_photo': instancePhoto,
      'instance_persona': instancePersona,
      'openai_key': openaiKey,
      'primary_color': primaryColor,
      'secondary_color': secondaryColor,
      'chat_instructions': chatInstructions,
      'vector_store_id': vectorStoreId,
      'chat_welcome_message': chatWelcomeMessage,
      'system_prompt': systemPrompt,
      'assistant_name': assistantName,
      'instance_id': instanceId,
      'instance_type': instanceType,
      'instance_description': instanceDescription,
      'web_search': webSearch,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParamsRecordDocumentEquality implements Equality<ParamsRecord> {
  const ParamsRecordDocumentEquality();

  @override
  bool equals(ParamsRecord? e1, ParamsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.instanceName == e2?.instanceName &&
        e1?.instancePhoto == e2?.instancePhoto &&
        e1?.instancePersona == e2?.instancePersona &&
        e1?.openaiKey == e2?.openaiKey &&
        listEquality.equals(e1?.vectorStoreFiles, e2?.vectorStoreFiles) &&
        e1?.primaryColor == e2?.primaryColor &&
        e1?.secondaryColor == e2?.secondaryColor &&
        e1?.chatInstructions == e2?.chatInstructions &&
        e1?.vectorStoreId == e2?.vectorStoreId &&
        e1?.chatWelcomeMessage == e2?.chatWelcomeMessage &&
        e1?.systemPrompt == e2?.systemPrompt &&
        e1?.assistantName == e2?.assistantName &&
        e1?.instanceId == e2?.instanceId &&
        e1?.instanceType == e2?.instanceType &&
        e1?.instanceDescription == e2?.instanceDescription &&
        e1?.webSearch == e2?.webSearch;
  }

  @override
  int hash(ParamsRecord? e) => const ListEquality().hash([
        e?.instanceName,
        e?.instancePhoto,
        e?.instancePersona,
        e?.openaiKey,
        e?.vectorStoreFiles,
        e?.primaryColor,
        e?.secondaryColor,
        e?.chatInstructions,
        e?.vectorStoreId,
        e?.chatWelcomeMessage,
        e?.systemPrompt,
        e?.assistantName,
        e?.instanceId,
        e?.instanceType,
        e?.instanceDescription,
        e?.webSearch
      ]);

  @override
  bool isValidKey(Object? o) => o is ParamsRecord;
}
