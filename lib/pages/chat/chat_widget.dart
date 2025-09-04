import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/empty_messages_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/navigation/drawer/drawer_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    String? instance,
    this.promptId,
  }) : this.instance = instance ?? 'pdcase';

  final String instance;
  final String? promptId;

  static String routeName = 'Chat';
  static String routePath = '/:instance/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.validaAcesso(
        context,
        instance: widget.instance,
        prompt: widget.promptId,
      );
      safeSetState(() {});
      _model.instanceParams = await queryParamsRecordOnce(
        queryBuilder: (paramsRecord) => paramsRecord.where(
          'instance_id',
          isEqualTo: valueOrDefault<String>(
            widget.instance,
            'pdcase',
          ),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().chatSystemPrompt =
          'Você é um assistente inteligente operando dentro da instância ${_model.instanceParams?.instanceName} com ID ${_model.instanceParams?.reference.id}. Seu comportamento obedece a uma hierarquia de instruções organizada em três níveis:🔹 **Nível 1 – Instância (prioridade máxima)**  As diretrizes globais da instância definem como a organização se comunica, seus limites éticos e legais, tom de voz, escopo de atuação e finalidades desejadas.  Essas regras têm **prioridade absoluta** e se sobrepõem a qualquer instrução posterior, inclusive as emitidas por agentes ou prompts individuais. Diretrizes da instância:  ${_model.instanceParams?.systemPrompt}';
      FFAppState().instanceName = _model.instanceParams!.instanceName;
      FFAppState().instanceLogo = _model.instanceParams!.instancePhoto;
      FFAppState().assistantName = _model.instanceParams!.assistantName;
      FFAppState().vectorStoreId = _model.instanceParams!.vectorStoreId;
      FFAppState().chatWelcomeMessage =
          _model.instanceParams!.chatWelcomeMessage;
      FFAppState().instancePersona = _model.instanceParams!.instancePersona;
      FFAppState().openAIAPIKey = _model.instanceParams!.openaiKey;
      FFAppState().chatInstructions =
          'Você é um assistente inteligente operando dentro da instância ${_model.instanceParams?.instanceName}Seu comportamento obedece a uma hierarquia de instruções organizada em três níveis:🔹 **Nível 1 – Instância (prioridade máxima)**  As diretrizes globais da instância definem como a organização se comunica, seus limites éticos e legais, tom de voz, escopo de atuação e finalidades desejadas.  Essas regras têm **prioridade absoluta** e se sobrepõem a qualquer instrução posterior, inclusive as emitidas por agentes ou prompts individuais. Diretrizes da instância:  ${_model.instanceParams?.chatInstructions}';
      FFAppState().instanceId = _model.instanceParams!.instanceId;
      FFAppState().instanceReference = _model.instanceParams?.reference;
      FFAppState().instanceType = _model.instanceParams!.instanceType;
      FFAppState().topP = 1.0;
      FFAppState().temperature = 1.0;
      FFAppState().webSearch = _model.instanceParams!.webSearch;
      safeSetState(() {});
      // limpa lista de funções
      _model.functionList = [];
      safeSetState(() {});
      if (widget.promptId == null || widget.promptId == '') {
        _model.instanceMessageList = await action_blocks.loadMessages(
          context,
          prompt: null,
          instance: _model.instanceParams?.reference,
        );
        _model.messages =
            _model.instanceMessageList!.toList().cast<ThreadMessageStruct>();
        safeSetState(() {});
      }
      if (widget.promptId != null && widget.promptId != '') {
        _model.prompt = await queryPromptRecordOnce(
          queryBuilder: (promptRecord) => promptRecord.where(
            'promptId',
            isEqualTo: widget.promptId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().chatSystemPrompt =
            '${FFAppState().chatSystemPrompt}🔹 **Nível 3 – Prompt/Tarefa (comando específico)**  Você recebeu uma tarefa ou comando contextual nesta conversa.  Essa tarefa pode ajustar sua linguagem, formato de saída, exemplos utilizados ou foco da resposta. No entanto, **nunca pode contradizer as regras do agente ou da instância**.Objetivo deste prompt, de nome ${_model.prompt?.promptName} e promptId ${_model.prompt?.reference.id} é:${_model.prompt?.systemPrompt}⚠️ **IMPORTANTE:**  Se houver qualquer incompatibilidade entre níveis, siga esta ordem de precedência:1. **Instância** > 2. **Agente** > 3. **Prompt**.  Você pode adaptar a forma de entrega (linguagem, estrutura, exemplos), mas jamais deve violar ou ignorar as regras estabelecidas pela instância.';
        FFAppState().vectorStoreId = _model.prompt!.vectorStoreId;
        FFAppState().chatWelcomeMessage = _model.prompt!.chatWelcomeMessage;
        FFAppState().chatInstructions =
            '${FFAppState().chatInstructions}🔹 **Nível 3 – Prompt/Tarefa (comando específico)**  Você recebeu uma tarefa ou comando contextual nesta conversa.  Essa tarefa pode ajustar sua linguagem, formato de saída, exemplos utilizados ou foco da resposta. No entanto, **nunca pode contradizer as regras do agente ou da instância**.Objetivo deste prompt:  ${_model.prompt?.instructions}⚠️ **IMPORTANTE:**  Se houver qualquer incompatibilidade entre níveis, siga esta ordem de precedência:1. **Instância** > 2. **Agente** > 3. **Prompt**.  Você pode adaptar a forma de entrega (linguagem, estrutura, exemplos), mas jamais deve violar ou ignorar as regras estabelecidas pela instância.';
        FFAppState().temperature = _model.prompt!.temperature;
        FFAppState().topP = _model.prompt!.topP;
        FFAppState().webSearch = _model.prompt!.webSearch;
        safeSetState(() {});
        for (int loop1Index = 0;
            loop1Index < _model.prompt!.functions.length;
            loop1Index++) {
          final currentLoop1Item = _model.prompt!.functions[loop1Index];
          _model.item = await FunctionRecord.getDocumentOnce(currentLoop1Item);
          _model.addToFunctionList(_model.item!);
          safeSetState(() {});
        }
        _model.promptMessageList = await action_blocks.loadMessages(
          context,
          prompt: _model.prompt?.reference,
          instance: _model.instanceParams?.reference,
        );
        _model.messages =
            _model.promptMessageList!.toList().cast<ThreadMessageStruct>();
        safeSetState(() {});
      }
      _model.isLoading = false;
      safeSetState(() {});
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.userMessageTextController ??= TextEditingController();
    _model.userMessageFocusNode ??= FocusNode();

    animationsMap.addAll({
      'blurOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
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
                model: _model.drawerModel2,
                updateCallback: () => safeSetState(() {}),
                child: DrawerWidget(),
              ),
            ),
          ),
        ),
        body: Visibility(
          visible: !_model.isLoading,
          child: Stack(
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
                      child: wrapWithModel(
                        model: _model.drawerModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: DrawerWidget(),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final message = _model.messages
                                    .where((e) => e.visible)
                                    .toList();
                                if (message.isEmpty) {
                                  return EmptyMessagesWidget(
                                    imgUrl:
                                        _model.instanceParams!.instancePersona,
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    50.0,
                                    0,
                                    valueOrDefault<int>(
                                          functions.mapCharactersCount(_model
                                              .userMessageTextController
                                              .text
                                              .length),
                                          82,
                                        ) +
                                        100,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: message.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 20.0),
                                  itemBuilder: (context, messageIndex) {
                                    final messageItem = message[messageIndex];
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 1000.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            key: ValueKey('Message_ajbd'),
                                            child: wrapWithModel(
                                              model:
                                                  _model.messageModels.getModel(
                                                messageIndex.toString(),
                                                messageIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MessageWidget(
                                                key: Key(
                                                  'Keyb0d_${messageIndex.toString()}',
                                                ),
                                                type: messageItem.role ==
                                                        'assistant'
                                                    ? valueOrDefault<String>(
                                                        getJsonField(
                                                          functions
                                                              .parsePartialJson(
                                                                  messageItem
                                                                      .content
                                                                      .firstOrNull!
                                                                      .text),
                                                          r'''$.type''',
                                                        )?.toString(),
                                                        'TextMessage',
                                                      )
                                                    : 'TextMessage',
                                                isUser:
                                                    messageItem.role == 'user'
                                                        ? true
                                                        : false,
                                                data: functions.contentToJson(
                                                    messageItem.content
                                                        .toList()),
                                                rawText: messageItem
                                                    .content.lastOrNull?.text,
                                                img: messageItem.img,
                                                onTap: (prompt) async {},
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  controller: _model.listViewController,
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4.0,
                                  sigmaY: 4.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 700.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 40.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (valueOrDefault<bool>(
                                          _model.suggestions.length > 0,
                                          false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Builder(
                                              builder: (context) {
                                                final suggestion =
                                                    _model.suggestions.toList();

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  controller: _model.row,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            suggestion.length,
                                                            (suggestionIndex) {
                                                      final suggestionItem =
                                                          suggestion[
                                                              suggestionIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.userMessageTextController
                                                                    ?.text =
                                                                suggestionItem;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Text(
                                                                suggestionItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!,
                                                        effects: [
                                                          VisibilityEffect(
                                                              duration: max(
                                                                      1.0,
                                                                      [
                                                                            suggestionIndex *
                                                                                200
                                                                          ].reduce((curr, next) => curr < next
                                                                              ? curr
                                                                              : next) ??
                                                                          0)
                                                                  .toInt()
                                                                  .ms),
                                                          FadeEffect(
                                                            curve: Curves
                                                                .easeInOutQuint,
                                                            delay:
                                                                (suggestionIndex *
                                                                        200)
                                                                    .ms,
                                                            duration: 600.0.ms,
                                                            begin: 0.0,
                                                            end: 1.0,
                                                          ),
                                                        ],
                                                      );
                                                    })
                                                        .divide(SizedBox(
                                                            width: 10.0))
                                                        .addToStart(SizedBox(
                                                            width: 80.0))
                                                        .addToEnd(SizedBox(
                                                            width: 20.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (false)
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.isRecording) {
                                                        return FlutterFlowIconButton(
                                                          borderRadius: 20.0,
                                                          buttonSize: 40.0,
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                          icon: Icon(
                                                            Icons.stop_circle,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            // Stop the recording
                                                            await stopAudioRecording(
                                                              audioRecorder: _model
                                                                  .audioRecorder,
                                                              audioName:
                                                                  'recordedFileBytes',
                                                              onRecordingComplete:
                                                                  (audioFilePath,
                                                                      audioBytes) {
                                                                _model.recordedAudio =
                                                                    audioFilePath;
                                                                _model.recordedFileBytes =
                                                                    audioBytes;
                                                              },
                                                            );

                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadDataNec =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading_uploadDataNec =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadDataNec =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl_uploadDataNec =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            if (isWeb) {
                                                              // Set recordedAudioFile
                                                              _model.recordedAudioFile =
                                                                  _model
                                                                      .recordedFileBytes;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              // Fix audio format
                                                              _model.renamedAudioFile =
                                                                  await actions
                                                                      .renameAudio(
                                                                _model
                                                                    .recordedFileBytes,
                                                                _model
                                                                    .recordedAudio!,
                                                              );
                                                              // Set recordedAudioFile
                                                              _model.recordedAudioFile =
                                                                  _model
                                                                      .renamedAudioFile;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            // Set isRecording to false
                                                            _model.isRecording =
                                                                false;
                                                            safeSetState(() {});

                                                            safeSetState(() {});
                                                          },
                                                        );
                                                      } else {
                                                        return FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          buttonSize: 40.0,
                                                          hoverColor:
                                                              Color(0x40FFFFFF),
                                                          icon: Icon(
                                                            Icons.mic,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.isRecording =
                                                                true;
                                                            safeSetState(() {});
                                                            // Capture user input
                                                            await startAudioRecording(
                                                              context,
                                                              audioRecorder: _model
                                                                      .audioRecorder ??=
                                                                  AudioRecorder(),
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    // Upload image to Firebase
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      maxWidth: 1000.00,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading_uploadDataQ38 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading_uploadDataQ38 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile_uploadDataQ38 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl_uploadDataQ38 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        safeSetState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload data');
                                                        return;
                                                      }
                                                    }

                                                    if (_model.messages
                                                            .lastOrNull?.role ==
                                                        'user') {
                                                      // Update last message in the list to include image
                                                      _model
                                                          .updateMessagesAtIndex(
                                                        _model.messages.length -
                                                            1,
                                                        (e) => e
                                                          ..updateContent(
                                                            (e) => e.add(
                                                                ContentStruct(
                                                              type: 'image_url',
                                                              imageUrl:
                                                                  ImageUrlStruct(
                                                                url: _model
                                                                    .uploadedFileUrl_uploadDataQ38,
                                                              ),
                                                            )),
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      // Add new message
                                                      _model.addToMessages(
                                                          ThreadMessageStruct(
                                                        role: 'user',
                                                        content: functions
                                                            .buildContent(
                                                                null,
                                                                _model
                                                                    .uploadedFileUrl_uploadDataQ38),
                                                        visible: false,
                                                        img: _model
                                                            .uploadedFileUrl_uploadDataQ38,
                                                      ));
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.image_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 28.0,
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  disabledIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.picture_as_pdf,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: _model
                                                          .isDataUploading_uploadData5tf
                                                      ? null
                                                      : () async {
                                                          // Upload image to Firebase
                                                          final selectedFiles =
                                                              await selectFiles(
                                                            multiFile: false,
                                                          );
                                                          if (selectedFiles !=
                                                              null) {
                                                            safeSetState(() =>
                                                                _model.isDataUploading_uploadData5tf =
                                                                    true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedFiles
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                          ))
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading_uploadData5tf =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedFiles
                                                                    .length) {
                                                              safeSetState(() {
                                                                _model.uploadedLocalFile_uploadData5tf =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                              });
                                                            } else {
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            }
                                                          }

                                                          _model.file =
                                                              await OpenAIAPIGroup
                                                                  .createFileCall
                                                                  .call(
                                                            file: _model
                                                                .uploadedLocalFile_uploadData5tf,
                                                            apiKey: _model
                                                                .instanceParams
                                                                ?.openaiKey,
                                                          );

                                                          if (_model
                                                                  .messages
                                                                  .lastOrNull
                                                                  ?.role ==
                                                              'user') {
                                                            // Update last message in the list to include file
                                                            _model
                                                                .updateMessagesAtIndex(
                                                              _model.messages
                                                                      .length -
                                                                  1,
                                                              (e) => e
                                                                ..updateContent(
                                                                  (e) => e.add(
                                                                      ContentStruct(
                                                                    type:
                                                                        'input_file',
                                                                    inputFile:
                                                                        InputFileStruct(
                                                                      type:
                                                                          'input_file',
                                                                      fileId:
                                                                          getJsonField(
                                                                        (_model.file?.jsonBody ??
                                                                            ''),
                                                                        r'''$.id''',
                                                                      ).toString(),
                                                                    ),
                                                                  )),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else {
                                                            // Add new message
                                                            _model.addToMessages(
                                                                ThreadMessageStruct(
                                                              role: 'user',
                                                              content: functions.buildContentWithFile(
                                                                  '${getJsonField(
                                                                    (_model.file
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.filename''',
                                                                  ).toString()} adicionado.',
                                                                  getJsonField(
                                                                    (_model.file
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.id''',
                                                                  ).toString()),
                                                              visible: true,
                                                            ));
                                                            safeSetState(() {});
                                                          }

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Arquivo adicionado.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (!_model
                                                              .isRecording) {
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((_model
                                                                        .messages
                                                                        .isNotEmpty) &&
                                                                    _model
                                                                        .messages
                                                                        .lastOrNull!
                                                                        .content
                                                                        .firstOrNull!
                                                                        .hasImageUrl())
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final messageWithImage =
                                                                            _model.messages.lastOrNull?.content.where((e) => e.hasImageUrl()).toList().toList() ??
                                                                                [];

                                                                        return SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          controller:
                                                                              _model.uploadedImageThumbnails,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(messageWithImage.length, (messageWithImageIndex) {
                                                                              final messageWithImageItem = messageWithImage[messageWithImageIndex];
                                                                              return ClipRRect(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                child: Image.network(
                                                                                  messageWithImageItem.imageUrl.url,
                                                                                  width: 72.0,
                                                                                  height: 80.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              );
                                                                            }).divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                TextFormField(
                                                                  key: ValueKey(
                                                                      'UserMessage_qpjx'),
                                                                  controller: _model
                                                                      .userMessageTextController,
                                                                  focusNode: _model
                                                                      .userMessageFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.userMessageTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                                    () async {
                                                                      unawaited(
                                                                        () async {
                                                                          await _model
                                                                              .listViewController
                                                                              ?.animateTo(
                                                                            _model.listViewController!.position.maxScrollExtent,
                                                                            duration:
                                                                                Duration(milliseconds: 100),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                        }(),
                                                                      );
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .sentences,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        false,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Como posso te ajudar hoje?',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    errorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedErrorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            20.0,
                                                                            50.0,
                                                                            20.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  maxLines: 6,
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .userMessageTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    if (!isAndroid &&
                                                                        !isiOS)
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.sentences),
                                                                        );
                                                                      }),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                if (!isWeb) {
                                                                  return Container(
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Lottie
                                                                        .asset(
                                                                      'assets/jsons/Blue_Audio_Waveforms.json',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      animate:
                                                                          true,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Listening...',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 10.0),
                                                    child: MouseRegion(
                                                      opaque: false,
                                                      cursor:
                                                          MouseCursor.defer ??
                                                              MouseCursor.defer,
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
                                                          if (_model
                                                                  .messages
                                                                  .lastOrNull
                                                                  ?.role ==
                                                              'user') {
                                                            // update user message
                                                            _model
                                                                .updateMessagesAtIndex(
                                                              _model.messages
                                                                      .length -
                                                                  1,
                                                              (e) => e
                                                                ..updateContent(
                                                                  (e) => e.add(
                                                                      ContentStruct(
                                                                    type:
                                                                        'text',
                                                                    text: _model
                                                                        .userMessageTextController
                                                                        .text,
                                                                  )),
                                                                )
                                                                ..visible =
                                                                    true,
                                                            );
                                                            safeSetState(() {});
                                                          } else {
                                                            // Add user message
                                                            _model.addToMessages(
                                                                ThreadMessageStruct(
                                                              role: 'user',
                                                              content: functions
                                                                  .buildContent(
                                                                      _model
                                                                          .userMessageTextController
                                                                          .text,
                                                                      null),
                                                            ));
                                                            safeSetState(() {});
                                                          }

                                                          if (!(FFAppState()
                                                                  .conversationId !=
                                                              null)) {
                                                            var conversationRecordReference =
                                                                ConversationRecord
                                                                    .collection
                                                                    .doc();
                                                            await conversationRecordReference
                                                                .set(
                                                                    createConversationRecordData(
                                                              user:
                                                                  currentUserReference,
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              lastMessageAt:
                                                                  getCurrentTimestamp,
                                                              instanceId:
                                                                  FFAppState()
                                                                      .instanceReference,
                                                              promptId: _model
                                                                          .prompt
                                                                          ?.reference !=
                                                                      null
                                                                  ? _model
                                                                      .prompt
                                                                      ?.reference
                                                                  : null,
                                                            ));
                                                            _model.newConversation =
                                                                ConversationRecord
                                                                    .getDocumentFromData(
                                                                        createConversationRecordData(
                                                                          user:
                                                                              currentUserReference,
                                                                          createdAt:
                                                                              getCurrentTimestamp,
                                                                          lastMessageAt:
                                                                              getCurrentTimestamp,
                                                                          instanceId:
                                                                              FFAppState().instanceReference,
                                                                          promptId: _model.prompt?.reference != null
                                                                              ? _model.prompt?.reference
                                                                              : null,
                                                                        ),
                                                                        conversationRecordReference);
                                                            FFAppState()
                                                                    .conversationId =
                                                                _model
                                                                    .newConversation
                                                                    ?.reference;
                                                            safeSetState(() {});
                                                          }

                                                          var messageRecordReference1 =
                                                              MessageRecord.createDoc(
                                                                  FFAppState()
                                                                      .conversationId!);
                                                          await messageRecordReference1
                                                              .set(
                                                                  createMessageRecordData(
                                                            userId:
                                                                currentUserReference,
                                                            role: 'user',
                                                            text: _model
                                                                .userMessageTextController
                                                                .text,
                                                            createdAt:
                                                                getCurrentTimestamp,
                                                          ));
                                                          _model.newMessage = MessageRecord
                                                              .getDocumentFromData(
                                                                  createMessageRecordData(
                                                                    userId:
                                                                        currentUserReference,
                                                                    role:
                                                                        'user',
                                                                    text: _model
                                                                        .userMessageTextController
                                                                        .text,
                                                                    createdAt:
                                                                        getCurrentTimestamp,
                                                                  ),
                                                                  messageRecordReference1);
                                                          // Clear user input
                                                          safeSetState(() {
                                                            _model
                                                                .userMessageTextController
                                                                ?.clear();
                                                          });
                                                          safeSetState(() {
                                                            _model.isDataUploading_uploadData5tf =
                                                                false;
                                                            _model.uploadedLocalFile_uploadData5tf =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []));
                                                          });

                                                          // Scroll to the end of messages
                                                          unawaited(
                                                            () async {
                                                              await _model
                                                                  .listViewController
                                                                  ?.animateTo(
                                                                _model
                                                                    .listViewController!
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        100),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            }(),
                                                          );
                                                          // Initialize assistant message
                                                          _model.addToMessages(
                                                              ThreadMessageStruct(
                                                            role: 'assistant',
                                                            content: functions
                                                                .buildContent(
                                                                    null, null),
                                                          ));
                                                          safeSetState(() {});
                                                          // Reset generatingImage
                                                          _model.generatingImage =
                                                              false;
                                                          safeSetState(() {});
                                                          _model.response =
                                                              await OpenAIAPIGroup
                                                                  .createResponseCall
                                                                  .call(
                                                            responseJsonJson: functions
                                                                .buildResponseJson(
                                                                    null,
                                                                    FFAppState()
                                                                        .chatSystemPrompt,
                                                                    _model
                                                                        .messages
                                                                        .elementAtOrNull(
                                                                            _model.messages.length -
                                                                                2)!
                                                                        .content
                                                                        .lastOrNull!
                                                                        .text,
                                                                    null,
                                                                    FFAppState()
                                                                        .chatInstructions,
                                                                    'text',
                                                                    FFAppState()
                                                                        .temperature,
                                                                    FFAppState()
                                                                        .topP,
                                                                    _model.messages
                                                                                .length >=
                                                                            4
                                                                        ? _model
                                                                            .messages
                                                                            .elementAtOrNull(_model.messages.length -
                                                                                3)
                                                                            ?.content
                                                                            .firstOrNull
                                                                            ?.responseId
                                                                        : '',
                                                                    FFAppState()
                                                                        .vectorStoreId,
                                                                    '',
                                                                    <String,
                                                                        dynamic>{},
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      widget.promptId != null &&
                                                                              widget.promptId !=
                                                                                  ''
                                                                          ? valueOrDefault<
                                                                              bool>(
                                                                              _model.prompt?.webSearch,
                                                                              false,
                                                                            )
                                                                          : _model
                                                                              .instanceParams
                                                                              ?.webSearch,
                                                                      false,
                                                                    ),
                                                                    true,
                                                                    functions
                                                                        .extractFileFromContent(_model
                                                                            .messages
                                                                            .elementAtOrNull(_model.messages.length - 2)
                                                                            ?.content
                                                                            .toList())
                                                                        .toList(),
                                                                    (getJsonField(
                                                                                  functions.contentToJson(_model.messages.elementAtOrNull(_model.messages.length - 2)!.content.toList()),
                                                                                  r'''$[:].image_url''',
                                                                                ) ==
                                                                                null
                                                                            ? functions.emptyImagePathList()
                                                                            : functions.extractImgs(getJsonField(
                                                                                functions.contentToJson(_model.messages.elementAtOrNull(_model.messages.length - 2)!.content.toList()),
                                                                                r'''$[:].image_url''',
                                                                                true,
                                                                              )!))
                                                                        ?.toList(),
                                                                    _model.functionList.toList()),
                                                            apiKey: FFAppState()
                                                                .openAIAPIKey,
                                                          );
                                                          if (_model.response
                                                                  ?.succeeded ??
                                                              true) {
                                                            final streamSubscription = _model
                                                                .response
                                                                ?.streamedResponse
                                                                ?.stream
                                                                .transform(utf8
                                                                    .decoder)
                                                                .transform(
                                                                    const LineSplitter())
                                                                .transform(
                                                                    ServerSentEventLineTransformer())
                                                                .map((m) =>
                                                                    ResponseStreamMessage(
                                                                        message:
                                                                            m))
                                                                .listen(
                                                              (onMessageInput) async {
                                                                var _shouldSetState =
                                                                    false;
                                                                if (ResponseStreamingStruct.maybeFromMap(onMessageInput
                                                                            .serverSentEvent
                                                                            .jsonData)
                                                                        ?.type ==
                                                                    'response.created') {
                                                                  // Update responde_id on assistant message
                                                                  _model
                                                                      .updateMessagesAtIndex(
                                                                    _model.messages
                                                                            .length -
                                                                        1,
                                                                    (e) => e
                                                                      ..updateContent(
                                                                        (e) => e[
                                                                            0]
                                                                          ..type =
                                                                              'text'
                                                                          ..responseId = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)
                                                                              ?.response
                                                                              .id,
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  // Update responde_id on assistant message
                                                                  _model
                                                                      .updateMessagesAtIndex(
                                                                    _model.messages
                                                                            .length -
                                                                        2,
                                                                    (e) => e
                                                                      ..updateContent(
                                                                        (e) => e[
                                                                            0]
                                                                          ..type =
                                                                              'text'
                                                                          ..responseId = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)
                                                                              ?.response
                                                                              .id,
                                                                      ),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  if (ResponseStreamingStruct.maybeFromMap(onMessageInput
                                                                              .serverSentEvent
                                                                              .jsonData)
                                                                          ?.type ==
                                                                      'response.output_text.delta') {
                                                                    // Update text on assistant message
                                                                    _model
                                                                        .updateMessagesAtIndex(
                                                                      _model.messages
                                                                              .length -
                                                                          1,
                                                                      (e) => e
                                                                        ..updateContent(
                                                                          (e) => e[
                                                                              0]
                                                                            ..type =
                                                                                'text'
                                                                            ..text =
                                                                                '${_model.messages.lastOrNull?.content.firstOrNull?.text}${ResponseDeltaStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.delta}',
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    HapticFeedback
                                                                        .lightImpact();
                                                                  } else {
                                                                    if (ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)
                                                                            ?.type ==
                                                                        'response.completed') {
                                                                      for (int loop1Index =
                                                                              0;
                                                                          loop1Index <
                                                                              ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)!.response.output.length;
                                                                          loop1Index++) {
                                                                        final currentLoop1Item = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)!
                                                                            .response
                                                                            .output[loop1Index];
                                                                        if (currentLoop1Item.type ==
                                                                            'function_call') {
                                                                          _model.function =
                                                                              await queryFunctionRecordOnce(
                                                                            queryBuilder: (functionRecord) =>
                                                                                functionRecord.where(
                                                                              'name',
                                                                              isEqualTo: currentLoop1Item.name,
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.apiResult3l0 = await NEightNPDGroup
                                                                              .runFunctionCallCall
                                                                              .call(
                                                                            method:
                                                                                'POST',
                                                                            methodName:
                                                                                currentLoop1Item.name,
                                                                            methodBodyParametersJson:
                                                                                functions.extractJsonfromText(currentLoop1Item.arguments),
                                                                            workflowId:
                                                                                _model.function?.workflowId,
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.apiResult3l0?.succeeded ??
                                                                              true)) {
                                                                            _model.apiResult95z =
                                                                                await OpenAIAPIGroup.createResponseCall.call(
                                                                              apiKey: FFAppState().openAIAPIKey,
                                                                              responseJsonJson: functions.buildFunctionCallResponseJson(null, ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id, true, currentLoop1Item.callId, (_model.apiResult3l0?.jsonBody ?? '').toString()),
                                                                            );
                                                                            if (_model.apiResult95z?.succeeded ??
                                                                                true) {
                                                                              final streamSubscription = _model.apiResult95z?.streamedResponse?.stream.transform(utf8.decoder).transform(const LineSplitter()).transform(ServerSentEventLineTransformer()).map((m) => ResponseStreamMessage(message: m)).listen(
                                                                                (onMessageInput) async {
                                                                                  var _shouldSetState = false;
                                                                                  if (ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.type == 'response.created') {
                                                                                    // Update responde_id on assistant message
                                                                                    _model.updateMessagesAtIndex(
                                                                                      _model.messages.length - 1,
                                                                                      (e) => e
                                                                                        ..updateContent(
                                                                                          (e) => e[0]
                                                                                            ..type = 'text'
                                                                                            ..responseId = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id,
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                    // Update responde_id on assistant message
                                                                                    _model.updateMessagesAtIndex(
                                                                                      _model.messages.length - 2,
                                                                                      (e) => e
                                                                                        ..updateContent(
                                                                                          (e) => e[0]
                                                                                            ..type = 'text'
                                                                                            ..responseId = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id,
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    if (ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.type == 'response.output_text.delta') {
                                                                                      // Update text on assistant message
                                                                                      _model.updateMessagesAtIndex(
                                                                                        _model.messages.length - 1,
                                                                                        (e) => e
                                                                                          ..updateContent(
                                                                                            (e) => e[0]
                                                                                              ..type = 'text'
                                                                                              ..text = '${_model.messages.lastOrNull?.content.firstOrNull?.text}${ResponseDeltaStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.delta}',
                                                                                          ),
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                      HapticFeedback.lightImpact();
                                                                                    } else {
                                                                                      if (ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.type == 'response.completed') {
                                                                                        for (int loop1Index = 0; loop1Index < ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)!.response.output.length; loop1Index++) {
                                                                                          final currentLoop1Item = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)!.response.output[loop1Index];
                                                                                          if (currentLoop1Item.type == 'message') {
                                                                                            // Update text on assistant message
                                                                                            _model.updateMessagesAtIndex(
                                                                                              _model.messages.length - 1,
                                                                                              (e) => e
                                                                                                ..updateContent(
                                                                                                  (e) => e[0]
                                                                                                    ..type = 'text'
                                                                                                    ..text = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.output.where((e) => e.type == 'message').toList().firstOrNull?.content.firstOrNull?.text,
                                                                                                ),
                                                                                            );
                                                                                            safeSetState(() {});

                                                                                            await FFAppState().conversationId!.update(createConversationRecordData(
                                                                                                  lastMessageAt: getCurrentTimestamp,
                                                                                                ));

                                                                                            var messageRecordReference = MessageRecord.createDoc(FFAppState().conversationId!);
                                                                                            await messageRecordReference.set(createMessageRecordData(
                                                                                              userId: currentUserReference,
                                                                                              role: 'assistant',
                                                                                              text: currentLoop1Item.content.firstOrNull?.text,
                                                                                              createdAt: getCurrentTimestamp,
                                                                                              responseId: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id,
                                                                                              tokens: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.usage.totalTokens,
                                                                                            ));
                                                                                            _model.newMessage2Copy = MessageRecord.getDocumentFromData(
                                                                                                createMessageRecordData(
                                                                                                  userId: currentUserReference,
                                                                                                  role: 'assistant',
                                                                                                  text: currentLoop1Item.content.firstOrNull?.text,
                                                                                                  createdAt: getCurrentTimestamp,
                                                                                                  responseId: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id,
                                                                                                  tokens: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.usage.totalTokens,
                                                                                                ),
                                                                                                messageRecordReference);
                                                                                            _shouldSetState = true;
                                                                                          }
                                                                                        }
                                                                                      } else {
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                onError: (onErrorInput) async {},
                                                                                onDone: () async {},
                                                                              );
                                                                              // Add the subscription to the active streaming response subscriptions
                                                                              // in API Manager so that it can be cancelled at a later time.
                                                                              ApiManager.instance.addActiveStreamingResponseSubscription(
                                                                                random_data.randomString(
                                                                                  8,
                                                                                  8,
                                                                                  true,
                                                                                  true,
                                                                                  true,
                                                                                ),
                                                                                streamSubscription,
                                                                              );
                                                                            }

                                                                            _shouldSetState =
                                                                                true;
                                                                          }
                                                                        } else {
                                                                          if (currentLoop1Item.type ==
                                                                              'message') {
                                                                            // Update text on assistant message
                                                                            _model.updateMessagesAtIndex(
                                                                              _model.messages.length - 1,
                                                                              (e) => e
                                                                                ..updateContent(
                                                                                  (e) => e[0]
                                                                                    ..type = 'text'
                                                                                    ..responseId = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id
                                                                                    ..text = ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.output.where((e) => e.type == 'message').toList().firstOrNull?.content.firstOrNull?.text,
                                                                                ),
                                                                            );
                                                                            safeSetState(() {});

                                                                            await FFAppState().conversationId!.update(createConversationRecordData(
                                                                                  lastMessageAt: getCurrentTimestamp,
                                                                                ));

                                                                            var messageRecordReference2 =
                                                                                MessageRecord.createDoc(FFAppState().conversationId!);
                                                                            await messageRecordReference2.set(createMessageRecordData(
                                                                              userId: currentUserReference,
                                                                              role: 'assistant',
                                                                              text: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.output.where((e) => e.type == 'message').toList().firstOrNull?.content.firstOrNull?.text,
                                                                              createdAt: getCurrentTimestamp,
                                                                              responseId: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id,
                                                                              tokens: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.usage.totalTokens,
                                                                            ));
                                                                            _model.newMessage2 = MessageRecord.getDocumentFromData(
                                                                                createMessageRecordData(
                                                                                  userId: currentUserReference,
                                                                                  role: 'assistant',
                                                                                  text: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.output.where((e) => e.type == 'message').toList().firstOrNull?.content.firstOrNull?.text,
                                                                                  createdAt: getCurrentTimestamp,
                                                                                  responseId: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response.id,
                                                                                  tokens: ResponseStreamingStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.usage.totalTokens,
                                                                                ),
                                                                                messageRecordReference2);
                                                                            _shouldSetState =
                                                                                true;
                                                                          }
                                                                        }
                                                                      }
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  }
                                                                }
                                                              },
                                                              onError:
                                                                  (onErrorInput) async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Oooops. Houve um erro por aqui.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              onDone:
                                                                  () async {},
                                                            );
                                                            // Add the subscription to the active streaming response subscriptions
                                                            // in API Manager so that it can be cancelled at a later time.
                                                            ApiManager.instance
                                                                .addActiveStreamingResponseSubscription(
                                                              random_data
                                                                  .randomString(
                                                                0,
                                                                0,
                                                                true,
                                                                true,
                                                                false,
                                                              ),
                                                              streamSubscription,
                                                            );
                                                          }

                                                          // Scroll to end of list view
                                                          await _model
                                                              .listViewController
                                                              ?.animateTo(
                                                            _model
                                                                .listViewController!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          key: ValueKey(
                                                              'Container_1cyh'),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve:
                                                              Curves.easeInOut,
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.sendMouseRegionHovered
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_upward,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      onEnter: ((event) async {
                                                        safeSetState(() => _model
                                                                .sendMouseRegionHovered =
                                                            true);
                                                      }),
                                                      onExit: ((event) async {
                                                        safeSetState(() => _model
                                                                .sendMouseRegionHovered =
                                                            false);
                                                      }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 20.0))
                                              .around(SizedBox(width: 20.0)),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['blurOnPageLoadAnimation']!),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                    ))
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.messages = [];
                                          _model.suggestions = [];
                                          safeSetState(() {});
                                        },
                                        text: 'Novo Chat',
                                        icon: Icon(
                                          Icons.add,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x49FFFFFF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                          if (() {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return true;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return true;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return false;
                            } else {
                              return false;
                            }
                          }())
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                child: Icon(
                                  Icons.menu_open,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 28.0,
                                ),
                              ),
                            ),
                        ],
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
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Sair'),
                                    content: Text('Deseja realizar logout?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child:
                                            Text('Apenas mudar de instância'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Sim, logout'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.pushNamedAuth(
                                LandingWidget.routeName, context.mounted);
                          } else {
                            context.pushNamedAuth(
                              ChooseYourInstanceWidget.routeName,
                              context.mounted,
                              pathParameters: {
                                'instance': serializeParam(
                                  null,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        child: Icon(
                          Icons.logout,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Sair'),
                                    content: Text('Deseja realizar logout?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child:
                                            Text('Apenas mudar de instância'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Sim, logout'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.pushNamedAuth(
                                LandingWidget.routeName, context.mounted);
                          } else {
                            context.pushNamedAuth(
                              ChooseYourInstanceWidget.routeName,
                              context.mounted,
                              pathParameters: {
                                'instance': serializeParam(
                                  null,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        child: Text(
                          'Sair',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
      ),
    );
  }
}
