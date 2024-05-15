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
    print(data);
    await client?.post(
      Uri.parse('http://$url:8080/$route'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<dynamic> read({required String route, dynamic data}) async {
    print(data + " fdfdsfsd ");
    var response = await client?.get(
      Uri.parse('http://$url:8080/$route/$data'),
    );
    return json.decode(response!.body);
    
  }

  Future<void> update({required route, required Map data}) async {
    await client?.put(
      Uri.parse(
        'http://$url:8080/$route',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    client?.close();
  }

  Future<void> delete({required String route, required Map data}) async {
    await client?.delete(
      Uri.parse('http://$url:8080/$route'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }
}
