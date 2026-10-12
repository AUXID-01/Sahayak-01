import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  /// Resolve API base URL dynamically based on execution platform
  static String get baseUrl {
    if (kIsWeb) {
      return AppStrings.localHostUrl;
    }
    // Android emulator requires 10.0.2.2, while desktop/iOS can use localhost
    return AppStrings.defaultBaseUrl;
  }

  // Active session cache
  String? _token;
  Map<String, dynamic>? _currentUser;

  String? get token => _token;
  Map<String, dynamic>? get currentUser => _currentUser;
  bool get isAuthenticated => _token != null;

  void setSession(String token, Map<String, dynamic> user) {
    _token = token;
    _currentUser = user;
  }

  void clearSession() {
    _token = null;
    _currentUser = null;
  }

  /// Headers helper
  Map<String, String> _headers({bool withAuth = false}) {
    final headers = {'Content-Type': 'application/json'};
    if (withAuth && _token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  /// 1. User Sign In
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/auth/login');
    final body = jsonEncode({
      'email': email.trim(),
      'password': password.trim(),
    });

    try {
      final response = await http.post(url, headers: _headers(), body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        if (data['token'] != null && data['user'] != null) {
          setSession(data['token'], Map<String, dynamic>.from(data['user']));
        }
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 2. Step 1: Base User Registration
  Future<Map<String, dynamic>> registerBaseUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/api/register');
    final body = jsonEncode(userData);

    try {
      final response = await http.post(url, headers: _headers(), body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data['success'] == true) {
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 3. Step 2: ASHA Role Details Registration
  Future<Map<String, dynamic>> registerAshaDetails(Map<String, dynamic> ashaData) async {
    final url = Uri.parse('$baseUrl/api/register/asha');
    final body = jsonEncode(ashaData);

    try {
      final response = await http.post(url, headers: _headers(), body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data['success'] == true) {
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'ASHA registration failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 4. Step 2: PHC Role Details Registration
  Future<Map<String, dynamic>> registerPhcDetails(Map<String, dynamic> phcData) async {
    final url = Uri.parse('$baseUrl/api/register/phc');
    final body = jsonEncode(phcData);

    try {
      final response = await http.post(url, headers: _headers(), body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data['success'] == true) {
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'PHC registration failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 5. Step 2: Admin Role Details Registration
  Future<Map<String, dynamic>> registerAdminDetails(Map<String, dynamic> adminData) async {
    final url = Uri.parse('$baseUrl/api/register/admin');
    final body = jsonEncode(adminData);

    try {
      final response = await http.post(url, headers: _headers(), body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data['success'] == true) {
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Admin registration failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  /// 6. Fetch Protected Profile
  Future<Map<String, dynamic>> getProfile(String role) async {
    String endpoint;
    if (role == AppStrings.roleAsha) {
      endpoint = '/api/asha/profile';
    } else if (role == AppStrings.rolePhc) {
      endpoint = '/api/phc/profile';
    } else {
      endpoint = '/api/admin/profile';
    }

    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url, headers: _headers(withAuth: true));
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to load profile',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }
}
