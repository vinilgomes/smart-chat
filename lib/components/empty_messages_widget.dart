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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_messages_model.dart';
export 'empty_messages_model.dart';

class EmptyMessagesWidget extends StatefulWidget {
  const EmptyMessagesWidget({
    super.key,
    required this.imgUrl,
    this.user,
    this.instance,
    this.prompt,
  });

  final String? imgUrl;
  final UsersRecord? user;
  final ParamsRecord? instance;
  final PromptRecord? prompt;

  @override
  State<EmptyMessagesWidget> createState() => _EmptyMessagesWidgetState();
}

class _EmptyMessagesWidgetState extends State<EmptyMessagesWidget> {
  late EmptyMessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyMessagesModel());

    _model.suporteTextController ??= TextEditingController();
    _model.suporteFocusNode ??= FocusNode();

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 260.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 400.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 400.0;
            } else {
              return 400.0;
            }
          }(),
        ),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            Container(
              constraints: BoxConstraints(
                maxWidth: 300.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      4.0,
                      4.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Text(
                  FFAppState().chatWelcomeMessage,
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Hero(
                tag: widget!.imgUrl!,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget!.imgUrl!,
                    width: 200.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      width: 200.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            if (widget!.user != null)
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width > 448.0
                          ? 370.0
                          : 300.0,
                      child: TextFormField(
                        controller: _model.suporteTextController,
                        focusNode: _model.suporteFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText:
                              'Envie uma mensagem para o suporte sobre este agente.',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
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
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        enableInteractiveSelection: true,
                        validator: _model.suporteTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await NEightNPDGroup.sendTelegramMessageCall.call(
                          message: functions.supportMessage(
                              widget!.user,
                              widget!.instance,
                              widget!.prompt,
                              _model.suporteTextController.text),
                        );

                        _model.userInfo = await UsersRecord.getDocumentOnce(
                            widget!.prompt!.createdBy!);
                        await NEightNPDGroup.sendMailCall.call(
                          toEmail: _model.userInfo?.email,
                          subject:
                              'Uma mensagem sobre seu agente: ${widget!.prompt?.promptName}',
                          htmlText:
                              '<!DOCTYPE html><html lang=\"pt-BR\"><head>  <meta charset=\"UTF-8\" />  <title>Você tem um convite</title></head><body style=\"margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #f6f8fa;\">  <table align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 600px; margin: 30px auto; background-color: #ffffff; border-radius: 8px; box-shadow: 0 3px 6px rgba(0,0,0,0.1);\">    <tr>      <td style=\"padding: 30px; text-align: center; background-color: #0A66C2; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;\">        <h2 style=\"margin: 0;\">🎉 Você recebeu um convite especial</h2>      </td>    </tr>    <tr>      <td style=\"padding: 30px;\">        <p style=\"font-size: 16px; color: #333333; margin-bottom: 20px;\">          Olá!        </p>        <p style=\"font-size: 16px; color: #333333; margin-bottom: 20px;\">          Você acaba de receber uma mensagem do usuário ${currentUserEmail}sobre seu agente ${widget!.prompt?.promptName}, na instância  ${widget!.instance?.instanceName}. <br><br><b>Mensagem: </b>${_model.suporteTextController.text}<p style=\"font-size: 16px; color: #333333; margin-bottom: 20px;\">DICA: Como boa prática, retorne ao usuário sua avaliação sobre a mensagem e combine possíveis ações.</p>        <p style=\"font-size: 12px; color: #333333; margin-bottom: 20px;\">          <i><strong>Nossa equipe de suporte também recebeu esta mensagem e pode apoiar caso necessário.</strong></i>        </p>        <div style=\"text-align: center;\">          <a href=\"https://smart-chat.flutterflow.app/${widget!.instance?.instanceId}/chat/promptId=${widget!.prompt?.promptId}\" style=\"background-color: #0A66C2; color: white; padding: 12px 24px; border-radius: 6px; text-decoration: none; font-weight: bold;\">Acessar o agente</a>        </div>      </td>    </tr>    <tr>      <td style=\"padding: 20px; text-align: center; color: #888888; font-size: 12px;\">        Este é um aviso automático gerado pela plataforma Smart Chat.      </td>    </tr>  </table></body></html>',
                        );

                        safeSetState(() {
                          _model.suporteTextController?.clear();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Mensagem enviada ao suporte.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );

                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.send,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ),
            Spacer(flex: 2),
          ].divide(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
