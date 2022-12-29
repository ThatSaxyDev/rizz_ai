import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rizz/shared/utils/constants.dart';
import 'package:rizz/shared/utils/alert.dart';
import 'package:rizz/shared/utils/error_handling.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestServices {

  // image generation
  Future<String> generateImage({
    required BuildContext context,
    required String description,
  }) async {
    String imgUrl = '';
    try {
      final body = {
        'prompt': description,
      };

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/openai/generateimage'),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      var response = jsonDecode(res.body);
      var imgRes = response['data'];

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          log(imgRes);
        },
      );

      imgUrl = imgRes;
    } catch (e) {
      log(e.toString());
      showAlert(context, e.toString());
    }

    return imgUrl;
  }

  // summary
  Future<String> summarizeText({
    required BuildContext context,
    required String text,
  }) async {
    String summary = '';
    try {
      final body = {
        'prompt': text,
      };

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/openai/summarizetext'),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      var response = jsonDecode(res.body);
      var summaryRes = response['data'];

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          log(summaryRes);
        },
      );

      summary = summaryRes;
    } catch (e) {
      log(e.toString());
      showAlert(context, e.toString());
    }

    return summary;
  }
}

class Img {
  final String imageUrl;

  Img(this.imageUrl);
}
