import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/drawer/drawer_widget.dart';
import '/index.dart';
import 'choose_your_instance_widget.dart' show ChooseYourInstanceWidget;
import 'package:flutter/material.dart';

class ChooseYourInstanceModel
    extends FlutterFlowModel<ChooseYourInstanceWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ChooseYourInstance widget.
  List<AccessRecord>? access;
  // Stores action output result for [Firestore Query - Query a collection] action in ChooseYourInstance widget.
  ParamsRecord? instanceData;
  // Stores action output result for [Backend Call - Read Document] action in ChooseYourInstance widget.
  ParamsRecord? instance;
  // Model for Drawer component.
  late DrawerModel drawerModel;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  ParamsRecord? newInstance;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel.dispose();
  }
}
