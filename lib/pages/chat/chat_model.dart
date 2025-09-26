import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
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
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
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

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<ThreadMessageStruct> messages = [];
  void addToMessages(ThreadMessageStruct item) => messages.add(item);
  void removeFromMessages(ThreadMessageStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, ThreadMessageStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(
          int index, Function(ThreadMessageStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  bool isRecording = false;

  List<String> suggestions = [];
  void addToSuggestions(String item) => suggestions.add(item);
  void removeFromSuggestions(String item) => suggestions.remove(item);
  void removeAtIndexFromSuggestions(int index) => suggestions.removeAt(index);
  void insertAtIndexInSuggestions(int index, String item) =>
      suggestions.insert(index, item);
  void updateSuggestionsAtIndex(int index, Function(String) updateFn) =>
      suggestions[index] = updateFn(suggestions[index]);

  bool generatingImage = false;

  FFUploadedFile? recordedAudioFile;

  dynamic json;

  bool isLoading = true;

  List<FunctionRecord> functionList = [];
  void addToFunctionList(FunctionRecord item) => functionList.add(item);
  void removeFromFunctionList(FunctionRecord item) => functionList.remove(item);
  void removeAtIndexFromFunctionList(int index) => functionList.removeAt(index);
  void insertAtIndexInFunctionList(int index, FunctionRecord item) =>
      functionList.insert(index, item);
  void updateFunctionListAtIndex(
          int index, Function(FunctionRecord) updateFn) =>
      functionList[index] = updateFn(functionList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Chat widget.
  ParamsRecord? instanceParams;
  // Stores action output result for [Action Block - loadMessages] action in Chat widget.
  List<ThreadMessageStruct>? instanceMessageList;
  // Stores action output result for [Firestore Query - Query a collection] action in Chat widget.
  PromptRecord? prompt;
  // Stores action output result for [Backend Call - Read Document] action in Chat widget.
  FunctionRecord? item;
  // Stores action output result for [Action Block - loadMessages] action in Chat widget.
  List<ThreadMessageStruct>? promptMessageList;
  // Model for Drawer component.
  late DrawerModel drawerModel1;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Models for Message dynamic component.
  late FlutterFlowDynamicModels<MessageModel> messageModels;
  // State field(s) for Row widget.
  ScrollController? row;
  String? recordedAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading_uploadDataNec = false;
  FFUploadedFile uploadedLocalFile_uploadDataNec =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataNec = '';

  // Stores action output result for [Custom Action - renameAudio] action in StopButton widget.
  FFUploadedFile? renamedAudioFile;
  AudioRecorder? audioRecorder;
  bool isDataUploading_uploadDataQ38 = false;
  FFUploadedFile uploadedLocalFile_uploadDataQ38 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataQ38 = '';

  bool isDataUploading_uploadData5tf = false;
  FFUploadedFile uploadedLocalFile_uploadData5tf =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (createFile)] action in IconButton widget.
  ApiCallResponse? file;
  // State field(s) for UploadedImageThumbnails widget.
  ScrollController? uploadedImageThumbnails;
  // State field(s) for UserMessage widget.
  FocusNode? userMessageFocusNode;
  TextEditingController? userMessageTextController;
  String? Function(BuildContext, String?)? userMessageTextControllerValidator;
  // State field(s) for SendMouseRegion widget.
  bool sendMouseRegionHovered = false;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ConversationRecord? newConversation;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageRecord? newMessage;
  // Stores action output result for [Backend Call - API (createResponse)] action in Container widget.
  ApiCallResponse? response;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageRecord? newMessage2;
  // Stores action output result for [Backend Call - API (createResponse)] action in Container widget.
  ApiCallResponse? apiResult95z;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessageRecord? newMessage2Copy;
  // Stores action output result for [Backend Call - API (runFunctionCall)] action in Container widget.
  ApiCallResponse? apiResult3l0;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  FunctionRecord? function;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ConversationRecord? newConversation3;
  // Model for Drawer component.
  late DrawerModel drawerModel2;
  // Stores action output result for [Backend Call - Read Document] action in FloatingActionButton widget.
  UsersRecord? user;

  @override
  void initState(BuildContext context) {
    drawerModel1 = createModel(context, () => DrawerModel());
    listViewController = ScrollController();
    messageModels = FlutterFlowDynamicModels(() => MessageModel());
    row = ScrollController();
    uploadedImageThumbnails = ScrollController();
    drawerModel2 = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel1.dispose();
    listViewController?.dispose();
    messageModels.dispose();
    row?.dispose();
    uploadedImageThumbnails?.dispose();
    userMessageFocusNode?.dispose();
    userMessageTextController?.dispose();

    drawerModel2.dispose();
  }
}
