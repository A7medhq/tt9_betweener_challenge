import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/link_response_model.dart';
import 'package:tt9_betweener_challenge/models/user.dart';

import '../models/link_old.dart';
import 'package:http/http.dart' as http;

import '../views_features/auth/login_view.dart';

Future<List<Link>> getLinks(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);

  final response = await http.get(Uri.parse(linksUrl),
      headers: {'Authorization': 'Bearer ${user.token}'});

  print(jsonDecode(response.body)['links']);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['links'] as List<dynamic>;

    return data.map((e) => Link.fromJson(e)).toList();
  }

  if (response.statusCode == 401) {
    Navigator.pushReplacementNamed(context, LoginView.id);
  }

  return Future.error('Somthing wrong');
}

class LinkRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  //example - you can use cashed user token
  String userToken = '1|LajBiiQSs1r9FOVowIXKpdFJYQAzCvrhCOjND7iM';
  Future<List<Link>> fetchLinkList() async {
    final response = await _helper.get(
      '/links',
      {
        "Authorization": 'Bearer $userToken',
      },
    );
    return LinkResponseModel.fromJson(response).links as List<Link>;
  }
}
