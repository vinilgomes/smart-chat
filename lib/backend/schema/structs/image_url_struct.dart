// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImageUrlStruct extends FFFirebaseStruct {
  ImageUrlStruct({
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _url = url,
        super(firestoreUtilData);

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static ImageUrlStruct fromMap(Map<String, dynamic> data) => ImageUrlStruct(
        url: data['url'] as String?,
      );

  static ImageUrlStruct? maybeFromMap(dynamic data) =>
      data is Map ? ImageUrlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageUrlStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageUrlStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageUrlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageUrlStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

ImageUrlStruct createImageUrlStruct({
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageUrlStruct(
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageUrlStruct? updateImageUrlStruct(
  ImageUrlStruct? imageUrl, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageUrl
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageUrlStructData(
  Map<String, dynamic> firestoreData,
  ImageUrlStruct? imageUrl,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageUrl == null) {
    return;
  }
  if (imageUrl.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageUrl.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageUrlData = getImageUrlFirestoreData(imageUrl, forFieldValue);
  final nestedData = imageUrlData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageUrl.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageUrlFirestoreData(
  ImageUrlStruct? imageUrl, [
  bool forFieldValue = false,
]) {
  if (imageUrl == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageUrl.toMap());

  // Add any Firestore field values
  imageUrl.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageUrlListFirestoreData(
  List<ImageUrlStruct>? imageUrls,
) =>
    imageUrls?.map((e) => getImageUrlFirestoreData(e, true)).toList() ?? [];
