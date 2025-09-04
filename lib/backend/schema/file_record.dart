import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileRecord extends FirestoreRecord {
  FileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  bool hasSize() => _size != null;

  // "mimetype" field.
  String? _mimetype;
  String get mimetype => _mimetype ?? '';
  bool hasMimetype() => _mimetype != null;

  // "extension" field.
  String? _extension;
  String get extension => _extension ?? '';
  bool hasExtension() => _extension != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "instance" field.
  DocumentReference? _instance;
  DocumentReference? get instance => _instance;
  bool hasInstance() => _instance != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "prompt" field.
  DocumentReference? _prompt;
  DocumentReference? get prompt => _prompt;
  bool hasPrompt() => _prompt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _size = castToType<double>(snapshotData['size']);
    _mimetype = snapshotData['mimetype'] as String?;
    _extension = snapshotData['extension'] as String?;
    _id = snapshotData['id'] as String?;
    _instance = snapshotData['instance'] as DocumentReference?;
    _group = snapshotData['group'] as DocumentReference?;
    _prompt = snapshotData['prompt'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('file');

  static Stream<FileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FileRecord.fromSnapshot(s));

  static Future<FileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FileRecord.fromSnapshot(s));

  static FileRecord fromSnapshot(DocumentSnapshot snapshot) => FileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFileRecordData({
  String? name,
  double? size,
  String? mimetype,
  String? extension,
  String? id,
  DocumentReference? instance,
  DocumentReference? group,
  DocumentReference? prompt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'size': size,
      'mimetype': mimetype,
      'extension': extension,
      'id': id,
      'instance': instance,
      'group': group,
      'prompt': prompt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FileRecordDocumentEquality implements Equality<FileRecord> {
  const FileRecordDocumentEquality();

  @override
  bool equals(FileRecord? e1, FileRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.size == e2?.size &&
        e1?.mimetype == e2?.mimetype &&
        e1?.extension == e2?.extension &&
        e1?.id == e2?.id &&
        e1?.instance == e2?.instance &&
        e1?.group == e2?.group &&
        e1?.prompt == e2?.prompt;
  }

  @override
  int hash(FileRecord? e) => const ListEquality().hash([
        e?.name,
        e?.size,
        e?.mimetype,
        e?.extension,
        e?.id,
        e?.instance,
        e?.group,
        e?.prompt
      ]);

  @override
  bool isValidKey(Object? o) => o is FileRecord;
}
