import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager_app/app.dart';
import 'package:task_manager_app/data/models/auth_utility.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/ui/screens/auth/login_screen.dart';

class NetworkCaller {
  // --------- get request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url), headers: {
        'token': AuthUtility.userInfo.token.toString(),
      });
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        goToLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  // ------------ Post Request
  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body, {bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtility.userInfo.token.toString(),
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        if (isLogin) {
          goToLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> goToLogin() async {
    await AuthUtility.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
