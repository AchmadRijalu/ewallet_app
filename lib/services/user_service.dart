import 'dart:convert';

import 'package:ewallet_app/models/user_edit_form_model.dart';
import 'package:ewallet_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

import '../shared/shared_values.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final response = await http.put(Uri.parse("${baseUrl}/users"),
          body: data.toJson(), headers: {'Authorization': token!});

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
