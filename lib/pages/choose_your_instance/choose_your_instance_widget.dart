import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_instances_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/drawer/drawer_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_your_instance_model.dart';
export 'choose_your_instance_model.dart';

class ChooseYourInstanceWidget extends StatefulWidget {
  const ChooseYourInstanceWidget({
    super.key,
    this.instance,
  });

  final String? instance;

  static String routeName = 'ChooseYourInstance';
  static String routePath = '/:instance';

  @override
  State<ChooseYourInstanceWidget> createState() =>
      _ChooseYourInstanceWidgetState();
}

class _ChooseYourInstanceWidgetState extends State<ChooseYourInstanceWidget> {
  late ChooseYourInstanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseYourInstanceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.access = await queryAccessRecordOnce(
        queryBuilder: (accessRecord) => accessRecord
            .where(
              'user_uid',
              isEqualTo: currentUserReference,
            )
            .where(
              'instance_id',
              isNotEqualTo: null,
            ),
      );
      if (widget.instance != null && widget.instance != '') {
        _model.instanceData = await queryParamsRecordOnce(
          queryBuilder: (paramsRecord) => paramsRecord.where(
            'instance_id',
            isEqualTo: widget.instance,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.access!
            .where((e) => e.instanceId == _model.instanceData?.reference)
            .toList()
            .isNotEmpty) {
          context.pushNamed(
            ChatWidget.routeName,
            pathParameters: {
              'instance': serializeParam(
                widget.instance,
                ParamType.String,
              ),
            }.withoutNulls,
            queryParameters: {
              'promptId': serializeParam(
                null,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
      } else {
        if (_model.access?.length == 1) {
          _model.instance = await ParamsRecord.getDocumentOnce(
              _model.access!.firstOrNull!.instanceId!);
          FFAppState().instanceId = _model.instance!.instanceId;
          safeSetState(() {});

          context.pushNamed(
            ChatWidget.routeName,
            pathParameters: {
              'instance': serializeParam(
                _model.instance?.instanceId,
                ParamType.String,
              ),
            }.withoutNulls,
            queryParameters: {
              'promptId': serializeParam(
                null,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
      }

      _model.isLoading = false;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        floatingActionButton: Visibility(
          visible: valueOrDefault<bool>(currentUserDocument?.isAdmin, false),
          child: AuthUserStreamWidget(
            builder: (context) => FloatingActionButton.extended(
              onPressed: () async {
                var paramsRecordReference = ParamsRecord.collection.doc();
                await paramsRecordReference.set(createParamsRecordData(
                  instanceName: 'Nova instância',
                  instanceId: random_data.randomString(
                    8,
                    8,
                    true,
                    true,
                    true,
                  ),
                  instanceType: 'DEMO',
                ));
                _model.newInstance = ParamsRecord.getDocumentFromData(
                    createParamsRecordData(
                      instanceName: 'Nova instância',
                      instanceId: random_data.randomString(
                        8,
                        8,
                        true,
                        true,
                        true,
                      ),
                      instanceType: 'DEMO',
                    ),
                    paramsRecordReference);

                await AccessRecord.collection.doc().set(createAccessRecordData(
                      userUid: currentUserReference,
                      role: Role.OWNER,
                      instanceId: _model.newInstance?.reference,
                      status: 'READY',
                    ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Instância criada.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );

                context.pushNamed(
                  InstanceConfigWidget.routeName,
                  pathParameters: {
                    'instance': serializeParam(
                      _model.newInstance?.reference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );

                safeSetState(() {});
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  Text(
                    'Criar instância',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Container(
          width: 300.0,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 300.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: wrapWithModel(
                model: _model.drawerModel,
                updateCallback: () => safeSetState(() {}),
                child: DrawerWidget(),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/Gridwave-Black.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.5,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).tertiary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 0.5, 1.0],
                    begin: AlignmentDirectional(0.94, 1.0),
                    end: AlignmentDirectional(-0.94, -1.0),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x7F14181B),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Container(
                    width: 100.0,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      minWidth: 300.0,
                    ),
                    decoration: BoxDecoration(),
                  ),
                if (!_model.isLoading)
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 24.0, 24.0),
                        child: Builder(
                          builder: (context) {
                            final lista = _model.access?.toList() ?? [];
                            if (lista.isEmpty) {
                              return EmptyInstancesWidget(
                                imgUrl: '',
                              );
                            }

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 1;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 2;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 3;
                                  } else {
                                    return 3;
                                  }
                                }(),
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: lista.length,
                              itemBuilder: (context, listaIndex) {
                                final listaItem = lista[listaIndex];
                                return StreamBuilder<ParamsRecord>(
                                  stream: ParamsRecord.getDocument(
                                      listaItem.instanceId!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final containerParamsRecord =
                                        snapshot.data!;

                                    return Material(
                                      color: Colors.transparent,
                                      elevation: 20.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondary
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(-1.0, 0.0),
                                            end: AlignmentDirectional(1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  ChatWidget.routeName,
                                                  pathParameters: {
                                                    'instance': serializeParam(
                                                      containerParamsRecord
                                                          .instanceId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  queryParameters: {
                                                    'promptId': serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      containerParamsRecord
                                                          .instanceName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Hero(
                                                    tag: containerParamsRecord
                                                        .instancePhoto,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: Image.network(
                                                        containerParamsRecord
                                                            .instancePhoto,
                                                        width: 160.0,
                                                        height: 160.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width: 160.0,
                                                          height: 160.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if ((listaItem.role ==
                                                    Role.OWNER) ||
                                                (listaItem.role == Role.EDITOR))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 10.0, 0.0),
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
                                                        InstanceConfigWidget
                                                            .routeName,
                                                        pathParameters: {
                                                          'instance':
                                                              serializeParam(
                                                            containerParamsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.edit_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.pushNamedAuth(
                            LandingWidget.routeName, context.mounted);
                      },
                      child: Icon(
                        Icons.logout,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.pushNamedAuth(
                            LandingWidget.routeName, context.mounted);
                      },
                      child: Text(
                        'Sair',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
