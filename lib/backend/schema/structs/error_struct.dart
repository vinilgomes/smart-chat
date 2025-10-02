// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ErrorStruct extends FFFirebaseStruct {
  ErrorStruct({
    String? code,
    String? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _message = message,
        super(firestoreUtilData);

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static ErrorStruct fromMap(Map<String, dynamic> data) => ErrorStruct(
        code: data['code'] as String?,
        message: data['message'] as String?,
      );

  static ErrorStruct? maybeFromMap(dynamic data) =>
      data is Map ? ErrorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static ErrorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErrorStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ErrorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErrorStruct &&
        code == other.code &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([code, message]);
}

ErrorStruct createErrorStruct({
  String? code,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ErrorStruct(
      code: code,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ErrorStruct? updateErrorStruct(
  ErrorStruct? error, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    error
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addErrorStructData(
  Map<String, dynamic> firestoreData,
  ErrorStruct? error,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (error == null) {
    return;
  }
  if (error.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && error.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final errorData = getErrorFirestoreData(error, forFieldValue);
  final nestedData = errorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = error.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getErrorFirestoreData(
  ErrorStruct? error, [
  bool forFieldValue = false,
]) {
  if (error == null) {
    return {};
  }
  final firestoreData = mapToFirestore(error.toMap());

  // Add any Firestore field values
  error.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getErrorListFirestoreData(
  List<ErrorStruct>? errors,
) =>
    errors?.map((e) => getErrorFirestoreData(e, true)).toList() ?? [];
