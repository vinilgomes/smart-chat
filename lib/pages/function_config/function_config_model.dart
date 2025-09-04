import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/drawer/drawer_widget.dart';
import '/index.dart';
import 'function_config_widget.dart' show FunctionConfigWidget;
import 'package:flutter/material.dart';

class FunctionConfigModel extends FlutterFlowModel<FunctionConfigWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in FunctionConfig widget.
  FunctionRecord? function;
  // Model for Drawer component.
  late DrawerModel drawerModel1;
  // State field(s) for functionName widget.
  FocusNode? functionNameFocusNode;
  TextEditingController? functionNameTextController;
  String? Function(BuildContext, String?)? functionNameTextControllerValidator;
  String? _functionNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nome da função é obrigatório';
    }

    return null;
  }

  // State field(s) for functionDescription widget.
  FocusNode? functionDescriptionFocusNode;
  TextEditingController? functionDescriptionTextController;
  String? Function(BuildContext, String?)?
      functionDescriptionTextControllerValidator;
  String? _functionDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Descrição da função é obrigatória.';
    }

    return null;
  }

  // State field(s) for shortDescription widget.
  FocusNode? shortDescriptionFocusNode;
  TextEditingController? shortDescriptionTextController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextControllerValidator;
  // State field(s) for functionArguments widget.
  FocusNode? functionArgumentsFocusNode;
  TextEditingController? functionArgumentsTextController;
  String? Function(BuildContext, String?)?
      functionArgumentsTextControllerValidator;
  String? _functionArgumentsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'JSON dos argumentos da função é obrigatório.';
    }

    return null;
  }

  // State field(s) for workFlowId widget.
  FocusNode? workFlowIdFocusNode;
  TextEditingController? workFlowIdTextController;
  String? Function(BuildContext, String?)? workFlowIdTextControllerValidator;
  // Model for Drawer component.
  late DrawerModel drawerModel2;

  @override
  void initState(BuildContext context) {
    drawerModel1 = createModel(context, () => DrawerModel());
    functionNameTextControllerValidator = _functionNameTextControllerValidator;
    functionDescriptionTextControllerValidator =
        _functionDescriptionTextControllerValidator;
    functionArgumentsTextControllerValidator =
        _functionArgumentsTextControllerValidator;
    drawerModel2 = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel1.dispose();
    functionNameFocusNode?.dispose();
    functionNameTextController?.dispose();

    functionDescriptionFocusNode?.dispose();
    functionDescriptionTextController?.dispose();

    shortDescriptionFocusNode?.dispose();
    shortDescriptionTextController?.dispose();

    functionArgumentsFocusNode?.dispose();
    functionArgumentsTextController?.dispose();

    workFlowIdFocusNode?.dispose();
    workFlowIdTextController?.dispose();

    drawerModel2.dispose();
  }
}
