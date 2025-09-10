import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'empty_messages_widget.dart' show EmptyMessagesWidget;
import 'package:flutter/material.dart';

class EmptyMessagesModel extends FlutterFlowModel<EmptyMessagesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Suporte widget.
  FocusNode? suporteFocusNode;
  TextEditingController? suporteTextController;
  String? Function(BuildContext, String?)? suporteTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    suporteFocusNode?.dispose();
    suporteTextController?.dispose();
  }
}
