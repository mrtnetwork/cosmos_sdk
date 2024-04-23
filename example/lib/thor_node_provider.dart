import 'dart:convert';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:http/http.dart' as http;

class ThornodeHTTPProvider implements ThorNodeServiceProvider {
  ThornodeHTTPProvider(
      {required this.url,
      this.version = "v0",
      this.projectId,
      http.Client? client,
      this.defaultRequestTimeout = const Duration(seconds: 30)})
      : client = client ?? http.Client();
  @override
  final String url;
  final String version;
  final String? projectId;
  final http.Client client;
  final Duration defaultRequestTimeout;

  @override
  Future<dynamic> get(ThorNodeRequestDetails params,
      [Duration? timeout]) async {
    final response = await client.get(Uri.parse(params.url(url)), headers: {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      if (projectId != null) ...{"project_id": projectId!},
    }).timeout(timeout ?? defaultRequestTimeout);
    final data = json.decode(response.body);
    return data;
  }

  @override
  Future<dynamic> post(ThorNodeRequestDetails params,
      [Duration? timeout]) async {
    final response = await client.post(
      Uri.parse(params.url(url)),
      headers: {
        "Accept": "application/json",
        if (projectId != null) ...{"project_id": projectId!},
        ...params.header
      },
    ).timeout(timeout ?? defaultRequestTimeout);
    final data = json.decode(response.body);
    return data;
  }
}
