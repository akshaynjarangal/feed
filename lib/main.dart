import 'package:feed/core/constants/app_constants.dart';
import 'package:feed/core/utils/app_colors.dart';
import 'package:feed/presentation/pages/home_screen.dart';
import 'package:feed/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        title: 'Novi Feed',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: AppColors.foreground,
            ),
            bodyMedium: TextStyle(
              color: AppColors.foreground,
            ),
            bodySmall: TextStyle(
              color: AppColors.foreground,
            ),
            titleLarge: TextStyle(
              color: AppColors.foreground,
            ),
            titleMedium: TextStyle(
              color: AppColors.foreground,
            ),
            titleSmall: TextStyle(
              color: AppColors.foreground,
            ),
          ),
          scaffoldBackgroundColor: AppColors.scaffold,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
            foregroundColor: AppColors.foreground,
            backgroundColor: AppColors.scaffold,
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        navigatorKey: navkey,
        initialRoute: '/home',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
