import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  final String apiSignUpEndPoint = 'https://scribblr-backend.vercel.app/user/create';

  final String apiSignInEndPoint = 'https://scribblr-backend.vercel.app/user/signin';

  var headers = {
    'Content-Type': 'application/json'
  };

  Future<void> apiSignUp({required String email, required String username, required String password}) async {
    final response = await http.post(Uri.parse(apiSignUpEndPoint),
        body: json.encode(
          {
            "email": email,
            "username": username,
            "password": password
          },
        ),
        headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  Future<void> apiSignIn({required String password, required String username}) async {
    final response = await http.post(
      Uri.parse(apiSignInEndPoint),
      body: json.encode({
        "username": username,
        "password": password
      }),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
