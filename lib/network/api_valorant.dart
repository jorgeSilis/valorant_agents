import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/agents_model.dart';

class ValorantAPI {
  static const String _baseUrl = 'https://valorant-api.com/v1';

  static Future<List<Agent>> getAgents() async {
    final response = await http.get(Uri.parse('$_baseUrl/agents?isPlayableCharacter=true&language=es-MX'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
       //print(jsonResponse);
      return List<Agent>.from(jsonResponse['data'].map((json) => Agent.fromJson(json)));
    } else {
      throw Exception('Failed to load agents from Valorant API');
    }
  }

}