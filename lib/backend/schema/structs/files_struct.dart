// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FilesStruct extends FFFirebaseStruct {
  FilesStruct({
    String? fileId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileId = fileId,
        super(firestoreUtilData);

  // "file_id" field.
  String? _fileId;
  String get fileId => _fileId ?? '';
  set fileId(String? val) => _fileId = val;

  bool hasFileId() => _fileId != null;

  static FilesStruct fromMap(Map<String, dynamic> data) => FilesStruct(
        fileId: data['file_id'] as String?,
      );

  static FilesStruct? maybeFromMap(dynamic data) =>
      data is Map ? FilesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'file_id': _fileId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'file_id': serializeParam(
          _fileId,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilesStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilesStruct(
        fileId: deserializeParam(
          data['file_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilesStruct && fileId == other.fileId;
  }

  @override
  int get hashCode => const ListEquality().hash([fileId]);
}

FilesStruct createFilesStruct({
  String? fileId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilesStruct(
      fileId: fileId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilesStruct? updateFilesStruct(
  FilesStruct? files, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    files
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilesStructData(
  Map<String, dynamic> firestoreData,
  FilesStruct? files,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (files == null) {
    return;
  }
  if (files.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && files.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filesData = getFilesFirestoreData(files, forFieldValue);
  final nestedData = filesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = files.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilesFirestoreData(
  FilesStruct? files, [
  bool forFieldValue = false,
]) {
  if (files == null) {
    return {};
  }
  final firestoreData = mapToFirestore(files.toMap());

  // Add any Firestore field values
  files.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilesListFirestoreData(
  List<FilesStruct>? filess,
) =>
    filess?.map((e) => getFilesFirestoreData(e, true)).toList() ?? [];
