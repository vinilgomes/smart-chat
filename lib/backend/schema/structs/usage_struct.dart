// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsageStruct extends FFFirebaseStruct {
  UsageStruct({
    int? inputTokens,
    int? outputTokens,
    int? totalTokens,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _inputTokens = inputTokens,
        _outputTokens = outputTokens,
        _totalTokens = totalTokens,
        super(firestoreUtilData);

  // "input_tokens" field.
  int? _inputTokens;
  int get inputTokens => _inputTokens ?? 0;
  set inputTokens(int? val) => _inputTokens = val;

  void incrementInputTokens(int amount) => inputTokens = inputTokens + amount;

  bool hasInputTokens() => _inputTokens != null;

  // "output_tokens" field.
  int? _outputTokens;
  int get outputTokens => _outputTokens ?? 0;
  set outputTokens(int? val) => _outputTokens = val;

  void incrementOutputTokens(int amount) =>
      outputTokens = outputTokens + amount;

  bool hasOutputTokens() => _outputTokens != null;

  // "total_tokens" field.
  int? _totalTokens;
  int get totalTokens => _totalTokens ?? 0;
  set totalTokens(int? val) => _totalTokens = val;

  void incrementTotalTokens(int amount) => totalTokens = totalTokens + amount;

  bool hasTotalTokens() => _totalTokens != null;

  static UsageStruct fromMap(Map<String, dynamic> data) => UsageStruct(
        inputTokens: castToType<int>(data['input_tokens']),
        outputTokens: castToType<int>(data['output_tokens']),
        totalTokens: castToType<int>(data['total_tokens']),
      );

  static UsageStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'input_tokens': _inputTokens,
        'output_tokens': _outputTokens,
        'total_tokens': _totalTokens,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'input_tokens': serializeParam(
          _inputTokens,
          ParamType.int,
        ),
        'output_tokens': serializeParam(
          _outputTokens,
          ParamType.int,
        ),
        'total_tokens': serializeParam(
          _totalTokens,
          ParamType.int,
        ),
      }.withoutNulls;

  static UsageStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsageStruct(
        inputTokens: deserializeParam(
          data['input_tokens'],
          ParamType.int,
          false,
        ),
        outputTokens: deserializeParam(
          data['output_tokens'],
          ParamType.int,
          false,
        ),
        totalTokens: deserializeParam(
          data['total_tokens'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UsageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsageStruct &&
        inputTokens == other.inputTokens &&
        outputTokens == other.outputTokens &&
        totalTokens == other.totalTokens;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([inputTokens, outputTokens, totalTokens]);
}

UsageStruct createUsageStruct({
  int? inputTokens,
  int? outputTokens,
  int? totalTokens,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsageStruct(
      inputTokens: inputTokens,
      outputTokens: outputTokens,
      totalTokens: totalTokens,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsageStruct? updateUsageStruct(
  UsageStruct? usage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsageStructData(
  Map<String, dynamic> firestoreData,
  UsageStruct? usage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usage == null) {
    return;
  }
  if (usage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usageData = getUsageFirestoreData(usage, forFieldValue);
  final nestedData = usageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsageFirestoreData(
  UsageStruct? usage, [
  bool forFieldValue = false,
]) {
  if (usage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usage.toMap());

  // Add any Firestore field values
  usage.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsageListFirestoreData(
  List<UsageStruct>? usages,
) =>
    usages?.map((e) => getUsageFirestoreData(e, true)).toList() ?? [];
