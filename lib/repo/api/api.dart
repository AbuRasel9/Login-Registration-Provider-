import 'dart:convert';

import 'package:http/http.dart';

Future<dynamic> postRequest(body, {required String url}) async {
  Response response = await post(Uri.parse(url),    headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  },
    body: jsonDecode(body)

  );
}
