import 'dart:convert';

import 'dataclasses.dart';
import 'package:http/http.dart' as http;

var _baseURL = "https://6283762138279cef71d77f41.mockapi.io/api/v1/data2";

class Service {
  Future<List<Data>> getAllData() async {
    final response = await http.get(Uri.parse(_baseURL));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => Data.fromJson(e)).toList();
    } else {
      throw Exception('failed to load data');
    }
  }

  Future postData(
    String nama,
    String avatar,
    String alamat,
    String email,
    String pekerjaan,
    String quote,
  ) async {
    final response = await http.post(
      Uri.parse(_baseURL),
      body: {
        'nama': nama,
        'avatar': avatar,
        'alamat': alamat,
        'email': email,
        'pekerjaan': pekerjaan,
        'quote': quote,
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('failed to load data');
    }
  }

  Future<Data> getSingleData(String id) async {
    final response = await http.get(
      Uri.parse('$_baseURL/$id'),
    );

    if (response.statusCode == 200) {
      Data jsonResponse = Data.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(Uri.parse('$_baseURL/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
