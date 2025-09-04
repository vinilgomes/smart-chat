import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_instances_model.dart';
export 'empty_instances_model.dart';

class EmptyInstancesWidget extends StatefulWidget {
  const EmptyInstancesWidget({
    super.key,
    required this.imgUrl,
  });

  final String? imgUrl;

  @override
  State<EmptyInstancesWidget> createState() => _EmptyInstancesWidgetState();
}

class _EmptyInstancesWidgetState extends State<EmptyInstancesWidget> {
  late EmptyInstancesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyInstancesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Hero(
              tag: 'Logo',
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Smart_Chat_MOBILE_APPLICATION.png',
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
            ),
            decoration: BoxDecoration(),
            child: Opacity(
              opacity: 0.5,
              child: Text(
                'Boas-vindas ao SmartChat.\n\nNo momento, você ainda não está vinculado a nenhuma instância da plataforma SmartChat.\n\n🔒 Por motivos de segurança, apenas usuários autorizados por um administrador têm acesso a ambientes de trabalho.\n\n✨ O que você pode fazer agora:\n\nSolicite seu convite a um administrador de instância.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
          Spacer(flex: 2),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
