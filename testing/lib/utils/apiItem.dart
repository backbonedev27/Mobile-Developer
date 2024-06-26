import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ApiItem {
  static const String baseUrl = 'http://localhost:8000';

Future<ItemsResponse> listItems() async {
    final response = await http.get(Uri.parse('$baseUrl/api/items'));

    if (response.statusCode == 200) {
      // Respons JSON memiliki properti "data" yang berisi daftar item
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data']; // Ambil data dari properti "data"
      return ItemsResponse.fromJson(data);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<void> addItem(Item newItem) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/items'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newItem.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add item');
    }
  }
}
