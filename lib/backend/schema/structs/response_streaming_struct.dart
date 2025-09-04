// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseStreamingStruct extends FFFirebaseStruct {
  ResponseStreamingStruct({
    String? type,
    ResponseV2Struct? response,
    UsageStruct? usage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _response = response,
        _usage = usage,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "response" field.
  ResponseV2Struct? _response;
  ResponseV2Struct get response => _response ?? ResponseV2Struct();
  set response(ResponseV2Struct? val) => _response = val;

  void updateResponse(Function(ResponseV2Struct) updateFn) {
    updateFn(_response ??= ResponseV2Struct());
  }

  bool hasResponse() => _response != null;

  // "usage" field.
  UsageStruct? _usage;
  UsageStruct get usage => _usage ?? UsageStruct();
  set usage(UsageStruct? val) => _usage = val;

  void updateUsage(Function(UsageStruct) updateFn) {
    updateFn(_usage ??= UsageStruct());
  }

  bool hasUsage() => _usage != null;

  static ResponseStreamingStruct fromMap(Map<String, dynamic> data) =>
      ResponseStreamingStruct(
        type: data['type'] as String?,
        response: data['response'] is ResponseV2Struct
            ? data['response']
            : ResponseV2Struct.maybeFromMap(data['response']),
        usage: data['usage'] is UsageStruct
            ? data['usage']
            : UsageStruct.maybeFromMap(data['usage']),
      );

  static ResponseStreamingStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponseStreamingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'response': _response?.toMap(),
        'usage': _usage?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'response': serializeParam(
          _response,
          ParamType.DataStruct,
        ),
        'usage': serializeParam(
          _usage,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ResponseStreamingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ResponseStreamingStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        response: deserializeStructParam(
          data['response'],
          ParamType.DataStruct,
          false,
          structBuilder: ResponseV2Struct.fromSerializableMap,
        ),
        usage: deserializeStructParam(
          data['usage'],
          ParamType.DataStruct,
          false,
          structBuilder: UsageStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResponseStreamingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponseStreamingStruct &&
        type == other.type &&
        response == other.response &&
        usage == other.usage;
  }

  @override
  int get hashCode => const ListEquality().hash([type, response, usage]);
}

ResponseStreamingStruct createResponseStreamingStruct({
  String? type,
  ResponseV2Struct? response,
  UsageStruct? usage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseStreamingStruct(
      type: type,
      response: response ?? (clearUnsetFields ? ResponseV2Struct() : null),
      usage: usage ?? (clearUnsetFields ? UsageStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseStreamingStruct? updateResponseStreamingStruct(
  ResponseStreamingStruct? responseStreaming, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseStreaming
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseStreamingStructData(
  Map<String, dynamic> firestoreData,
  ResponseStreamingStruct? responseStreaming,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseStreaming == null) {
    return;
  }
  if (responseStreaming.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responseStreaming.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseStreamingData =
      getResponseStreamingFirestoreData(responseStreaming, forFieldValue);
  final nestedData =
      responseStreamingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responseStreaming.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseStreamingFirestoreData(
  ResponseStreamingStruct? responseStreaming, [
  bool forFieldValue = false,
]) {
  if (responseStreaming == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseStreaming.toMap());

  // Handle nested data for "response" field.
  addResponseV2StructData(
    firestoreData,
    responseStreaming.hasResponse() ? responseStreaming.response : null,
    'response',
    forFieldValue,
  );

  // Handle nested data for "usage" field.
  addUsageStructData(
    firestoreData,
    responseStreaming.hasUsage() ? responseStreaming.usage : null,
    'usage',
    forFieldValue,
  );

  // Add any Firestore field values
  responseStreaming.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseStreamingListFirestoreData(
  List<ResponseStreamingStruct>? responseStreamings,
) =>
    responseStreamings
        ?.map((e) => getResponseStreamingFirestoreData(e, true))
        .toList() ??
    [];
