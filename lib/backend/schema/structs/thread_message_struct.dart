// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadMessageStruct extends FFFirebaseStruct {
  ThreadMessageStruct({
    String? role,
    List<ContentStruct>? content,
    bool? visible,
    String? img,
    String? responseId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _role = role,
        _content = content,
        _visible = visible,
        _img = img,
        _responseId = responseId,
        super(firestoreUtilData);

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "content" field.
  List<ContentStruct>? _content;
  List<ContentStruct> get content => _content ?? const [];
  set content(List<ContentStruct>? val) => _content = val;

  void updateContent(Function(List<ContentStruct>) updateFn) {
    updateFn(_content ??= []);
  }

  bool hasContent() => _content != null;

  // "visible" field.
  bool? _visible;
  bool get visible => _visible ?? true;
  set visible(bool? val) => _visible = val;

  bool hasVisible() => _visible != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "response_id" field.
  String? _responseId;
  String get responseId => _responseId ?? '';
  set responseId(String? val) => _responseId = val;

  bool hasResponseId() => _responseId != null;

  static ThreadMessageStruct fromMap(Map<String, dynamic> data) =>
      ThreadMessageStruct(
        role: data['role'] as String?,
        content: getStructList(
          data['content'],
          ContentStruct.fromMap,
        ),
        visible: data['visible'] as bool?,
        img: data['img'] as String?,
        responseId: data['response_id'] as String?,
      );

  static ThreadMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ThreadMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role': _role,
        'content': _content?.map((e) => e.toMap()).toList(),
        'visible': _visible,
        'img': _img,
        'response_id': _responseId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.DataStruct,
          isList: true,
        ),
        'visible': serializeParam(
          _visible,
          ParamType.bool,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'response_id': serializeParam(
          _responseId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ThreadMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadMessageStruct(
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        content: deserializeStructParam<ContentStruct>(
          data['content'],
          ParamType.DataStruct,
          true,
          structBuilder: ContentStruct.fromSerializableMap,
        ),
        visible: deserializeParam(
          data['visible'],
          ParamType.bool,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        responseId: deserializeParam(
          data['response_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ThreadMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThreadMessageStruct &&
        role == other.role &&
        listEquality.equals(content, other.content) &&
        visible == other.visible &&
        img == other.img &&
        responseId == other.responseId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([role, content, visible, img, responseId]);
}

ThreadMessageStruct createThreadMessageStruct({
  String? role,
  bool? visible,
  String? img,
  String? responseId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadMessageStruct(
      role: role,
      visible: visible,
      img: img,
      responseId: responseId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadMessageStruct? updateThreadMessageStruct(
  ThreadMessageStruct? threadMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    threadMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadMessageStructData(
  Map<String, dynamic> firestoreData,
  ThreadMessageStruct? threadMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (threadMessage == null) {
    return;
  }
  if (threadMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && threadMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadMessageData =
      getThreadMessageFirestoreData(threadMessage, forFieldValue);
  final nestedData =
      threadMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = threadMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadMessageFirestoreData(
  ThreadMessageStruct? threadMessage, [
  bool forFieldValue = false,
]) {
  if (threadMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(threadMessage.toMap());

  // Add any Firestore field values
  threadMessage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadMessageListFirestoreData(
  List<ThreadMessageStruct>? threadMessages,
) =>
    threadMessages
        ?.map((e) => getThreadMessageFirestoreData(e, true))
        .toList() ??
    [];
