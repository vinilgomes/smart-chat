import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navigation/chat_thread_tile/chat_thread_tile_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'drawer_widget.dart' show DrawerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerModel extends FlutterFlowModel<DrawerWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Drawer widget.
  List<PromptRecord>? myPromptList;
  // Stores action output result for [Firestore Query - Query a collection] action in Drawer widget.
  List<PromptRecord>? instancePromptList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Models for ChatThreadTile dynamic component.
  late FlutterFlowDynamicModels<ChatThreadTileModel> chatThreadTileModels1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Models for ChatThreadTile dynamic component.
  late FlutterFlowDynamicModels<ChatThreadTileModel> chatThreadTileModels2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  PromptRecord? newprompt;
  // Stores action output result for [Backend Call - API (createVectorStoreNoFiles)] action in IconButton widget.
  ApiCallResponse? vectorstore;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FunctionRecord? newfunction;

  @override
  void initState(BuildContext context) {
    chatThreadTileModels1 =
        FlutterFlowDynamicModels(() => ChatThreadTileModel());
    chatThreadTileModels2 =
        FlutterFlowDynamicModels(() => ChatThreadTileModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    expandableExpandableController1.dispose();
    chatThreadTileModels1.dispose();
    expandableExpandableController2.dispose();
    chatThreadTileModels2.dispose();
  }
}
