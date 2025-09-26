import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_instances_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navigation/drawer/drawer_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'choose_your_instance_widget.dart' show ChooseYourInstanceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
