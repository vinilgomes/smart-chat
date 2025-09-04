import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccessRecord extends FirestoreRecord {
  AccessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_uid" field.
  DocumentReference? _userUid;
  DocumentReference? get userUid => _userUid;
  bool hasUserUid() => _userUid != null;

  // "role" field.
  Role? _role;
  Role? get role => _role;
  bool hasRole() => _role != null;

  // "instance_id" field.
  DocumentReference? _instanceId;
  DocumentReference? get instanceId => _instanceId;
  bool hasInstanceId() => _instanceId != null;

  // "group_id" field.
  DocumentReference? _groupId;
  DocumentReference? get groupId => _groupId;
  bool hasGroupId() => _groupId != null;

  // "prompt_id" field.
  DocumentReference? _promptId;
  DocumentReference? get promptId => _promptId;
  bool hasPromptId() => _promptId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "expires_at" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _userUid = snapshotData['user_uid'] as DocumentReference?;
    _role = snapshotData['role'] is Role
        ? snapshotData['role']
        : deserializeEnum<Role>(snapshotData['role']);
    _instanceId = snapshotData['instance_id'] as DocumentReference?;
    _groupId = snapshotData['group_id'] as DocumentReference?;
    _promptId = snapshotData['prompt_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _expiresAt = snapshotData['expires_at'] as DateTime?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('access');

  static Stream<AccessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccessRecord.fromSnapshot(s));

  static Future<AccessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccessRecord.fromSnapshot(s));

  static AccessRecord fromSnapshot(DocumentSnapshot snapshot) => AccessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccessRecordData({
  DocumentReference? userUid,
  Role? role,
  DocumentReference? instanceId,
  DocumentReference? groupId,
  DocumentReference? promptId,
  String? status,
  DateTime? expiresAt,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_uid': userUid,
      'role': role,
      'instance_id': instanceId,
      'group_id': groupId,
      'prompt_id': promptId,
      'status': status,
      'expires_at': expiresAt,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccessRecordDocumentEquality implements Equality<AccessRecord> {
  const AccessRecordDocumentEquality();

  @override
  bool equals(AccessRecord? e1, AccessRecord? e2) {
    return e1?.userUid == e2?.userUid &&
        e1?.role == e2?.role &&
        e1?.instanceId == e2?.instanceId &&
        e1?.groupId == e2?.groupId &&
        e1?.promptId == e2?.promptId &&
        e1?.status == e2?.status &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.email == e2?.email;
  }

  @override
  int hash(AccessRecord? e) => const ListEquality().hash([
        e?.userUid,
        e?.role,
        e?.instanceId,
        e?.groupId,
        e?.promptId,
        e?.status,
        e?.expiresAt,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is AccessRecord;
}
