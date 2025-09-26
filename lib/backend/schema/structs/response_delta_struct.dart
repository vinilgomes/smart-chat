// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseDeltaStruct extends FFFirebaseStruct {
  ResponseDeltaStruct({
    String? type,
    int? sequenceNumber,
    String? itemId,
    int? outputIndex,
    int? contentIndex,
    String? delta,
    List<String>? logprobs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _sequenceNumber = sequenceNumber,
        _itemId = itemId,
        _outputIndex = outputIndex,
        _contentIndex = contentIndex,
        _delta = delta,
        _logprobs = logprobs,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "sequence_number" field.
  int? _sequenceNumber;
  int get sequenceNumber => _sequenceNumber ?? 0;
  set sequenceNumber(int? val) => _sequenceNumber = val;

  void incrementSequenceNumber(int amount) =>
      sequenceNumber = sequenceNumber + amount;

  bool hasSequenceNumber() => _sequenceNumber != null;

  // "item_id" field.
  String? _itemId;
  String get itemId => _itemId ?? '';
  set itemId(String? val) => _itemId = val;

  bool hasItemId() => _itemId != null;

  // "output_index" field.
  int? _outputIndex;
  int get outputIndex => _outputIndex ?? 0;
  set outputIndex(int? val) => _outputIndex = val;

  void incrementOutputIndex(int amount) => outputIndex = outputIndex + amount;

  bool hasOutputIndex() => _outputIndex != null;

  // "content_index" field.
  int? _contentIndex;
  int get contentIndex => _contentIndex ?? 0;
  set contentIndex(int? val) => _contentIndex = val;

  void incrementContentIndex(int amount) =>
      contentIndex = contentIndex + amount;

  bool hasContentIndex() => _contentIndex != null;

  // "delta" field.
  String? _delta;
  String get delta => _delta ?? '';
  set delta(String? val) => _delta = val;

  bool hasDelta() => _delta != null;

  // "logprobs" field.
  List<String>? _logprobs;
  List<String> get logprobs => _logprobs ?? const [];
  set logprobs(List<String>? val) => _logprobs = val;

  void updateLogprobs(Function(List<String>) updateFn) {
    updateFn(_logprobs ??= []);
  }

  bool hasLogprobs() => _logprobs != null;

  static ResponseDeltaStruct fromMap(Map<String, dynamic> data) =>
      ResponseDeltaStruct(
        type: data['type'] as String?,
        sequenceNumber: castToType<int>(data['sequence_number']),
        itemId: data['item_id'] as String?,
        outputIndex: castToType<int>(data['output_index']),
        contentIndex: castToType<int>(data['content_index']),
        delta: data['delta'] as String?,
        logprobs: getDataList(data['logprobs']),
      );

  static ResponseDeltaStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponseDeltaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'sequence_number': _sequenceNumber,
        'item_id': _itemId,
        'output_index': _outputIndex,
        'content_index': _contentIndex,
        'delta': _delta,
        'logprobs': _logprobs,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'sequence_number': serializeParam(
          _sequenceNumber,
          ParamType.int,
        ),
        'item_id': serializeParam(
          _itemId,
          ParamType.String,
        ),
        'output_index': serializeParam(
          _outputIndex,
          ParamType.int,
        ),
        'content_index': serializeParam(
          _contentIndex,
          ParamType.int,
        ),
        'delta': serializeParam(
          _delta,
          ParamType.String,
        ),
        'logprobs': serializeParam(
          _logprobs,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ResponseDeltaStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseDeltaStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        sequenceNumber: deserializeParam(
          data['sequence_number'],
          ParamType.int,
          false,
        ),
        itemId: deserializeParam(
          data['item_id'],
          ParamType.String,
          false,
        ),
        outputIndex: deserializeParam(
          data['output_index'],
          ParamType.int,
          false,
        ),
        contentIndex: deserializeParam(
          data['content_index'],
          ParamType.int,
          false,
        ),
        delta: deserializeParam(
          data['delta'],
          ParamType.String,
          false,
        ),
        logprobs: deserializeParam<String>(
          data['logprobs'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ResponseDeltaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseDeltaStruct &&
        type == other.type &&
        sequenceNumber == other.sequenceNumber &&
        itemId == other.itemId &&
        outputIndex == other.outputIndex &&
        contentIndex == other.contentIndex &&
        delta == other.delta &&
        listEquality.equals(logprobs, other.logprobs);
  }

  @override
  int get hashCode => const ListEquality().hash([
        type,
        sequenceNumber,
        itemId,
        outputIndex,
        contentIndex,
        delta,
        logprobs
      ]);
}

ResponseDeltaStruct createResponseDeltaStruct({
  String? type,
  int? sequenceNumber,
  String? itemId,
  int? outputIndex,
  int? contentIndex,
  String? delta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseDeltaStruct(
      type: type,
      sequenceNumber: sequenceNumber,
      itemId: itemId,
      outputIndex: outputIndex,
      contentIndex: contentIndex,
      delta: delta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseDeltaStruct? updateResponseDeltaStruct(
  ResponseDeltaStruct? responseDelta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseDelta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseDeltaStructData(
  Map<String, dynamic> firestoreData,
  ResponseDeltaStruct? responseDelta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseDelta == null) {
    return;
  }
  if (responseDelta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responseDelta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseDeltaData =
      getResponseDeltaFirestoreData(responseDelta, forFieldValue);
  final nestedData =
      responseDeltaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responseDelta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseDeltaFirestoreData(
  ResponseDeltaStruct? responseDelta, [
  bool forFieldValue = false,
]) {
  if (responseDelta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseDelta.toMap());

  // Add any Firestore field values
  responseDelta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseDeltaListFirestoreData(
  List<ResponseDeltaStruct>? responseDeltas,
) =>
    responseDeltas
        ?.map((e) => getResponseDeltaFirestoreData(e, true))
        .toList() ??
    [];
