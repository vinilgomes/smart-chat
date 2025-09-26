import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future<String?> validaAcesso(
  BuildContext context, {
  required String? instance,
  String? prompt,
}) async {
  List<AccessRecord>? access;
  ParamsRecord? instanceData;
  List<PromptRecord>? promptAccess;

  access = await queryAccessRecordOnce(
    queryBuilder: (accessRecord) => accessRecord.where(
      'user_uid',
      isEqualTo: currentUserReference,
    ),
  );
  if ((access != null && (access)!.isNotEmpty) &&
      ((instance != null && instance != '') ||
          (prompt != null && prompt != ''))) {
    if (instance != null && instance != '') {
      instanceData = await queryParamsRecordOnce(
        queryBuilder: (paramsRecord) => paramsRecord.where(
          'instance_id',
          isEqualTo: instance,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!(access!
          .where((e) => e.instanceId == instanceData?.reference)
          .toList()
          .isNotEmpty)) {
        context.pushNamed(
          ChooseYourInstanceWidget.routeName,
          pathParameters: {
            'instance': serializeParam(
              instance,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    }
    if (prompt != null && prompt != '') {
      // Obtem prompt
      promptAccess = await queryPromptRecordOnce(
        queryBuilder: (promptRecord) => promptRecord.where(Filter.or(
          Filter(
            'created_by',
            isEqualTo: currentUserReference,
          ),
          Filter(
            'visibility',
            isEqualTo: 'INSTANCE',
          ),
        )),
      );
      if (!(promptAccess != null && (promptAccess)!.isNotEmpty)) {
        context.pushNamed(
          ChooseYourInstanceWidget.routeName,
          pathParameters: {
            'instance': serializeParam(
              instance,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    }
  } else {
    context.pushNamed(
      ChooseYourInstanceWidget.routeName,
      pathParameters: {
        'instance': serializeParam(
          instance,
          ParamType.String,
        ),
      }.withoutNulls,
    );
  }

  return null;
}

Future<List<ThreadMessageStruct>?> loadMessages(
  BuildContext context, {
  DocumentReference? prompt,
  DocumentReference? instance,
}) async {
  ConversationRecord? promptConversation;
  List<ConversationRecord>? instanceConversation;
  List<MessageRecord>? messages;

  if (prompt != null) {
    promptConversation = await queryConversationRecordOnce(
      queryBuilder: (conversationRecord) => conversationRecord
          .where(
            'user',
            isEqualTo: currentUserReference,
          )
          .where(
            'promptId',
            isEqualTo: prompt,
          )
          .where(
            'instanceId',
            isEqualTo: instance,
          )
          .orderBy('lastMessageAt', descending: true),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    FFAppState().conversationId = promptConversation?.reference;
  } else {
    if (instance != null) {
      instanceConversation = await queryConversationRecordOnce(
        queryBuilder: (conversationRecord) => conversationRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'instanceId',
              isEqualTo: instance,
            )
            .orderBy('lastMessageAt', descending: true),
      );
      FFAppState().conversationId = instanceConversation
          ?.where((e) => e.promptId == null)
          .toList()
          ?.firstOrNull
          ?.reference;
      FFAppState().update(() {});
    } else {
      return functions.emptyThreadMessageList();
    }
  }

  if (FFAppState().conversationId != null) {
    messages = await queryMessageRecordOnce(
      parent: FFAppState().conversationId,
      queryBuilder: (messageRecord) => messageRecord
          .where(
            'userId',
            isEqualTo: currentUserReference,
          )
          .orderBy('createdAt', descending: true),
      limit: 20,
    );
  } else {
    return functions.emptyThreadMessageList();
  }

  return functions.buildThreadMessageList(messages!.toList());
}
