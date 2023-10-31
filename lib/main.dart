import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pixwalls/config/routes.dart';
import 'package:pixwalls/data/images.dart';

void main() async {
  await GetStorage.init();
  if (GetStorage().read("fav_data") != null) {
    favImages = GetStorage().read("fav_data");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.grey,
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      initialRoute: "/splash",
      onGenerateRoute: Routes.onGeneratedRoutes,
    );
  }
}
