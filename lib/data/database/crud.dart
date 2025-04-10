import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/function/print_json_foramte.dart';

class Crud {
  Future<http.Response?> post(String url, Map<String, String> data) async {
    try {
      Uri urI = Uri.parse(url);

      var response = await http.post(urI,
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});

      return _handleResponse(response);
    } catch (message) {
      print("Error : $message");
      return null;
    }
  }

  Future<http.StreamedResponse?> postWithImage({
    required String url,
    required Map<String, String> data,
    required File? imageFile,
  }) async {
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields.addAll(data);
      if (imageFile != null) {
        // Add the image file map<key, filePath>
        request.files.add(await http.MultipartFile.fromPath(
          'image', // this is the key you'll use in PHP ($_FILES['image'])
          imageFile.path,
        ));
      }

      // Send the request
      var response = await request.send();

      return response;
    } catch (e) {
      print("Upload error: $e");
      return null;
    }
  }

  Future<http.Response?> get(String url, Map<String, String> data) async {
    try {
      Uri urI = Uri.parse(url).replace(queryParameters: data);

      var response =
          await http.get(urI, headers: {"Content-Type": "application/json"});

      return _handleResponse(response);
    } catch (message) {
      print("Error : $message");
      return null;
    }
  }

  Future<http.Response?> put(
      String url, int id, Map<String, String> data) async {
    try {
      // the id that will be modified
      Uri urI = Uri.parse("$url/$id");

      var response = await http.put(urI,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data));

      return _handleResponse(response);
    } catch (message) {
      print("Error : $message");
      return null;
    }
  }

  Future<http.Response?> delete(String url, int id) async {
    try {
      Uri urI = Uri.parse("$url/$id");

      var response = await http.delete(
        urI,
        headers: {"Content-Type": "application/json"},
      );

      return _handleResponse(response);
    } catch (message) {
      print("Error : $message");
      return null;
    }
  }

  http.Response? _handleResponse(http.Response response) {
    // we do the same thing now util just in case we didn't wont to do something now
    if (response.statusCode >= 200 && response.statusCode < 300) {
      printFormattedResponse(response.statusCode, response.body);
      return response;
    } else {
      printFormattedResponse(response.statusCode, response.body);
      return response;
    }
  }
}
