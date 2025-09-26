// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseV2Struct extends FFFirebaseStruct {
  ResponseV2Struct({
    String? id,
    String? status,
    String? error,
    List<MessageStruct>? output,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _status = status,
        _error = error,
        _output = output,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;

  bool hasError() => _error != null;

  // "output" field.
  List<MessageStruct>? _output;
  List<MessageStruct> get output => _output ?? const [];
  set output(List<MessageStruct>? val) => _output = val;

  void updateOutput(Function(List<MessageStruct>) updateFn) {
    updateFn(_output ??= []);
  }

  bool hasOutput() => _output != null;

  static ResponseV2Struct fromMap(Map<String, dynamic> data) =>
      ResponseV2Struct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        error: data['error'] as String?,
        output: getStructList(
          data['output'],
          MessageStruct.fromMap,
        ),
      );

  static ResponseV2Struct? maybeFromMap(dynamic data) => data is Map
      ? ResponseV2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'error': _error,
        'output': _output?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
        'output': serializeParam(
          _output,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ResponseV2Struct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseV2Struct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
        output: deserializeStructParam<MessageStruct>(
          data['output'],
          ParamType.DataStruct,
          true,
          structBuilder: MessageStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResponseV2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseV2Struct &&
        id == other.id &&
        status == other.status &&
        error == other.error &&
        listEquality.equals(output, other.output);
  }

  @override
  int get hashCode => const ListEquality().hash([id, status, error, output]);
}

ResponseV2Struct createResponseV2Struct({
  String? id,
  String? status,
  String? error,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseV2Struct(
      id: id,
      status: status,
      error: error,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseV2Struct? updateResponseV2Struct(
  ResponseV2Struct? responseV2, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseV2
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseV2StructData(
  Map<String, dynamic> firestoreData,
  ResponseV2Struct? responseV2,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseV2 == null) {
    return;
  }
  if (responseV2.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responseV2.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseV2Data = getResponseV2FirestoreData(responseV2, forFieldValue);
  final nestedData = responseV2Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responseV2.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseV2FirestoreData(
  ResponseV2Struct? responseV2, [
  bool forFieldValue = false,
]) {
  if (responseV2 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseV2.toMap());

  // Add any Firestore field values
  responseV2.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseV2ListFirestoreData(
  List<ResponseV2Struct>? responseV2s,
) =>
    responseV2s?.map((e) => getResponseV2FirestoreData(e, true)).toList() ?? [];
