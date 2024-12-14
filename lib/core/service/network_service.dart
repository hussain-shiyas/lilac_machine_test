import 'package:dummy_project/core/local_storage/storage_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkService {
  String baseUrl="https://test.vehup.com/api/";

  // GET Method
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        // headers: _headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // POST Method
  Future<dynamic> post(String endpoint, {dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        // headers: _headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    // if (StorageServiceMixin().getData<String?>(MainBoxKeys.token) != null) 'Authorization': 'Bearer ${StorageServiceMixin().getData(MainBoxKeys.token)}',
  };
}
