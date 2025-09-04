// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InputFileStruct extends FFFirebaseStruct {
  InputFileStruct({
    String? type,
    String? fileUrl,
    String? fileData,
    String? fileId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _fileUrl = fileUrl,
        _fileData = fileData,
        _fileId = fileId,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "file_url" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  set fileUrl(String? val) => _fileUrl = val;

  bool hasFileUrl() => _fileUrl != null;

  // "file_data" field.
  String? _fileData;
  String get fileData => _fileData ?? '';
  set fileData(String? val) => _fileData = val;

  bool hasFileData() => _fileData != null;

  // "file_id" field.
  String? _fileId;
  String get fileId => _fileId ?? '';
  set fileId(String? val) => _fileId = val;

  bool hasFileId() => _fileId != null;

  static InputFileStruct fromMap(Map<String, dynamic> data) => InputFileStruct(
        type: data['type'] as String?,
        fileUrl: data['file_url'] as String?,
        fileData: data['file_data'] as String?,
        fileId: data['file_id'] as String?,
      );

  static InputFileStruct? maybeFromMap(dynamic data) => data is Map
      ? InputFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'file_url': _fileUrl,
        'file_data': _fileData,
        'file_id': _fileId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'file_url': serializeParam(
          _fileUrl,
          ParamType.String,
        ),
        'file_data': serializeParam(
          _fileData,
          ParamType.String,
        ),
        'file_id': serializeParam(
          _fileId,
          ParamType.String,
        ),
      }.withoutNulls;

  static InputFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      InputFileStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        fileUrl: deserializeParam(
          data['file_url'],
          ParamType.String,
          false,
        ),
        fileData: deserializeParam(
          data['file_data'],
          ParamType.String,
          false,
        ),
        fileId: deserializeParam(
          data['file_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InputFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InputFileStruct &&
        type == other.type &&
        fileUrl == other.fileUrl &&
        fileData == other.fileData &&
        fileId == other.fileId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, fileUrl, fileData, fileId]);
}

InputFileStruct createInputFileStruct({
  String? type,
  String? fileUrl,
  String? fileData,
  String? fileId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InputFileStruct(
      type: type,
      fileUrl: fileUrl,
      fileData: fileData,
      fileId: fileId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InputFileStruct? updateInputFileStruct(
  InputFileStruct? inputFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inputFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInputFileStructData(
  Map<String, dynamic> firestoreData,
  InputFileStruct? inputFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inputFile == null) {
    return;
  }
  if (inputFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && inputFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inputFileData = getInputFileFirestoreData(inputFile, forFieldValue);
  final nestedData = inputFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = inputFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInputFileFirestoreData(
  InputFileStruct? inputFile, [
  bool forFieldValue = false,
]) {
  if (inputFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inputFile.toMap());

  // Add any Firestore field values
  inputFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInputFileListFirestoreData(
  List<InputFileStruct>? inputFiles,
) =>
    inputFiles?.map((e) => getInputFileFirestoreData(e, true)).toList() ?? [];
