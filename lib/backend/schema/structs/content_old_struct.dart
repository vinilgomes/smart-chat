// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentOldStruct extends FFFirebaseStruct {
  ContentOldStruct({
    String? type,
    String? text,
    ImageUrlStruct? imageUrl,
    FilesStruct? file,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _text = text,
        _imageUrl = imageUrl,
        _file = file,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "image_url" field.
  ImageUrlStruct? _imageUrl;
  ImageUrlStruct get imageUrl => _imageUrl ?? ImageUrlStruct();
  set imageUrl(ImageUrlStruct? val) => _imageUrl = val;

  void updateImageUrl(Function(ImageUrlStruct) updateFn) {
    updateFn(_imageUrl ??= ImageUrlStruct());
  }

  bool hasImageUrl() => _imageUrl != null;

  // "file" field.
  FilesStruct? _file;
  FilesStruct get file => _file ?? FilesStruct();
  set file(FilesStruct? val) => _file = val;

  void updateFile(Function(FilesStruct) updateFn) {
    updateFn(_file ??= FilesStruct());
  }

  bool hasFile() => _file != null;

  static ContentOldStruct fromMap(Map<String, dynamic> data) =>
      ContentOldStruct(
        type: data['type'] as String?,
        text: data['text'] as String?,
        imageUrl: data['image_url'] is ImageUrlStruct
            ? data['image_url']
            : ImageUrlStruct.maybeFromMap(data['image_url']),
        file: data['file'] is FilesStruct
            ? data['file']
            : FilesStruct.maybeFromMap(data['file']),
      );

  static ContentOldStruct? maybeFromMap(dynamic data) => data is Map
      ? ContentOldStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'text': _text,
        'image_url': _imageUrl?.toMap(),
        'file': _file?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.DataStruct,
        ),
        'file': serializeParam(
          _file,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ContentOldStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentOldStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeStructParam(
          data['image_url'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageUrlStruct.fromSerializableMap,
        ),
        file: deserializeStructParam(
          data['file'],
          ParamType.DataStruct,
          false,
          structBuilder: FilesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ContentOldStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentOldStruct &&
        type == other.type &&
        text == other.text &&
        imageUrl == other.imageUrl &&
        file == other.file;
  }

  @override
  int get hashCode => const ListEquality().hash([type, text, imageUrl, file]);
}

ContentOldStruct createContentOldStruct({
  String? type,
  String? text,
  ImageUrlStruct? imageUrl,
  FilesStruct? file,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentOldStruct(
      type: type,
      text: text,
      imageUrl: imageUrl ?? (clearUnsetFields ? ImageUrlStruct() : null),
      file: file ?? (clearUnsetFields ? FilesStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentOldStruct? updateContentOldStruct(
  ContentOldStruct? contentOld, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contentOld
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentOldStructData(
  Map<String, dynamic> firestoreData,
  ContentOldStruct? contentOld,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contentOld == null) {
    return;
  }
  if (contentOld.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contentOld.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentOldData = getContentOldFirestoreData(contentOld, forFieldValue);
  final nestedData = contentOldData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contentOld.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentOldFirestoreData(
  ContentOldStruct? contentOld, [
  bool forFieldValue = false,
]) {
  if (contentOld == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contentOld.toMap());

  // Handle nested data for "image_url" field.
  addImageUrlStructData(
    firestoreData,
    contentOld.hasImageUrl() ? contentOld.imageUrl : null,
    'image_url',
    forFieldValue,
  );

  // Handle nested data for "file" field.
  addFilesStructData(
    firestoreData,
    contentOld.hasFile() ? contentOld.file : null,
    'file',
    forFieldValue,
  );

  // Add any Firestore field values
  contentOld.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentOldListFirestoreData(
  List<ContentOldStruct>? contentOlds,
) =>
    contentOlds?.map((e) => getContentOldFirestoreData(e, true)).toList() ?? [];
