import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_messages_model.dart';
export 'empty_messages_model.dart';

class EmptyMessagesWidget extends StatefulWidget {
  const EmptyMessagesWidget({
    super.key,
    required this.imgUrl,
  });

  final String? imgUrl;

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
              tag: widget.imgUrl!,
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.imgUrl!,
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
          Spacer(flex: 2),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
