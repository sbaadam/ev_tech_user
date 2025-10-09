// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/provider/connectivity_provider.dart';
import 'package:ev_tech_user/provider/no_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'api_conts.dart';

class NetworkProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl, connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(seconds: 30), headers: {'Accept': 'application/json'}));

  /// 🔹 GET Request with connectivity check
  Future<Response?> getRequest(BuildContext context, String endpoint, {Map<String, dynamic>? queryParams, Map<String, String>? headers}) async {
    final isConnected = Provider.of<ConnectivityProvider>(context, listen: false).isConnected;
    if (!isConnected) {
      _navigateNoConnectionScreen(context);
      return null;
    }

    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams, options: Options(headers: headers ?? {}));
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }

  /// 🔹 POST Request with connectivity check
  Future<Response?> postRequest(BuildContext context, String endpoint, {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    final isConnected = Provider.of<ConnectivityProvider>(context, listen: false).isConnected;
    if (!isConnected) {
      _navigateNoConnectionScreen(context);
      return null;
    }

    try {
      final response = await _dio.post(endpoint, data: body, options: Options(headers: headers ?? {}));
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }
  Future<Response?> deleteRequest(
      BuildContext context,
      String endpoint, {
        Map<String, String>? headers,
      }) async {
    // Connectivity check
    final isConnected =
        Provider.of<ConnectivityProvider>(context, listen: false).isConnected;
    if (!isConnected) {
      _navigateNoConnectionScreen(context);
      return null;
    }

    try {
      final response =
      await _dio.delete(endpoint, options: Options(headers: headers ?? {}));
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }

    return null;
  }

  /// 🔹 POST Request with File Upload
  Future<Response?> postRequestWithFile(BuildContext context, String endpoint, {required FormData body, Map<String, String>? headers}) async {
    final isConnected = Provider.of<ConnectivityProvider>(context, listen: false).isConnected;
    if (!isConnected) {
      _navigateNoConnectionScreen(context);
      return null;
    }

    try {
      final response = await _dio.post(endpoint, data: body, options: Options(headers: headers ?? {}));
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
    return null;
  }

  /// 🔹 Navigate to NoConnectionScreen
  void _navigateNoConnectionScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const NoConnectionScreen()));
  }

  /// 🔹 Error handling
  void _handleError(DioException e) {
    if (e.response != null) {
      if(e.response?.statusCode!=404){
        showToast('${e.response?.statusCode} → ${e.response?.data}');
        debugPrint("❌ API Error: ${e.response?.statusCode} → ${e.response?.data}");
      }
    } else {
      debugPrint("❌ Network Error: ${e.message}");
      showToast("❌ Network Error: ${e.message}");
    }
  }
}
