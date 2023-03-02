import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/api/api_service.dart';
import '../provider/page_provider.dart';
import '../provider/auth_provider.dart';
import '../provider/detail_provider.dart';
import '../provider/history_provider.dart';
import '../provider/login_provider.dart';
import '../provider/predict_provider.dart';
import '../provider/register_provider.dart';
import '../provider/tanggapan_provider.dart';
import '../provider/user_provider.dart';

import '../pages/cara_penggunaan_page.dart';
import '../pages/bantuan_page.dart';
import '../pages/detail_page.dart';
import '../pages/edit_profile.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';
import '../pages/onboarding_page.dart';
import '../pages/profile_page.dart';
import '../pages/register_page.dart';
import '../pages/splashscreen_page.dart';
import '../pages/start_detect_page.dart';
import '../pages/tanggapan_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (context) => RegisterProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<PredictProvider>(
          create: (context) => PredictProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<DetailProvider>(
          create: (context) => DetailProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<HistoryProvider>(
          create: (context) => HistoryProvider(
            apiService: ApiService(),
          ),
        ),
        // ChangeNotifierProvider<DeleteHistoryProvider>(
        //   create: (context) => DeleteHistoryProvider(
        //     apiService: ApiService(),
        //   ),
        // ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<TanggapanProvider>(
          create: (context) => TanggapanProvider(
            apiService: ApiService(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreenPage.routeName,
        routes: {
          SplashScreenPage.routeName: (context) => const SplashScreenPage(),
          OnboardingPage.routeName: (context) => const OnboardingPage(),
          MainPage.routeName: (context) => const MainPage(),
          HomePage.routeName: (context) => const HomePage(),
          StartDetectPage.routeName: (context) => const StartDetectPage(),
          DetailPage.routeName: (context) => const DetailPage(),
          HistoryPage.routeName: (context) => const HistoryPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          ProfilePage.routeName: (context) => const ProfilePage(),
          BantuanPage.routeName: (context) => const BantuanPage(),
          EditProfile.routeName: (context) => const EditProfile(),
          TanggapanPage.routeName: (context) => const TanggapanPage(),
          CaraPenggunaan.routeName: (context) => const CaraPenggunaan(),
        },
      ),
    );
  }
}
