import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'empty_messages_widget.dart' show EmptyMessagesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
