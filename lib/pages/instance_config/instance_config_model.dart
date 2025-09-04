import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navigation/drawer/drawer_widget.dart';
import '/index.dart';
import 'instance_config_widget.dart' show InstanceConfigWidget;
import 'package:flutter/material.dart';

class InstanceConfigModel extends FlutterFlowModel<InstanceConfigWidget> {
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

  List<AccessRecord> accessList = [];
  void addToAccessList(AccessRecord item) => accessList.add(item);
  void removeFromAccessList(AccessRecord item) => accessList.remove(item);
  void removeAtIndexFromAccessList(int index) => accessList.removeAt(index);
  void insertAtIndexInAccessList(int index, AccessRecord item) =>
      accessList.insert(index, item);
  void updateAccessListAtIndex(int index, Function(AccessRecord) updateFn) =>
      accessList[index] = updateFn(accessList[index]);

  List<FunctionRecord> functionList = [];
  void addToFunctionList(FunctionRecord item) => functionList.add(item);
  void removeFromFunctionList(FunctionRecord item) => functionList.remove(item);
  void removeAtIndexFromFunctionList(int index) => functionList.removeAt(index);
  void insertAtIndexInFunctionList(int index, FunctionRecord item) =>
      functionList.insert(index, item);
  void updateFunctionListAtIndex(
          int index, Function(FunctionRecord) updateFn) =>
      functionList[index] = updateFn(functionList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in InstanceConfig widget.
  List<AccessRecord>? access;
  // Stores action output result for [Firestore Query - Query a collection] action in InstanceConfig widget.
  List<AccessRecord>? listaFull;
  // Stores action output result for [Backend Call - Read Document] action in InstanceConfig widget.
  ParamsRecord? instanceData;
  // Stores action output result for [Backend Call - API (createVectorStoreNoFiles)] action in InstanceConfig widget.
  ApiCallResponse? newVs;
  // Stores action output result for [Backend Call - API (listVectorStoreFiles)] action in InstanceConfig widget.
  ApiCallResponse? files;
  // Stores action output result for [Firestore Query - Query a collection] action in InstanceConfig widget.
  List<FunctionRecord>? functionListPageLoad;
  // Model for Drawer component.
  late DrawerModel drawerModel1;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for id widget.
  FocusNode? idFocusNode;
  TextEditingController? idTextController;
  String? Function(BuildContext, String?)? idTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading_instancePhoto = false;
  FFUploadedFile uploadedLocalFile_instancePhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_instancePhoto = '';

  // State field(s) for instanceType widget.
  FormFieldController<String>? instanceTypeValueController;
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
  // State field(s) for assistantName widget.
  FocusNode? assistantNameFocusNode;
  TextEditingController? assistantNameTextController;
  String? Function(BuildContext, String?)? assistantNameTextControllerValidator;
  // State field(s) for welcomeMessage widget.
  FocusNode? welcomeMessageFocusNode;
  TextEditingController? welcomeMessageTextController;
  String? Function(BuildContext, String?)?
      welcomeMessageTextControllerValidator;
  bool isDataUploading_assistantPhoto = false;
  FFUploadedFile uploadedLocalFile_assistantPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_assistantPhoto = '';

  bool isDataUploading_upload = false;
  List<FFUploadedFile> uploadedLocalFiles_upload = [];

  // Stores action output result for [Backend Call - API (createFile)] action in Button widget.
  ApiCallResponse? file;
  // Stores action output result for [Backend Call - API (createVectorStoreFile)] action in Button widget.
  ApiCallResponse? vsFile;
  // Stores action output result for [Backend Call - API (listVectorStoreFiles)] action in Button widget.
  ApiCallResponse? filesAdd;
  // Stores action output result for [Backend Call - API (deleteFile)] action in IconButton widget.
  ApiCallResponse? deleteFile;
  // Stores action output result for [Backend Call - API (listVectorStoreFiles)] action in IconButton widget.
  ApiCallResponse? filesDelete;
  // State field(s) for web_search_preview widget.
  bool? webSearchPreviewValue;
  // State field(s) for openAIKey widget.
  FocusNode? openAIKeyFocusNode;
  TextEditingController? openAIKeyTextController;
  late bool openAIKeyVisibility;
  String? Function(BuildContext, String?)? openAIKeyTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O e-mail é obrigatório.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  UsersRecord? account;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  AccessRecord? userHasAccess;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AccessRecord? userNewAccess;
  // Stores action output result for [Backend Call - API (Send Mail)] action in IconButton widget.
  ApiCallResponse? emailUsuarioExistente;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  AccessRecord? nonUserHasAccess;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AccessRecord? nonUserNewAccess;
  // Stores action output result for [Backend Call - API (Send Mail)] action in IconButton widget.
  ApiCallResponse? emailUsuarioNaoExistente;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<AccessRecord>? accessUnblocked;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<AccessRecord>? accessBlocked;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FunctionRecord? newfunction;
  // State field(s) for pesquisaFunction widget.
  FocusNode? pesquisaFunctionFocusNode;
  TextEditingController? pesquisaFunctionTextController;
  String? Function(BuildContext, String?)?
      pesquisaFunctionTextControllerValidator;
  // Model for Drawer component.
  late DrawerModel drawerModel2;

  @override
  void initState(BuildContext context) {
    drawerModel1 = createModel(context, () => DrawerModel());
    openAIKeyVisibility = false;
    emailTextControllerValidator = _emailTextControllerValidator;
    drawerModel2 = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel1.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    idFocusNode?.dispose();
    idTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    systemPromptFocusNode?.dispose();
    systemPromptTextController?.dispose();

    instructionsFocusNode?.dispose();
    instructionsTextController?.dispose();

    assistantNameFocusNode?.dispose();
    assistantNameTextController?.dispose();

    welcomeMessageFocusNode?.dispose();
    welcomeMessageTextController?.dispose();

    openAIKeyFocusNode?.dispose();
    openAIKeyTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    pesquisaFunctionFocusNode?.dispose();
    pesquisaFunctionTextController?.dispose();

    drawerModel2.dispose();
  }

  /// Additional helper methods.
  String? get instanceTypeValue => instanceTypeValueController?.value;
}
