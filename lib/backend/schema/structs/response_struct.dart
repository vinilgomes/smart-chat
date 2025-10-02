// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseStruct extends FFFirebaseStruct {
  ResponseStruct({
    String? responseId,
    String? status,
    ErrorStruct? error,
    List<MessageStruct>? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _responseId = responseId,
        _status = status,
        _error = error,
        _message = message,
        super(firestoreUtilData);

  // "response_id" field.
  String? _responseId;
  String get responseId => _responseId ?? '';
  set responseId(String? val) => _responseId = val;

  bool hasResponseId() => _responseId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "error" field.
  ErrorStruct? _error;
  ErrorStruct get error => _error ?? ErrorStruct();
  set error(ErrorStruct? val) => _error = val;

  void updateError(Function(ErrorStruct) updateFn) {
    updateFn(_error ??= ErrorStruct());
  }

  bool hasError() => _error != null;

  // "message" field.
  List<MessageStruct>? _message;
  List<MessageStruct> get message => _message ?? const [];
  set message(List<MessageStruct>? val) => _message = val;

  void updateMessage(Function(List<MessageStruct>) updateFn) {
    updateFn(_message ??= []);
  }

  bool hasMessage() => _message != null;

  static ResponseStruct fromMap(Map<String, dynamic> data) => ResponseStruct(
        responseId: data['response_id'] as String?,
        status: data['status'] as String?,
        error: data['error'] is ErrorStruct
            ? data['error']
            : ErrorStruct.maybeFromMap(data['error']),
        message: getStructList(
          data['message'],
          MessageStruct.fromMap,
        ),
      );

  static ResponseStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResponseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'response_id': _responseId,
        'status': _status,
        'error': _error?.toMap(),
        'message': _message?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'response_id': serializeParam(
          _responseId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.DataStruct,
        ),
        'message': serializeParam(
          _message,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseStruct(
        responseId: deserializeParam(
          data['response_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        error: deserializeStructParam(
          data['error'],
          ParamType.DataStruct,
          false,
          structBuilder: ErrorStruct.fromSerializableMap,
        ),
        message: deserializeStructParam<MessageStruct>(
          data['message'],
          ParamType.DataStruct,
          true,
          structBuilder: MessageStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseStruct &&
        responseId == other.responseId &&
        status == other.status &&
        error == other.error &&
        listEquality.equals(message, other.message);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([responseId, status, error, message]);
}

ResponseStruct createResponseStruct({
  String? responseId,
  String? status,
  ErrorStruct? error,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseStruct(
      responseId: responseId,
      status: status,
      error: error ?? (clearUnsetFields ? ErrorStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseStruct? updateResponseStruct(
  ResponseStruct? response, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    response
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseStructData(
  Map<String, dynamic> firestoreData,
  ResponseStruct? response,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (response == null) {
    return;
  }
  if (response.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && response.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseData = getResponseFirestoreData(response, forFieldValue);
  final nestedData = responseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = response.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseFirestoreData(
  ResponseStruct? response, [
  bool forFieldValue = false,
]) {
  if (response == null) {
    return {};
  }
  final firestoreData = mapToFirestore(response.toMap());

  // Handle nested data for "error" field.
  addErrorStructData(
    firestoreData,
    response.hasError() ? response.error : null,
    'error',
    forFieldValue,
  );

  // Add any Firestore field values
  response.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseListFirestoreData(
  List<ResponseStruct>? responses,
) =>
    responses?.map((e) => getResponseFirestoreData(e, true)).toList() ?? [];
