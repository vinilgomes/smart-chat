import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/chat_thread_tile/chat_thread_tile_widget.dart';
import 'drawer_widget.dart' show DrawerWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

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
