// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentStruct extends FFFirebaseStruct {
  ContentStruct({
    String? type,
    List<String>? annotations,
    List<String>? logprobs,
    String? text,
    ImageUrlStruct? imageUrl,
    String? responseId,
    String? openaiFileId,
    InputFileStruct? inputFile,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _annotations = annotations,
        _logprobs = logprobs,
        _text = text,
        _imageUrl = imageUrl,
        _responseId = responseId,
        _openaiFileId = openaiFileId,
        _inputFile = inputFile,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "annotations" field.
  List<String>? _annotations;
  List<String> get annotations => _annotations ?? const [];
  set annotations(List<String>? val) => _annotations = val;

  void updateAnnotations(Function(List<String>) updateFn) {
    updateFn(_annotations ??= []);
  }

  bool hasAnnotations() => _annotations != null;

  // "logprobs" field.
  List<String>? _logprobs;
  List<String> get logprobs => _logprobs ?? const [];
  set logprobs(List<String>? val) => _logprobs = val;

  void updateLogprobs(Function(List<String>) updateFn) {
    updateFn(_logprobs ??= []);
  }

  bool hasLogprobs() => _logprobs != null;

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

  // "response_id" field.
  String? _responseId;
  String get responseId => _responseId ?? '';
  set responseId(String? val) => _responseId = val;

  bool hasResponseId() => _responseId != null;

  // "openai_file_id" field.
  String? _openaiFileId;
  String get openaiFileId => _openaiFileId ?? '';
  set openaiFileId(String? val) => _openaiFileId = val;

  bool hasOpenaiFileId() => _openaiFileId != null;

  // "input_file" field.
  InputFileStruct? _inputFile;
  InputFileStruct get inputFile => _inputFile ?? InputFileStruct();
  set inputFile(InputFileStruct? val) => _inputFile = val;

  void updateInputFile(Function(InputFileStruct) updateFn) {
    updateFn(_inputFile ??= InputFileStruct());
  }

  bool hasInputFile() => _inputFile != null;

  static ContentStruct fromMap(Map<String, dynamic> data) => ContentStruct(
        type: data['type'] as String?,
        annotations: getDataList(data['annotations']),
        logprobs: getDataList(data['logprobs']),
        text: data['text'] as String?,
        imageUrl: data['image_url'] is ImageUrlStruct
            ? data['image_url']
            : ImageUrlStruct.maybeFromMap(data['image_url']),
        responseId: data['response_id'] as String?,
        openaiFileId: data['openai_file_id'] as String?,
        inputFile: data['input_file'] is InputFileStruct
            ? data['input_file']
            : InputFileStruct.maybeFromMap(data['input_file']),
      );

  static ContentStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'annotations': _annotations,
        'logprobs': _logprobs,
        'text': _text,
        'image_url': _imageUrl?.toMap(),
        'response_id': _responseId,
        'openai_file_id': _openaiFileId,
        'input_file': _inputFile?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'annotations': serializeParam(
          _annotations,
          ParamType.String,
          isList: true,
        ),
        'logprobs': serializeParam(
          _logprobs,
          ParamType.String,
          isList: true,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.DataStruct,
        ),
        'response_id': serializeParam(
          _responseId,
          ParamType.String,
        ),
        'openai_file_id': serializeParam(
          _openaiFileId,
          ParamType.String,
        ),
        'input_file': serializeParam(
          _inputFile,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        annotations: deserializeParam<String>(
          data['annotations'],
          ParamType.String,
          true,
        ),
        logprobs: deserializeParam<String>(
          data['logprobs'],
          ParamType.String,
          true,
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
        responseId: deserializeParam(
          data['response_id'],
          ParamType.String,
          false,
        ),
        openaiFileId: deserializeParam(
          data['openai_file_id'],
          ParamType.String,
          false,
        ),
        inputFile: deserializeStructParam(
          data['input_file'],
          ParamType.DataStruct,
          false,
          structBuilder: InputFileStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ContentStruct &&
        type == other.type &&
        listEquality.equals(annotations, other.annotations) &&
        listEquality.equals(logprobs, other.logprobs) &&
        text == other.text &&
        imageUrl == other.imageUrl &&
        responseId == other.responseId &&
        openaiFileId == other.openaiFileId &&
        inputFile == other.inputFile;
  }

  @override
  int get hashCode => const ListEquality().hash([
        type,
        annotations,
        logprobs,
        text,
        imageUrl,
        responseId,
        openaiFileId,
        inputFile
      ]);
}

ContentStruct createContentStruct({
  String? type,
  String? text,
  ImageUrlStruct? imageUrl,
  String? responseId,
  String? openaiFileId,
  InputFileStruct? inputFile,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentStruct(
      type: type,
      text: text,
      imageUrl: imageUrl ?? (clearUnsetFields ? ImageUrlStruct() : null),
      responseId: responseId,
      openaiFileId: openaiFileId,
      inputFile: inputFile ?? (clearUnsetFields ? InputFileStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentStruct? updateContentStruct(
  ContentStruct? content, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    content
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentStructData(
  Map<String, dynamic> firestoreData,
  ContentStruct? content,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (content == null) {
    return;
  }
  if (content.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && content.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentData = getContentFirestoreData(content, forFieldValue);
  final nestedData = contentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = content.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentFirestoreData(
  ContentStruct? content, [
  bool forFieldValue = false,
]) {
  if (content == null) {
    return {};
  }
  final firestoreData = mapToFirestore(content.toMap());

  // Handle nested data for "image_url" field.
  addImageUrlStructData(
    firestoreData,
    content.hasImageUrl() ? content.imageUrl : null,
    'image_url',
    forFieldValue,
  );

  // Handle nested data for "input_file" field.
  addInputFileStructData(
    firestoreData,
    content.hasInputFile() ? content.inputFile : null,
    'input_file',
    forFieldValue,
  );

  // Add any Firestore field values
  content.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentListFirestoreData(
  List<ContentStruct>? contents,
) =>
    contents?.map((e) => getContentFirestoreData(e, true)).toList() ?? [];
