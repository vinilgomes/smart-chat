// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends FFFirebaseStruct {
  MessageStruct({
    String? id,
    String? type,
    String? status,
    List<ContentStruct>? content,
    String? role,
    List<String>? queries,
    List<String>? results,
    String? arguments,
    String? callId,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _type = type,
        _status = status,
        _content = content,
        _role = role,
        _queries = queries,
        _results = results,
        _arguments = arguments,
        _callId = callId,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "content" field.
  List<ContentStruct>? _content;
  List<ContentStruct> get content => _content ?? const [];
  set content(List<ContentStruct>? val) => _content = val;

  void updateContent(Function(List<ContentStruct>) updateFn) {
    updateFn(_content ??= []);
  }

  bool hasContent() => _content != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "queries" field.
  List<String>? _queries;
  List<String> get queries => _queries ?? const [];
  set queries(List<String>? val) => _queries = val;

  void updateQueries(Function(List<String>) updateFn) {
    updateFn(_queries ??= []);
  }

  bool hasQueries() => _queries != null;

  // "results" field.
  List<String>? _results;
  List<String> get results => _results ?? const [];
  set results(List<String>? val) => _results = val;

  void updateResults(Function(List<String>) updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  // "arguments" field.
  String? _arguments;
  String get arguments => _arguments ?? '';
  set arguments(String? val) => _arguments = val;

  bool hasArguments() => _arguments != null;

  // "call_id" field.
  String? _callId;
  String get callId => _callId ?? '';
  set callId(String? val) => _callId = val;

  bool hasCallId() => _callId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        id: data['id'] as String?,
        type: data['type'] as String?,
        status: data['status'] as String?,
        content: getStructList(
          data['content'],
          ContentStruct.fromMap,
        ),
        role: data['role'] as String?,
        queries: getDataList(data['queries']),
        results: getDataList(data['results']),
        arguments: data['arguments'] as String?,
        callId: data['call_id'] as String?,
        name: data['name'] as String?,
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'type': _type,
        'status': _status,
        'content': _content?.map((e) => e.toMap()).toList(),
        'role': _role,
        'queries': _queries,
        'results': _results,
        'arguments': _arguments,
        'call_id': _callId,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.DataStruct,
          isList: true,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'queries': serializeParam(
          _queries,
          ParamType.String,
          isList: true,
        ),
        'results': serializeParam(
          _results,
          ParamType.String,
          isList: true,
        ),
        'arguments': serializeParam(
          _arguments,
          ParamType.String,
        ),
        'call_id': serializeParam(
          _callId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        content: deserializeStructParam<ContentStruct>(
          data['content'],
          ParamType.DataStruct,
          true,
          structBuilder: ContentStruct.fromSerializableMap,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        queries: deserializeParam<String>(
          data['queries'],
          ParamType.String,
          true,
        ),
        results: deserializeParam<String>(
          data['results'],
          ParamType.String,
          true,
        ),
        arguments: deserializeParam(
          data['arguments'],
          ParamType.String,
          false,
        ),
        callId: deserializeParam(
          data['call_id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MessageStruct &&
        id == other.id &&
        type == other.type &&
        status == other.status &&
        listEquality.equals(content, other.content) &&
        role == other.role &&
        listEquality.equals(queries, other.queries) &&
        listEquality.equals(results, other.results) &&
        arguments == other.arguments &&
        callId == other.callId &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        type,
        status,
        content,
        role,
        queries,
        results,
        arguments,
        callId,
        name
      ]);
}

MessageStruct createMessageStruct({
  String? id,
  String? type,
  String? status,
  String? role,
  String? arguments,
  String? callId,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageStruct(
      id: id,
      type: type,
      status: status,
      role: role,
      arguments: arguments,
      callId: callId,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageStruct? updateMessageStruct(
  MessageStruct? message, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    message
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageStructData(
  Map<String, dynamic> firestoreData,
  MessageStruct? message,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (message == null) {
    return;
  }
  if (message.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && message.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageData = getMessageFirestoreData(message, forFieldValue);
  final nestedData = messageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = message.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageFirestoreData(
  MessageStruct? message, [
  bool forFieldValue = false,
]) {
  if (message == null) {
    return {};
  }
  final firestoreData = mapToFirestore(message.toMap());

  // Add any Firestore field values
  message.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageListFirestoreData(
  List<MessageStruct>? messages,
) =>
    messages?.map((e) => getMessageFirestoreData(e, true)).toList() ?? [];
