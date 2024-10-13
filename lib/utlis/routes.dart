import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:purchase_inventory/features/biotech/binding/biotech_binding.dart';
import 'package:purchase_inventory/features/botany/binding/botany_binding.dart';
import 'package:purchase_inventory/features/chemistry/binding/chemistry_binding.dart';
import 'package:purchase_inventory/features/computer%20science/binding/computer_science_binding.dart';
import 'package:purchase_inventory/features/information%20technology/binding/information_technology_binding.dart';
import 'package:purchase_inventory/features/dashboard/binding/dashboard_binding.dart';
import 'package:purchase_inventory/features/login/binding/login_binding.dart';
import 'package:purchase_inventory/features/mathematics/binding/mathematics_binding.dart';
import 'package:purchase_inventory/features/physics/binding/physics_binding.dart';
import 'package:purchase_inventory/features/sign%20up/binding/sign_up_binding.dart';
import 'package:purchase_inventory/features/sign%20up/sign_up.dart';
import 'package:purchase_inventory/features/zoology/binding/zoology_binding.dart';
import 'package:purchase_inventory/features/biotech/biotech.dart';
import 'package:purchase_inventory/features/chemistry/chemistry.dart';
import 'package:purchase_inventory/features/computer%20science/computer_science.dart';
import 'package:purchase_inventory/features/dashboard/dashboard.dart';
import 'package:purchase_inventory/features/information%20technology/information_technology.dart';
import 'package:purchase_inventory/features/login/login.dart';
import 'package:purchase_inventory/features/botany/botany.dart';
import 'package:purchase_inventory/features/mathematics/mathematics.dart';
import 'package:purchase_inventory/features/physics/physics.dart';
import 'package:purchase_inventory/features/zoology/zoology.dart';

import 'package:purchase_inventory/S.dart';

class MyRoutes {
  static const String initialRoute = '/initialRoute';
  static String dashboardRoute = "/Dashboard";
  static String loginRoute = "/Login";
  static String signUpRoute = "/SignUp";
  static String botanyRoute = "/Botany";
  static String zoologyRoute = "/Zoology";
  static String physicsRoute = "/Physics";
  static String chemistryRoute = "/Chemistry";
  static String biotechRoute = "/Biotech";
  static String mathematicsRoute = "/Mathematics";
  static String itRoute = "/IT";
  static String csRoute = "/CS";
  static String sRoute = "/S";

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const Login(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: dashboardRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Login();
            } else {
              return const Dashboard();
            }
          },
        );
      },
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: loginRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Login();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUpRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const SignUp();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: botanyRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Botany();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        BotanyBinding(),
      ],
    ),
    GetPage(
      name: zoologyRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Zoology();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        ZoologyBinding(),
      ],
    ),
    GetPage(
      name: physicsRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Physics();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        PhysicsBinding(),
      ],
    ),
    GetPage(
      name: chemistryRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Chemistry();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        ChemistryBinding(),
      ],
    ),
    GetPage(
      name: biotechRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Biotech();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        BiotechBinding(),
      ],
    ),
    GetPage(
      name: mathematicsRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const Mathematics();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        MathematicsBinding(),
      ],
    ),
    GetPage(
      name: itRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const IT();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        ITBinding(),
      ],
    ),
    GetPage(
      name: csRoute,
      page: () {
        const storage = FlutterSecureStorage();
        return FutureBuilder<String?>(
          future: storage.read(key: "email"),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading email'));
            } else if (snapshot.data == null) {
              return const CS();
            } else {
              return const Login();
            }
          },
        );
      },
      bindings: [
        CSBinding(),
      ],
    ),
    GetPage(
      name: sRoute,
      page: () => const S(),
    ),
  ];
}

void onTapBiotech() {
  Get.offAllNamed(MyRoutes.biotechRoute);
}

void onTapBotany() {
  Get.offAllNamed(MyRoutes.botanyRoute);
}

void onTapChemistry() {
  Get.offAllNamed(MyRoutes.chemistryRoute);
}

void onTapCS() {
  Get.offAllNamed(MyRoutes.csRoute);
}

void onTapDashboard() {
  Get.offAllNamed(MyRoutes.dashboardRoute);
}

void onTapIT() {
  Get.offAllNamed(MyRoutes.itRoute);
}

void onTapLogin() {
  Get.offAllNamed(MyRoutes.loginRoute);
}

void onTapSignUp() {
  Get.offAllNamed(MyRoutes.signUpRoute);
}

void onTapMaths() {
  Get.offAllNamed(MyRoutes.mathematicsRoute);
}

void onTapPhysics() {
  Get.offAllNamed(MyRoutes.physicsRoute);
}

void onTapZoology() {
  Get.offAllNamed(MyRoutes.zoologyRoute);
}
