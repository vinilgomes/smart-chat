import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/navigation/drawer/drawer_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'prompt_config_widget.dart' show PromptConfigWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PromptConfigModel extends FlutterFlowModel<PromptConfigWidget> {
  ///  Local state fields for this page.

  bool hasAccess = false;

  List<dynamic> agentFiles = [];
  void addToAgentFiles(dynamic item) => agentFiles.add(item);
  void removeFromAgentFiles(dynamic item) => agentFiles.remove(item);
  void removeAtIndexFromAgentFiles(int index) => agentFiles.removeAt(index);
  void insertAtIndexInAgentFiles(int index, dynamic item) =>
      agentFiles.insert(index, item);
  void updateAgentFilesAtIndex(int index, Function(dynamic) updateFn) =>
      agentFiles[index] = updateFn(agentFiles[index]);

  bool isLoading = true;

  List<DocumentReference> functionList = [];
  void addToFunctionList(DocumentReference item) => functionList.add(item);
  void removeFromFunctionList(DocumentReference item) =>
      functionList.remove(item);
  void removeAtIndexFromFunctionList(int index) => functionList.removeAt(index);
  void insertAtIndexInFunctionList(int index, DocumentReference item) =>
      functionList.insert(index, item);
  void updateFunctionListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      functionList[index] = updateFn(functionList[index]);

  dynamic responseJson;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in PromptConfig widget.
  PromptRecord? prompt;
  // Stores action output result for [Firestore Query - Query a collection] action in PromptConfig widget.
  ParamsRecord? instance;
  // Stores action output result for [Backend Call - API (listVectorStoreFiles)] action in PromptConfig widget.
  ApiCallResponse? files;
  // Model for Drawer component.
  late DrawerModel drawerModel1;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for welcomeMessage widget.
  FocusNode? welcomeMessageFocusNode1;
  TextEditingController? welcomeMessageTextController1;
  String? Function(BuildContext, String?)?
      welcomeMessageTextController1Validator;
  // State field(s) for visibility widget.
  FormFieldController<String>? visibilityValueController;
  // Stores action output result for [Backend Call - API (createResponseNoStreaming)] action in Button widget.
  ApiCallResponse? generatedPrompt;
  // State field(s) for systemPrompt widget.
  FocusNode? systemPromptFocusNode;
  TextEditingController? systemPromptTextController;
  String? Function(BuildContext, String?)? systemPromptTextControllerValidator;
  // State field(s) for instructions widget.
  FocusNode? instructionsFocusNode;
  TextEditingController? instructionsTextController;
  String? Function(BuildContext, String?)? instructionsTextControllerValidator;
  // State field(s) for temperature widget.
  double? temperatureValue;
  // State field(s) for topP widget.
  double? topPValue;
  bool isDataUploading_uploadVs = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadVs = [];

  // Stores action output result for [Backend Call - API (createVectorStoreNoFiles)] action in Button widget.
  ApiCallResponse? newVs;
  // Stores action output result for [Backend Call - API (createFile)] action in Button widget.
  ApiCallResponse? file;
  // Stores action output result for [Backend Call - API (createVectorStoreFile)] action in Button widget.
  ApiCallResponse? vsFile;
  // Stores action output result for [Backend Call - API (listVectorStoreFiles)] action in Button widget.
  ApiCallResponse? filesAdd;
  // Stores action output result for [Backend Call - API (deleteVectorStoreFile)] action in IconButton widget.
  ApiCallResponse? deleteVsFile;
  // Stores action output result for [Backend Call - API (deleteFile)] action in IconButton widget.
  ApiCallResponse? deleteFile;
  // Stores action output result for [Backend Call - API (listVectorStoreFiles)] action in IconButton widget.
  ApiCallResponse? filesDelete;
  // State field(s) for web_search_preview widget.
  bool? webSearchPreviewValue;
  // State field(s) for output widget.
  FormFieldController<String>? outputValueController;
  // State field(s) for welcomeMessage widget.
  FocusNode? welcomeMessageFocusNode2;
  TextEditingController? welcomeMessageTextController2;
  String? Function(BuildContext, String?)?
      welcomeMessageTextController2Validator;
  // State field(s) for function widget.
  String? functionValue;
  FormFieldController<String>? functionValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  FunctionRecord? selectedFunction;
  // Model for Drawer component.
  late DrawerModel drawerModel2;

  @override
  void initState(BuildContext context) {
    drawerModel1 = createModel(context, () => DrawerModel());
    drawerModel2 = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel1.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    welcomeMessageFocusNode1?.dispose();
    welcomeMessageTextController1?.dispose();

    systemPromptFocusNode?.dispose();
    systemPromptTextController?.dispose();

    instructionsFocusNode?.dispose();
    instructionsTextController?.dispose();

    welcomeMessageFocusNode2?.dispose();
    welcomeMessageTextController2?.dispose();

    drawerModel2.dispose();
  }

  /// Additional helper methods.
  String? get visibilityValue => visibilityValueController?.value;
  String? get outputValue => outputValueController?.value;
}
