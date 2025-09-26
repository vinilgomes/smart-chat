import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<ContentOldStruct> buildContentOld(
  String? text,
  String? imageUrl,
) {
  List<ContentOldStruct> contents = [];

  // Assuming Constants.vectorStore is a list of VectorStore identifiers
  if (text == null && imageUrl == null) {
    return [ContentOldStruct(type: "text", text: "")];
  }

  if (text != null) {
    contents.add(ContentOldStruct(type: "text", text: text));
  }

  if (imageUrl != null) {
    contents.add(ContentOldStruct(
        type: "image_url", imageUrl: ImageUrlStruct(url: imageUrl)));
  }

  return contents;
}

List<ContentStruct> buildContent(
  String? text,
  String? imageUrl,
) {
  List<ContentStruct> contents = [];

  // Assuming Constants.vectorStore is a list of VectorStore identifiers
  if (text == null && imageUrl == null) {
    return [ContentStruct(type: "text", text: "")];
  }

  if (text != null) {
    contents.add(ContentStruct(type: "text", text: text));
  }

  if (imageUrl != null) {
    contents.add(ContentStruct(
        type: "image_url", imageUrl: ImageUrlStruct(url: imageUrl)));
  }

  return contents;
}

List<ContentStruct> buildContentWithFile(
  String? text,
  String? fileId,
) {
  List<ContentStruct> contents = [];

  // Assuming Constants.vectorStore is a list of VectorStore identifiers
  if (text == null && fileId == null) {
    return [ContentStruct(type: "text", text: "")];
  }

  if (fileId != null) {
    contents.add(ContentStruct(
        type: "input_file",
        inputFile: InputFileStruct(type: "input_file", fileId: fileId)));
  }

  if (text != null) {
    contents.add(ContentStruct(type: "text", text: text));
  }

  return contents;
}

List<ContentStruct> updateContent(
  String? text,
  String? imageUrl,
  String? responseId,
) {
  List<ContentStruct> contents = [];

  if (text == null && imageUrl == null) {
    return [ContentStruct(type: "text", text: "", responseId: "")];
  }

  if (text != null) {
    contents.add(ContentStruct(
        type: "text",
        text: text,
        responseId: responseId != null ? responseId : ""));
  }

  if (imageUrl != null) {
    contents.add(ContentStruct(
        type: "image_url",
        imageUrl: ImageUrlStruct(url: imageUrl),
        responseId: responseId != null ? responseId : ""));
  }

  return contents;
}

int? mapCharactersCount(int charCount) {
  // Used to ensure messages are never hidden behind TextInput

  if (charCount >= 209) {
    return 175;
  } else if (charCount <= 35) {
    return 82;
  } else {
    // Linear interpolation between the two points (35, 82) and (209, 175)
    double slope = (175 - 82) / (209 - 35);
    return (82 + slope * (charCount - 35)).round();
  }
}

dynamic parsePartialJson(String input) {
  // Clean up the input
  input = input.replaceAll(RegExp(r',\s*(?=[}\]])'), '');

  // Ensure the input starts with a brace or bracket
  if (!input.trimLeft().startsWith('{') && !input.trimLeft().startsWith('[')) {
    input = '{' + input;
  }

  // Balance the JSON structure
  List<String> stack = [];
  bool inString = false;
  StringBuffer buffer = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    var char = input[i];

    if (char == '"' && (i == 0 || input[i - 1] != '\\')) {
      inString = !inString;
    }

    if (!inString) {
      if (char == '{' || char == '[') {
        stack.add(char);
      } else if (char == '}' && stack.isNotEmpty && stack.last == '{') {
        stack.removeLast();
      } else if (char == ']' && stack.isNotEmpty && stack.last == '[') {
        stack.removeLast();
      }
    }

    buffer.write(char);
  }

  // Close any unclosed strings
  if (inString) buffer.write('"');

  // Remove incomplete key-value pairs
  String bufferStr = buffer.toString();
  int lastColon = bufferStr.lastIndexOf(':');
  int lastComma = bufferStr.lastIndexOf(',');
  if (lastColon > lastComma) {
    bufferStr = bufferStr.substring(0, lastComma != -1 ? lastComma : lastColon);
  }

  // Close incomplete JSON structures
  while (stack.isNotEmpty) {
    if (stack.last == '{') {
      if (bufferStr.trim().endsWith('{') ||
          bufferStr.trim().endsWith(':') ||
          bufferStr.trim().endsWith(',')) {
        bufferStr += '"incomplete": null';
      }
      bufferStr += '}';
    } else if (stack.last == '[') {
      if (bufferStr.trim().endsWith('[') || bufferStr.trim().endsWith(',')) {
        bufferStr += 'null';
      }
      bufferStr += ']';
    }
    stack.removeLast();
  }

  // Attempt to parse the completed JSON
  try {
    return json.decode(bufferStr);
  } catch (e) {
    // If parsing fails, try partial parsing
    if (bufferStr.startsWith('{')) {
      return parsePartialObject(bufferStr);
    } else if (bufferStr.startsWith('[')) {
      return parsePartialArray(bufferStr);
    }
    return null;
  }
}

