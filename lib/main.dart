import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healco/pages/disease_list.dart';
import 'package:provider/provider.dart';

import '../data/api/api_service.dart';
import '../provider/page_provider.dart';
import '../provider/detail_provider.dart';
import '../provider/predict_provider.dart';

import '../pages/detail_page.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/main_page.dart';
import '../pages/onboarding_page.dart';
import '../pages/splashscreen_page.dart';
import '../pages/tentang_page.dart';
import '../pages/kontak_page.dart';
import '../pages/predict_page.dart';

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
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'AlbertSans'),
        debugShowCheckedModeBanner: false,
        initialRoute: DiseaseList.routeName,
        routes: {
          SplashScreenPage.routeName: (context) => const SplashScreenPage(),
          OnboardingPage.routeName: (context) => const OnboardingPage(),
          MainPage.routeName: (context) => const MainPage(),
          HomePage.routeName: (context) => const HomePage(),
          StartDetectPage.routeName: (context) => const StartDetectPage(),
          DetailPage.routeName: (context) => const DetailPage(),
          HistoryPage.routeName: (context) => const HistoryPage(),
          KontakPage.routeName: (context) => const KontakPage(),
          TentangPage.routeName: (context) => const TentangPage(),
          DiseaseList.routeName: (context) => const DiseaseList(),
        },
      ),
    );
  }
}
