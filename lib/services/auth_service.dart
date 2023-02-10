import 'dart:convert';

import 'package:ewallet_app/models/signup_form_model.dart';
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

        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  // Future<User> register(SignupFormModel? data) async {
  //   try {
  //     print(data!.toJson());

  //     final res = await http.post(
  //       Uri.parse(
  //         '$baseUrl/register',
  //       ),
  //       body: data!.toJson(),
  //     );
  //     print(res.statusCode);

  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       final user = User.fromJson(jsonDecode(res.body));
  //       user.password = data.password;

  //       // await storeCredentialToLocal(user);

  //       return user!;
  //     } else {
  //       throw jsonDecode(res.body)['message'];
  //     }
  //   } catch (e) {
  //     // print(e);
  //     rethrow;
  //   }
  // }
}
