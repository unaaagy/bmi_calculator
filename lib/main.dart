import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/input_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent));
  // make flutter draw behind navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
        textTheme: TextTheme(titleLarge: TextStyle(color: Color(0XFF8D8E98))),
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Color(0xFF8D8E98),
          // overlayColor: Color(0x29EB1555),
          thumbColor: Color(0xFFEB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
          // overlayShape: RoundSliderThumbShape(enabledThumbRadius: 28),
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: InputPage(),
    );
  }
}
