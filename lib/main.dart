import 'package:flutter/material.dart';
import 'package:flutter_weather/api/dadata/fetch/fetch_city.dart';
import 'package:flutter_weather/api/weather/fetch/fetch_weather_astronomy.dart';
import 'package:flutter_weather/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
