import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const String url = 'http://192.168.254.144:8080';

class HttpService {
  static final _service = HttpService._sharedInstance();
  factory HttpService() => _service;
  HttpService._sharedInstance();

  Client? client;
  void init() async {
    client = http.Client();
  }

  Future<void> write({required String route, required Map data}) async {
    await client?.post(
      Uri.parse('$url$route'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<dynamic> read({required String route, String id = ''}) async {
    var response = await client?.get(
      headers: {'Content-Type': 'application/json'},
      Uri.parse('$url$route/$id'),
    );
    return json.decode(response!.body);
  }

  Future<void> update({
    required route,
    required String id,
    required Map data,
  }) async {
    await client?.put(
      Uri.parse(
        '$url$route/$id',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<void> delete({required String route, required String id}) async {
    await client?.delete(
      Uri.parse('$url$route/$id'),
      headers: {'Content-Type': 'application/json'},
    );
  }

  
}
