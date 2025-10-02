import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_model.dart';
export 'terms_model.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key});

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late TermsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                ChooseYourInstanceWidget.routeName,
                                pathParameters: {
                                  'instance': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/smart-chat-logo.png',
                                width: 180.0,
                                height: 180.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 36.0,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Termos de Uso',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.urbanist(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.65,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 0.5,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'TERMO DE RESPONSABILIDADE PELO USO DA PLATAFORMA SMARTCHAT\n\n\n1 – Definição de USUÁRIO Para efeitos deste termo, considera-se USUÁRIO toda pessoa física, colaborador(a), empregado(a), prestador(a) de serviço ou agente autorizado(a) que utilize a Plataforma de Inteligência Artificial SmartChat, oferecida pela PD CASE INFORMÁTICA LTDA, inscrita no CNPJ nº 38.519.484/0001-52, em atividades vinculadas à empresa.\n\n2 – Objeto Este termo regulamenta o acesso e uso da Plataforma SmartChat pelo USUÁRIO, que é restrito a fins corporativos e profissionais, conforme suas funções exercidas na PD CASE.\n\n3 – Responsabilidades do USUÁRIO \n3.1 – Todos os conteúdos e interações na SmartChat são de propriedade exclusiva da PD CASE, não havendo qualquer direito autoral ou titularidade ao USUÁRIO. \n3.2 – A PD CASE poderá registrar, monitorar e recuperar informações trocadas na plataforma para fins de auditoria, conformidade e segurança. \n3.3 – O uso da SmartChat é restrito às atividades relacionadas ao trabalho. É proibido utilizar a plataforma para fins pessoais, acadêmicos, políticos, comerciais externos, bem como inserir conteúdo ofensivo, ilícito, discriminatório ou alheio às atribuições profissionais. \n3.4 – O USUÁRIO não deve utilizar a SmartChat para violar direitos autorais, patentes ou outros direitos de terceiros. \n3.5 – O USUÁRIO é responsável por uso inadequado, negligente ou indevido. Caso fique comprovada conduta dolosa ou culpa grave com prejuízo à empresa, poderá haver ressarcimento financeiro, inclusive via desconto em folha, sempre mediante apuração prévia e contraditório. Pequenos equívocos ou falhas de boa-fé não ensejarão penalidades automáticas. \n3.6 – É vedado ao USUÁRIO compartilhar credenciais de acesso. Descumprimentos resultarão em responsabilizações de acordo com a gravidade do caso. \n3.7 – É proibida a inserção de informações sigilosas, estratégicas, de clientes, dados financeiros ou pessoais de terceiros sem autorização expressa da PD CASE. \n3.8 – O USUÁRIO deve obedecer rigorosamente à Lei nº 13.709/2018 – LGPD; dados pessoais só poderão ser inseridos na SmartChat se houver base legal adequada. \n3.9 – Os conteúdos gerados pela SmartChat são meramente sugestivos, devendo o USUÁRIO analisá-los e validá-los criticamente antes de tomar decisões ou gerar documentos finais. \n3.10 – Em caso de incidente de segurança, uso suspeito, comprometimento de credenciais ou dúvidas quanto ao uso correto da plataforma, o USUÁRIO deve comunicar imediatamente o canal de suporte: smartchat@pdcase.com.br.\n\n4 – Fiscalização e Penalidades \n4.1 – A PD CASE monitora a conformidade do uso da SmartChat. 4.2 – Violações deste termo, compartilhamento de senha, inserção de dados proibidos ou outros usos indevidos poderão resultar em:\nProvidências administrativas e disciplinares;\nRessarcimento de prejuízos após apuração formal;\nResponsabilização civil e/ou penal, conforme aplicável.\n\n5 – Vigência, Alterações e Encerramento \n5.1 – O termo é válido enquanto o USUÁRIO mantiver vínculo com a PD CASE ou acesso à SmartChat. \n5.2 – O encerramento de vínculo ou acesso não isenta de responsabilidade por atos praticados durante o uso. \n5.3 – A PD CASE pode revisar o termo, comunicando os USUÁRIOS, e respeitará direito de defesa em questões de penalidades.\n\n6 – Concordância e Suporte \n6.1 – O uso da SmartChat implica concordância integral destes termos por qualquer USUÁRIO. \n6.2 – Para dúvidas, suporte, denúncias de uso indevido ou incidentes de segurança, contate: smartchat@pdcase.com.br.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.manrope(
                                fontWeight: FontWeight.w100,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w100,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Para revogar seu aceite aos termos acima, solicite sua remoção através do e-mail: ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.urbanist(
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
                    ),
                    TextSpan(
                      text: 'smartchat@pdcase.com.br',
                      style: GoogleFonts.urbanist(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.urbanist(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