dynamic parseValue(String value) {
  if (value.startsWith('{') && value.endsWith('}')) {
    return parsePartialObject(value);
  } else if (value.startsWith('[') && value.endsWith(']')) {
    return parsePartialArray(value);
  } else if (value.startsWith('"') && value.endsWith('"')) {
    return value.substring(1, value.length - 1);
  } else if (value == 'true') {
    return true;
  } else if (value == 'false') {
    return false;
  } else if (value == 'null') {
    return null;
  } else {
    return num.tryParse(value) ?? value;
  }
}

dynamic parsePartialObject(String input) {
  Map<String, dynamic> result = {};
  RegExp keyValuePairRegex = RegExp(r'"([^"]+)"\s*:\s*([^,}]+)');
  var matches = keyValuePairRegex.allMatches(input);

  for (var match in matches) {
    String key = match.group(1)!;
    String value = match.group(2)!.trim();
    result[key] = parseValue(value);
  }

  return result;
}

List<dynamic> parsePartialArray(String input) {
  List<dynamic> result = [];
  RegExp elementRegex = RegExp(r'(?:[^,\[\]{}]+|\{[^{}]*\}|\[[^\[\]]*\])');
  var matches = elementRegex.allMatches(input);

  for (var match in matches) {
    String value = match.group(0)!.trim();
    result.add(parseValue(value));
  }

  return result;
}

String sanitizeMarkdown(String input) {
  // Remove markdown bullet points
  input = input.replaceAll(RegExp(r'^\s*[-*]\s+', multiLine: true), '');

  // Remove code blocks (assuming they're wrapped in triple backticks)
  input = input.replaceAll(RegExp(r'```.*?```', dotAll: true), '');

  // Handle other markdown features as needed
  return input;
}

dynamic formatMessages(List<ThreadMessageStruct> messages) {
  return messages.map((message) {
    final map = message.toMap();
    map.remove('visible'); // Remove the "visible" key from the map
    return map;
  }).toList();
}

dynamic contentToJson(List<ContentStruct> content) {
  return content.map((contentItem) => contentItem.toSerializableMap()).toList();
}

dynamic extractDataFromContent(ContentStruct content) {
  // Check if the text is not null or empty
  if (content.hasText()) {
    // Parse the JSON string in the text field
    final Map<String, dynamic> parsedJson = jsonDecode(content.text);

    // Extract the "data" field
    if (parsedJson.containsKey('data')) {
      return parsedJson['data'];
    } else {
      throw Exception('Data field not found in content.');
    }
  } else {
    throw Exception('Content text is null or empty.');
  }
}

dynamic extractJsonfromText(String content) {
  return jsonDecode(content);
}

String? extractTypeFromAssistantMessage(String jsonStr) {
  print("Extracting type: ");
  print(jsonStr);
  print("Type is: ${jsonDecode(jsonStr)['type']}");
  return jsonDecode(jsonStr)['type'];
}

String printUploadedFile(FFUploadedFile file) {
  return file.toString();
}

List<String>? extractImgs(List<dynamic> jsonList) {
  print("Lista de imagens: " + jsonList.toString());
  if (jsonList == null || jsonList.isEmpty) return [];
  return jsonList
      .map((item) {
        // Se for String, decodifica; se for Map, usa direto
        final map = item is String ? jsonDecode(item) : item;
        if (map is Map<String, dynamic>) {
          final url = map['url'];
          if (url is String && url.isNotEmpty) {
            return url;
          }
        }
        return '';
      })
      .where((url) => url.isNotEmpty)
      .toList();
  //return jsonStrings.map((str) => jsonDecode(str)['url'] as String).toList(); // <-- OLD
}

