// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModifierPromptStruct extends FFFirebaseStruct {
  ModifierPromptStruct({
    Modifier? type,
    String? typeOther,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _typeOther = typeOther,
        _description = description,
        super(firestoreUtilData);

  // "type" field.
  Modifier? _type;
  Modifier? get type => _type;
  set type(Modifier? val) => _type = val;

  bool hasType() => _type != null;

  // "type_other" field.
  String? _typeOther;
  String get typeOther =>
      _typeOther ??
      'Dynamically generated type from assistant, used when type enum is OTHER';
  set typeOther(String? val) => _typeOther = val;

  bool hasTypeOther() => _typeOther != null;

  // "description" field.
  String? _description;
  String get description =>
      _description ??
      'An explanation for how the assistant should use this modifier';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static ModifierPromptStruct fromMap(Map<String, dynamic> data) =>
      ModifierPromptStruct(
        type: data['type'] is Modifier
            ? data['type']
            : deserializeEnum<Modifier>(data['type']),
        typeOther: data['type_other'] as String?,
        description: data['description'] as String?,
      );

  static ModifierPromptStruct? maybeFromMap(dynamic data) => data is Map
      ? ModifierPromptStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'type_other': _typeOther,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'type_other': serializeParam(
          _typeOther,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static ModifierPromptStruct fromSerializableMap(Map<String, dynamic> data) =>
      ModifierPromptStruct(
        type: deserializeParam<Modifier>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        typeOther: deserializeParam(
          data['type_other'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ModifierPromptStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ModifierPromptStruct &&
        type == other.type &&
        typeOther == other.typeOther &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([type, typeOther, description]);
}

ModifierPromptStruct createModifierPromptStruct({
  Modifier? type,
  String? typeOther,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModifierPromptStruct(
      type: type,
      typeOther: typeOther,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModifierPromptStruct? updateModifierPromptStruct(
  ModifierPromptStruct? modifierPrompt, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    modifierPrompt
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModifierPromptStructData(
  Map<String, dynamic> firestoreData,
  ModifierPromptStruct? modifierPrompt,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modifierPrompt == null) {
    return;
  }
  if (modifierPrompt.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && modifierPrompt.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modifierPromptData =
      getModifierPromptFirestoreData(modifierPrompt, forFieldValue);
  final nestedData =
      modifierPromptData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = modifierPrompt.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModifierPromptFirestoreData(
  ModifierPromptStruct? modifierPrompt, [
  bool forFieldValue = false,
]) {
  if (modifierPrompt == null) {
    return {};
  }
  final firestoreData = mapToFirestore(modifierPrompt.toMap());

  // Add any Firestore field values
  modifierPrompt.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModifierPromptListFirestoreData(
  List<ModifierPromptStruct>? modifierPrompts,
) =>
    modifierPrompts
        ?.map((e) => getModifierPromptFirestoreData(e, true))
        .toList() ??
    [];
