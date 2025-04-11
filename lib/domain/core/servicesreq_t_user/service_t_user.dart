import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techqrmaintance/core/strings.dart';

class ServiveTuser {
  late final Dio apidio;
  bool isFetchingToken = false;

  ServiveTuser(): apidio = Dio() {
    apidio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await getOrFetchToken();
            options.headers['Authorization'] = "Bearer $token";
            handler.next(options);
            log("Request Headers: ${options.headers}");
          } catch (e) {
            log("Request Interceptor Error: $e");
            handler.reject(DioException(requestOptions: options, error: e));
          }
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            log("Unauthorized request detected. Fetching new token...");
            await clearStoredToken();

            try {
              final newToken = await getOrFetchToken();
              final options = e.requestOptions;
              options.headers['Authorization'] = "Bearer $newToken";

              // Retry the failed request with a new token
              final retryResponse = await apidio.fetch(options);
              handler.resolve(retryResponse);
            } catch (e) {
              handler.reject(e as DioException);
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
  }

  Future<String> getOrFetchToken() async {
    if (isFetchingToken) {
      log("Token is already being fetched, waiting...");
      await Future.delayed(const Duration(seconds: 1));
      return await getStoredToken() ?? "";
    }

    try {
      final token = await getStoredToken();
      if (token != null) {
        return token;
      }

      isFetchingToken = true;
      log("Fetching new token...");

      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email') ;
      final password = prefs.getString('password') ;

      

      final response = await apidio.post(
        '$kBaseURL$kLogin',
        queryParameters: {
          'email': email,
          'password': password,
        },
      );

      final newToken = response.data["token"];
      if (newToken != null) {
        await storeToken(newToken);
        return newToken;
      } else {
        throw Exception("Token not found in response");
      }
    } catch (e) {
      log("Token Fetch Error: $e");
      return Future.error("Failed to fetch token");
    } finally {
      isFetchingToken = false;
    }
  }

  Future<String?> getStoredToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('serve_token');
  }

  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('serve_token', token);
    log("Token stored successfully");
  }

  Future<void> clearStoredToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('serve_token');
    log("Stored token cleared");
  }
}