import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = "http://127.0.0.1:8000"; // Use your local IP address

  Future<Map<String, dynamic>?> registerUser(
      String name, String email, String password) async {
    final String url = "$baseUrl/register";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Registration failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final String url = "$baseUrl/login";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        const storage = FlutterSecureStorage();
        await storage.write(key: "email", value: email);
        await storage.write(key: "password", value: password);
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> putChemicalDetails(
      String name,
      String grade,
      double rate,
      int quantity,
      double totalcost,
      double discountedcost,
      DateTime dateOfOrder,
      DateTime dateOfDelivery,
      String remarks,
      String department) async {
    final String url = "$baseUrl/add_chemical_details";
    const storage = FlutterSecureStorage();
    var email = await storage.read(key: "email");
    var password = await storage.read(key: "password");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'grade': grade,
          'rate': rate,
          'quantity': quantity,
          'total_cost': totalcost,
          'discounted_cost': discountedcost,
          'date_of_order': dateOfOrder.toIso8601String(),
          'date_of_delivery': dateOfDelivery.toIso8601String(),
          'remarks': remarks,
          "email": email,
          'password': password,
          'department': department
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDetails(
      String department, String type) async {
    final String url = "$baseUrl/get_details";
    const storage = FlutterSecureStorage();
    var email = await storage.read(key: "email");
    var password = await storage.read(key: "password");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          'password': password,
          "department": department,
          "type": type
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> putInstrumentDetails(
      String name,
      String warranty,
      double rate,
      int quantity,
      double totalcost,
      double discountedcost,
      DateTime dateOfOrder,
      DateTime dateOfDelivery,
      String remarks,
      String department) async {
    final String url = "$baseUrl/add_instrument_details";
    const storage = FlutterSecureStorage();
    var email = await storage.read(key: "email");
    var password = await storage.read(key: "password");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'warranty': warranty,
          'rate': rate,
          'quantity': quantity,
          'total_cost': totalcost,
          'discounted_cost': discountedcost,
          'date_of_order': dateOfOrder.toIso8601String(),
          'date_of_delivery': dateOfDelivery.toIso8601String(),
          'remarks': remarks,
          "email": email,
          'password': password,
          'department': department
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> putGlasswareDetails(
      String name,
      int capacity,
      double rate,
      int quantity,
      double totalcost,
      double discountedcost,
      DateTime dateOfOrder,
      DateTime dateOfDelivery,
      String remarks,
      String department) async {
    final String url = "$baseUrl/add_glassware_details";
    const storage = FlutterSecureStorage();
    var email = await storage.read(key: "email");
    var password = await storage.read(key: "password");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'capacity': capacity,
          'rate': rate,
          'quantity': quantity,
          'total_cost': totalcost,
          'discounted_cost': discountedcost,
          'date_of_order': dateOfOrder.toIso8601String(),
          'date_of_delivery': dateOfDelivery.toIso8601String(),
          'remarks': remarks,
          "email": email,
          'password': password,
          'department': department
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> putSoftwareDetails(
      String name,
      String companySpecification,
      double totalcost,
      double discountedcost,
      DateTime dateOfOrder,
      DateTime dateOfDelivery,
      String remarks,
      String department) async {
    final String url = "$baseUrl/add_software_details";
    const storage = FlutterSecureStorage();
    var email = await storage.read(key: "email");
    var password = await storage.read(key: "password");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'company_specification': companySpecification,
          'total_cost': totalcost,
          'discounted_cost': discountedcost,
          'date_of_order': dateOfOrder.toIso8601String(),
          'date_of_delivery': dateOfDelivery.toIso8601String(),
          'remarks': remarks,
          "email": email,
          'password': password,
          'department': department
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> putTeachingAidsDetails(
      String name,
      String typeOfAids,
      double rate,
      int quantity,
      double totalcost,
      double discountedcost,
      DateTime dateOfOrder,
      DateTime dateOfDelivery,
      String remarks,
      String department) async {
    final String url = "$baseUrl/add_teaching_aids_details";
    const storage = FlutterSecureStorage();
    var email = await storage.read(key: "email");
    var password = await storage.read(key: "password");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'type_of_aids': typeOfAids,
          'rate': rate,
          'quantity': quantity,
          'total_cost': totalcost,
          'discounted_cost': discountedcost,
          'date_of_order': dateOfOrder.toIso8601String(),
          'date_of_delivery': dateOfDelivery.toIso8601String(),
          'remarks': remarks,
          "email": email,
          'password': password,
          'department': department
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }
}
