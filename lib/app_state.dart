import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _chatSystemPrompt = '';
  String get chatSystemPrompt => _chatSystemPrompt;
  set chatSystemPrompt(String value) {
    _chatSystemPrompt = value;
  }

  String _instanceName = '';
  String get instanceName => _instanceName;
  set instanceName(String value) {
    _instanceName = value;
  }

  String _assistantName = '';
  String get assistantName => _assistantName;
  set assistantName(String value) {
    _assistantName = value;
  }

  String _vectorStoreId = '';
  String get vectorStoreId => _vectorStoreId;
  set vectorStoreId(String value) {
    _vectorStoreId = value;
  }

  String _chatWelcomeMessage = '';
  String get chatWelcomeMessage => _chatWelcomeMessage;
  set chatWelcomeMessage(String value) {
    _chatWelcomeMessage = value;
  }

  String _instanceLogo = '';
  String get instanceLogo => _instanceLogo;
  set instanceLogo(String value) {
    _instanceLogo = value;
  }

  String _instancePersona = '';
  String get instancePersona => _instancePersona;
  set instancePersona(String value) {
    _instancePersona = value;
  }

  String _openAIAPIKey = '';
  String get openAIAPIKey => _openAIAPIKey;
  set openAIAPIKey(String value) {
    _openAIAPIKey = value;
  }

  String _chatInstructions = '';
  String get chatInstructions => _chatInstructions;
  set chatInstructions(String value) {
    _chatInstructions = value;
  }

  String _instanceId = '';
  String get instanceId => _instanceId;
  set instanceId(String value) {
    _instanceId = value;
  }

  DocumentReference? _instanceReference;
  DocumentReference? get instanceReference => _instanceReference;
  set instanceReference(DocumentReference? value) {
    _instanceReference = value;
  }

  List<DocumentReference> _accessList = [];
  List<DocumentReference> get accessList => _accessList;
  set accessList(List<DocumentReference> value) {
    _accessList = value;
  }

  void addToAccessList(DocumentReference value) {
    accessList.add(value);
  }

  void removeFromAccessList(DocumentReference value) {
    accessList.remove(value);
  }

  void removeAtIndexFromAccessList(int index) {
    accessList.removeAt(index);
  }

  void updateAccessListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    accessList[index] = updateFn(_accessList[index]);
  }

  void insertAtIndexInAccessList(int index, DocumentReference value) {
    accessList.insert(index, value);
  }

  String _instanceType = '';
  String get instanceType => _instanceType;
  set instanceType(String value) {
    _instanceType = value;
  }

  double _topP = 0.0;
  double get topP => _topP;
  set topP(double value) {
    _topP = value;
  }

  double _temperature = 0.0;
  double get temperature => _temperature;
  set temperature(double value) {
    _temperature = value;
  }

  bool _webSearch = false;
  bool get webSearch => _webSearch;
  set webSearch(bool value) {
    _webSearch = value;
  }

  DocumentReference? _conversationId;
  DocumentReference? get conversationId => _conversationId;
  set conversationId(DocumentReference? value) {
    _conversationId = value;
  }
}
