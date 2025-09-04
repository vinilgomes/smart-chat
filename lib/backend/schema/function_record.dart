import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FunctionRecord extends FirestoreRecord {
  FunctionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "arguments" field.
  String? _arguments;
  String get arguments => _arguments ?? '';
  bool hasArguments() => _arguments != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "workflowId" field.
  String? _workflowId;
  String get workflowId => _workflowId ?? '';
  bool hasWorkflowId() => _workflowId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _arguments = snapshotData['arguments'] as String?;
    _shortDescription = snapshotData['short_description'] as String?;
    _workflowId = snapshotData['workflowId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('function');

  static Stream<FunctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FunctionRecord.fromSnapshot(s));

  static Future<FunctionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FunctionRecord.fromSnapshot(s));

  static FunctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FunctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FunctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FunctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FunctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FunctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFunctionRecordData({
  String? name,
  String? description,
  String? arguments,
  String? shortDescription,
  String? workflowId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'arguments': arguments,
      'short_description': shortDescription,
      'workflowId': workflowId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FunctionRecordDocumentEquality implements Equality<FunctionRecord> {
  const FunctionRecordDocumentEquality();

  @override
  bool equals(FunctionRecord? e1, FunctionRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.arguments == e2?.arguments &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.workflowId == e2?.workflowId;
  }

  @override
  int hash(FunctionRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.arguments,
        e?.shortDescription,
        e?.workflowId
      ]);

  @override
  bool isValidKey(Object? o) => o is FunctionRecord;
}