dynamic buildResponseJson(
  String? model,
  String systemPrompt,
  String userPrompt,
  dynamic metadata,
  String instructions,
  String textFormat,
  double? temperature,
  double? topP,
  String? previousResponseId,
  String? vectorStoreId,
  String? schemaName,
  dynamic jsonSchema,
  bool webSearch,
  bool stream,
  List<String>? fileIds,
  List<String>? imageUrls,
  List<FunctionRecord>? functionList,
) {
  final List<Map<String, dynamic>> inputContent = [
    {
      "role": "system",
      "content": [
        {"type": "input_text", "text": systemPrompt}
      ]
    }
  ];

  // Bloco do usuário com conteúdo combinado
  final List<Map<String, dynamic>> userContent = [
    {"type": "input_text", "text": userPrompt}
  ];

  // Adiciona arquivos ao mesmo bloco de conteúdo
  if (fileIds != null && fileIds.isNotEmpty) {
    for (final id in fileIds) {
      userContent.add({
        "type": "input_file",
        "file_id": id,
      });
    }
  }

  // Adiciona imagens ao mesmo bloco de conteúdo
  if (imageUrls != null && imageUrls.isNotEmpty) {
    for (final id in imageUrls) {
      userContent.add({
        "type": "input_image",
        "image_url": id,
      });
    }
  }

  // Adiciona ao input principal
  inputContent.add({
    "role": "user",
    "content": userContent,
  });

  final Map<String, dynamic> body = {
    "model": model ?? "gpt-4.1",
    "input": inputContent,
    "metadata": metadata ?? {},
    "instructions": jsonEncode(instructions),
    "text": textFormat == "text"
        ? {
            "format": {"type": textFormat}
          }
        : textFormat == "json_schema"
            ? {
                "format": {
                  "name": schemaName,
                  "type": "json_schema",
                  "schema": jsonSchema
                }
              }
            : {},
    "reasoning": {},
    "temperature": temperature ?? 1,
    "top_p": topP ?? 1,
    "store": true,
    "stream": stream
  };

  if (previousResponseId != null && previousResponseId.isNotEmpty) {
    body["previous_response_id"] = previousResponseId;
  }

  final List<Map<String, dynamic>> tools = [];

  if (vectorStoreId != null && vectorStoreId.isNotEmpty) {
    tools.add({
      "type": "file_search",
      "vector_store_ids": [vectorStoreId]
    });
  }
  if (webSearch) {
    tools.add({
      "type": "web_search",
    });
  }

  if (functionList != null && functionList.isNotEmpty) {
    for (var f in functionList) {
      try {
        // arguments vem como JSON (String), então parseamos
        final params = (f.arguments is String && f.arguments.isNotEmpty)
            ? jsonDecode(f.arguments)
            : {};

        tools.add({
          "type": "function",
          "name": f.name,
          "description": f.description,
          "parameters": params,
        });
      } catch (e) {
        // fallback em caso de erro no decode
        tools.add({
          "type": "function",
          "name": f.name,
          "description": f.description,
          "parameters": {},
        });
      }
    }
  }

  body["tools"] = tools;

  print("Response JSON: " + jsonEncode(body).toString());

  return body;
}

String? extractLastPath(List<String> routeStack) {
  return routeStack[0].substring(1);
}

List<Role> getEditorRoles() {
  List<Role> role = [];
  role.add(Role.EDITOR);
  role.add(Role.OWNER);
  return role;
}

bool? validateVSFileTypes(FFUploadedFile file) {
  // Verifica se o nome do arquivo existe
  if (file.name == null || file.name!.isEmpty) {
    return false;
  }

  // Extrai a extensão do arquivo
  final fileName = file.name!;
  final extension = fileName.split('.').last.toLowerCase();

  // Lista de extensões válidas
  const validExtensions = ['pdf', 'txt', 'md'];

  // Retorna se a extensão está na lista
  return validExtensions.contains(extension);
}

bool? validateInputFileTypes(FFUploadedFile file) {
  // Verifica se o nome do arquivo existe
  if (file.name == null || file.name!.isEmpty) {
    return false;
  }

  // Extrai a extensão do arquivo
  final fileName = file.name!;
  final extension = fileName.split('.').last.toLowerCase();

  // Lista de extensões válidas conforme comentário
  const validExtensions = [
    'c', // text/x-c
    'cpp', // text/x-c++
    'cs', // text/x-csharp
    'css', // text/css
    'doc', // application/msword
    'docx', // application/vnd.openxmlformats-officedocument.wordprocessingml.document
    'go', // text/x-golang
    'html', // text/html
    'java', // text/x-java
    'js', // text/javascript
    'json', // application/json
    'md', // text/markdown
    'pdf', // application/pdf
    'php', // text/x-php
    'pptx', // application/vnd.openxmlformats-officedocument.presentationml.presentation
    'py', // text/x-python, text/x-script.python
    'rb', // text/x-ruby
    'sh', // application/x-sh
    'tex', // text/x-tex
    'ts', // application/typescript
    'txt', // text/plain
  ];

  // Retorna se a extensão está na lista
  return validExtensions.contains(extension);
}

