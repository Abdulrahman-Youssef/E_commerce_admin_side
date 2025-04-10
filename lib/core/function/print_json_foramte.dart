import 'dart:convert';

void printFormattedResponse(int statusCode, String responseBody) {
  try {
    final decodedJson = jsonDecode(responseBody); // Decode JSON string
    final formattedJson = JsonEncoder.withIndent('  ').convert(decodedJson); // Pretty print JSON

    print("CRUD Code = $statusCode\nBody = \n$formattedJson");
  } catch (e) {
    print("CRUD Code = $statusCode\nBody = $responseBody"); // Fallback in case of error
  }
}
