import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_thread_tile_model.dart';
export 'chat_thread_tile_model.dart';

class ChatThreadTileWidget extends StatefulWidget {
  const ChatThreadTileWidget({
    super.key,
    this.label,
    this.title,
    this.excerpt,
    bool? active,
    this.tapAction,
  }) : this.active = active ?? false;

  final String? label;
  final String? title;
  final String? excerpt;
  final bool active;
  final Future Function()? tapAction;

  @override
  State<ChatThreadTileWidget> createState() => _ChatThreadTileWidgetState();
}

class _ChatThreadTileWidgetState extends State<ChatThreadTileWidget> {
  late ChatThreadTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatThreadTileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.tapAction?.call();
      },
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: widget!.active
              ? FlutterFlowTheme.of(context).secondaryBackground
              : Color(0x00000000),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget!.title != null && widget!.title != '')
                Text(
                  valueOrDefault<String>(
                    widget!.title,
                    'Loading',
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget!.active
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).info,
                          FlutterFlowTheme.of(context).info,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
              if (widget!.excerpt != null && widget!.excerpt != '')
                Text(
                  valueOrDefault<String>(
                    widget!.excerpt,
                    'Loading',
                  ),
                  maxLines: 3,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget!.active
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).info,
                          FlutterFlowTheme.of(context).info,
                        ),
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
