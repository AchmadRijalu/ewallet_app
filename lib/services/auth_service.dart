import 'dart:convert';

import 'package:ewallet_app/models/signin_form_model.dart';
import 'package:ewallet_app/models/signup_form_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../shared/shared_values.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http
          .post(Uri.parse('${baseUrl}/is-email-exist'), body: {'email': email});

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      }
      //test dulu value errors selain code 200
      else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> register(SignupFormModel data) async {
    try {
      final response = await http.post(Uri.parse("${baseUrl}/register"),
          body: data!.toJson());
      print(response.body);
      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body));
        user.password = data.password;

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> login(SigninFormModel data) async {
    try {
      final response =
          await http.post(Uri.parse("${baseUrl}/login"), body: data!.toJson());
      print(response.body);
      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body));
        user.password = data.password;

        await storeCredentialToLocal(user);
        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  //Saving credential Account into local
  Future<void> storeCredentialToLocal(User user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SigninFormModel?> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, dynamic> values = await storage.readAll();
      if (values['email'] == null || values['password'] == null) {
        throw 'Authenticated';
      } else {
        final SigninFormModel? data = SigninFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  //get Token
  Future<String?> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();

    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer ' + value;
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