String? getFileName(FFUploadedFile file) {
  return file.name;
}

dynamic getFileProperties(FFUploadedFile file) {
  return {
    'name': file.name,
    'size': file.bytes?.length ?? 0,
    'extension': file.name?.split('.').last.toLowerCase()
  };
}

dynamic parseJsonFromText(String jsonString) {
  return jsonDecode(jsonString);
}

DateTime? addTempo(
  DateTime dataHora,
  int minutos,
) {
  DateTime newDateTime = dataHora.add(Duration(minutes: minutos));

  return newDateTime;
}

List<String> extractFileFromContent(List<ContentStruct>? contentList) {
  final List<String> fileIds = [];

  if (contentList != null) {
    for (var item in contentList) {
      if (item.type == 'input_file') {
        final InputFileStruct file = item.inputFile;
        fileIds.add(file.fileId);
      }
    }
  }
  print('Arquivos: ' + fileIds.toString());
  return fileIds;
}

List<String> emptyStringList() {
  List<String> empty = [];
  return empty;
}

List<String> emptyImagePathList() {
  List<String> empty = [];
  return empty;
}

String? formataStringTipoLista(String? stringTipoLista) {
  if (stringTipoLista == null) return '';

  // Remove colchetes e espaços extra"
  final cleaned =
      stringTipoLista.replaceAll('[', '').replaceAll(']', '').trim();

  // Se a string estiver vazia após limpeza, retorna vazio
  if (cleaned.isEmpty) return '';

  // Divide pelos itens e junta com quebra de linha
  final parts = cleaned.split(',').map((e) => e.trim()).toList();
  return parts.join('\n');
}

dynamic buildFunctionCallResponseJson(
  String? model,
  String? previousResponseId,
  bool stream,
  String? callId,
  String? output,
) {
  final List<Map<String, dynamic>> inputContent = [
    {"type": "function_call_output", "call_id": callId, "output": output}
  ];

  final Map<String, dynamic> body = {
    "model": model ?? "gpt-4.1",
    "input": inputContent,
    "store": true,
    "stream": stream
  };

  if (previousResponseId != null && previousResponseId.isNotEmpty) {
    body["previous_response_id"] = previousResponseId;
  }

  print("Function Call Response JSON: " + jsonEncode(body).toString());

  return body;
}

List<FunctionRecord> emptyFunctionList() {
  List<FunctionRecord> empty = [];
  return empty;
}

String? jsonBeautifier(String text) {
  try {
    // Decode the JSON string into a Dart object
    final dynamic jsonObject = jsonDecode(text);

    // Create a JsonEncoder with an indent for pretty-printing
    final JsonEncoder encoder = JsonEncoder.withIndent('  ');

    // Encode the Dart object back into a beautified JSON string
    return encoder.convert(jsonObject);
  } catch (e) {
    // Handle potential errors during JSON parsing
    print('Erro formatando JSON: $e');
    return null; // Or return the original rawJson
  }
}

List<ThreadMessageStruct> emptyThreadMessageList() {
  List<ThreadMessageStruct> empty = [];
  return empty;
}

List<ThreadMessageStruct> buildThreadMessageList(
    List<MessageRecord> messageList) {
  List<ThreadMessageStruct> contents = [];

  // Inverte a lista para ficar do mais antigo para o mais recente
  final reversedList = messageList.reversed.toList();

  for (final message in reversedList) {
    final content = buildContent(message.text, null);

    final tm = ThreadMessageStruct(
      role: message.role,
      content: content,
      visible: true,
      responseId: message.responseId,
    );
    contents.add(tm);
  }

  return contents;
}

String? supportMessage(
  UsersRecord? userInfo,
  ParamsRecord? instance,
  PromptRecord? prompt,
  String text,
) {
  String result = "";

  if (userInfo != null) {
    result += "🧑‍💼 " + userInfo.displayName + " <" + userInfo.email + ">\n";
  }

  if (instance != null) {
    result +=
        "🏢 " + instance.instanceName + " <" + instance.reference.id + ">\n";
  }
  if (prompt != null) {
    result += "⚙️ " + prompt.promptName + " <" + prompt.reference.id + ">\n";
  }
  result += "\n" + text;

  return result;
}
