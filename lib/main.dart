import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:purchase_inventory/utlis/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: MyRoutes.initialRoute,
      getPages: MyRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
