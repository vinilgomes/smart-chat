import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/chat_thread_tile/chat_thread_tile_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_model.dart';
export 'drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (FFAppState().instanceReference?.id == null ||
          FFAppState().instanceReference?.id == '') {
        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
      }
      _model.myPromptList = await queryPromptRecordOnce(
        queryBuilder: (promptRecord) => promptRecord
            .where(
              'created_by',
              isEqualTo: currentUserReference,
            )
            .where(
              'instanceId',
              isEqualTo: FFAppState().instanceReference,
            ),
      );
      _model.instancePromptList = await queryPromptRecordOnce(
        queryBuilder: (promptRecord) => promptRecord
            .where(
              'visibility',
              isEqualTo: 'INSTANCE',
            )
            .where(
              'instanceId',
              isEqualTo: FFAppState().instanceReference,
            ),
      );
      _model.isLoading = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AccessRecord>>(
      stream: queryAccessRecord(
        queryBuilder: (accessRecord) => accessRecord
            .where(
              'user_uid',
              isEqualTo: currentUserReference,
            )
            .where(
              'instance_id',
              isEqualTo: FFAppState().instanceReference,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<AccessRecord> stackAccessRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final stackAccessRecord = stackAccessRecordList.isNotEmpty
            ? stackAccessRecordList.first
            : null;

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            ChatWidget.routeName,
                            pathParameters: {
                              'instance': serializeParam(
                                FFAppState().instanceId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().instanceLogo,
                                        'https://firebasestorage.googleapis.com/v0/b/smart-chat-nzr5bd.firebasestorage.app/o/smart-chat-logo.png?alt=media&token=0350b3ea-7f8c-482b-9da2-984413e16b27',
                                      ),
                                      width: 100.0,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 100.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isAdmin, false))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            InstanceConfigWidget.routeName,
                                            pathParameters: {
                                              'instance': serializeParam(
                                                FFAppState().instanceReference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              valueOrDefault<String>(
                                FFAppState().instanceName,
                                'Smart Chat',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () async {
                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintText: 'Procure um agente',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FontStyle.italic,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!_model.isLoading)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  color: Color(0x00000000),
                                  child: ExpandableNotifier(
                                    controller:
                                        _model.expandableExpandableController1,
                                    child: ExpandablePanel(
                                      header: Text(
                                        'Meus agentes',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      collapsed: Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      expanded: Builder(
                                        builder: (context) {
                                          final myPrompts = _model.myPromptList
                                                  ?.where((e) =>
                                                      _model.textController.text
                                                          .isEmpty ||
                                                      e.promptName
                                                          .toLowerCase()
                                                          .contains(_model
                                                              .textController
                                                              .text
                                                              .toLowerCase()) ||
                                                      e.promptDescription
                                                          .toLowerCase()
                                                          .contains(_model
                                                              .textController
                                                              .text
                                                              .toLowerCase()))
                                                  .toList()
                                                  .toList() ??
                                              [];
                                          if (myPrompts.isEmpty) {
                                            return Center(
                                              child: EmptyListWidget(
                                                imgUrl: '',
                                              ),
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: myPrompts.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 5.0),
                                            itemBuilder:
                                                (context, myPromptsIndex) {
                                              final myPromptsItem =
                                                  myPrompts[myPromptsIndex];
                                              return Stack(
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .chatThreadTileModels1
                                                        .getModel(
                                                      myPromptsItem
                                                          .reference.id,
                                                      myPromptsIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ChatThreadTileWidget(
                                                      key: Key(
                                                        'Keyq44_${myPromptsItem.reference.id}',
                                                      ),
                                                      label: dateTimeFormat(
                                                        "relative",
                                                        myPromptsItem.createdAt,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      title: myPromptsItem
                                                          .promptName,
                                                      excerpt: myPromptsItem
                                                          .promptDescription,
                                                      active: false,
                                                      tapAction: () async {
                                                        context.pushNamed(
                                                          ChatWidget.routeName,
                                                          pathParameters: {
                                                            'instance':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .instanceId,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          queryParameters: {
                                                            'promptId':
                                                                serializeParam(
                                                              myPromptsItem
                                                                  .promptId,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            PromptConfigWidget
                                                                .routeName,
                                                            pathParameters: {
                                                              'instance':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .instanceId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'promptId':
                                                                  serializeParam(
                                                                myPromptsItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.edit_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.isLoading)
                              Text(
                                'carregando...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                color: Color(0x00000000),
                                child: ExpandableNotifier(
                                  controller:
                                      _model.expandableExpandableController2,
                                  child: ExpandablePanel(
                                    header: Text(
                                      'Agentes globais',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    collapsed: Container(
                                      width: 0.0,
                                      height: 0.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    expanded: Builder(
                                      builder: (context) {
                                        final instancePrompts = _model
                                                .instancePromptList
                                                ?.where((e) =>
                                                    _model.textController.text
                                                        .isEmpty ||
                                                    e.promptName
                                                        .toLowerCase()
                                                        .contains(_model
                                                            .textController.text
                                                            .toLowerCase()) ||
                                                    e.promptDescription
                                                        .toLowerCase()
                                                        .contains(_model
                                                            .textController.text
                                                            .toLowerCase()))
                                                .toList()
                                                .toList() ??
                                            [];
                                        if (instancePrompts.isEmpty) {
                                          return Center(
                                            child: EmptyListWidget(
                                              imgUrl: '',
                                            ),
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: instancePrompts.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 5.0),
                                          itemBuilder:
                                              (context, instancePromptsIndex) {
                                            final instancePromptsItem =
                                                instancePrompts[
                                                    instancePromptsIndex];
                                            return Stack(
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .chatThreadTileModels2
                                                      .getModel(
                                                    instancePromptsItem
                                                        .reference.id,
                                                    instancePromptsIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: ChatThreadTileWidget(
                                                    key: Key(
                                                      'Key7sv_${instancePromptsItem.reference.id}',
                                                    ),
                                                    label: dateTimeFormat(
                                                      "relative",
                                                      instancePromptsItem
                                                          .createdAt,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    title: instancePromptsItem
                                                        .promptName,
                                                    excerpt: instancePromptsItem
                                                        .promptDescription,
                                                    active: false,
                                                    tapAction: () async {
                                                      context.pushNamed(
                                                        ChatWidget.routeName,
                                                        pathParameters: {
                                                          'instance':
                                                              serializeParam(
                                                            FFAppState()
                                                                .instanceId,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        queryParameters: {
                                                          'promptId':
                                                              serializeParam(
                                                            instancePromptsItem
                                                                .promptId,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.isLoading)
                              Text(
                                'carregando...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if ((FFAppState().instanceType == 'enterprise') ||
                        (stackAccessRecord?.role != Role.MEMBER))
                      FlutterFlowIconButton(
                        borderRadius: 32.0,
                        buttonSize: 56.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.assistant,
                          color: FlutterFlowTheme.of(context).info,
                          size: 28.0,
                        ),
                        onPressed: () async {
                          var promptRecordReference =
                              PromptRecord.collection.doc();
                          await promptRecordReference
                              .set(createPromptRecordData(
                            instanceId: FFAppState().instanceReference,
                            createdBy: currentUserReference,
                            createdAt: getCurrentTimestamp,
                            visibility: 'INDIVIDUAL',
                            promptName: 'Novo agente',
                            promptId:
                                '${FFAppState().instanceId}-${random_data.randomString(
                              8,
                              8,
                              true,
                              true,
                              true,
                            )}',
                            temperature: 1.0,
                            topP: 1.0,
                            isPublished: true,
                            promptDescription: '',
                            systemPrompt: '',
                            instructions: '',
                            chatWelcomeMessage: '',
                            webSearch: false,
                          ));
                          _model.newprompt = PromptRecord.getDocumentFromData(
                              createPromptRecordData(
                                instanceId: FFAppState().instanceReference,
                                createdBy: currentUserReference,
                                createdAt: getCurrentTimestamp,
                                visibility: 'INDIVIDUAL',
                                promptName: 'Novo agente',
                                promptId:
                                    '${FFAppState().instanceId}-${random_data.randomString(
                                  8,
                                  8,
                                  true,
                                  true,
                                  true,
                                )}',
                                temperature: 1.0,
                                topP: 1.0,
                                isPublished: true,
                                promptDescription: '',
                                systemPrompt: '',
                                instructions: '',
                                chatWelcomeMessage: '',
                                webSearch: false,
                              ),
                              promptRecordReference);
                          _model.vectorstore = await OpenAIAPIGroup
                              .createVectorStoreNoFilesCall
                              .call(
                            name: _model.newprompt?.reference.id,
                            apiKey: FFAppState().openAIAPIKey,
                          );

                          await _model.newprompt!.reference
                              .update(createPromptRecordData(
                            vectorStoreId: getJsonField(
                              (_model.vectorstore?.jsonBody ?? ''),
                              r'''$.id''',
                            ).toString(),
                          ));

                          context.pushNamed(
                            PromptConfigWidget.routeName,
                            pathParameters: {
                              'instance': serializeParam(
                                FFAppState().instanceId,
                                ParamType.String,
                              ),
                              'promptId': serializeParam(
                                _model.newprompt?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );

                          safeSetState(() {});
                        },
                      ),
                    if (valueOrDefault<bool>(
                        currentUserDocument?.isAdmin, false))
                      AuthUserStreamWidget(
                        builder: (context) => FlutterFlowIconButton(
                          borderRadius: 32.0,
                          buttonSize: 56.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.code,
                            color: FlutterFlowTheme.of(context).info,
                            size: 28.0,
                          ),
                          onPressed: () async {
                            var functionRecordReference =
                                FunctionRecord.collection.doc();
                            await functionRecordReference
                                .set(createFunctionRecordData(
                              name: 'Nova Função',
                            ));
                            _model.newfunction =
                                FunctionRecord.getDocumentFromData(
                                    createFunctionRecordData(
                                      name: 'Nova Função',
                                    ),
                                    functionRecordReference);

                            context.pushNamed(
                              FunctionConfigWidget.routeName,
                              pathParameters: {
                                'functionId': serializeParam(
                                  _model.newfunction?.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            safeSetState(() {});
                          },
                        ),
                      ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
