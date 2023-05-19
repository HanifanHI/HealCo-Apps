import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/api/api_service.dart';
import '../provider/db_provider.dart';
import '../provider/disease_provider.dart';
import '../provider/search_provider.dart';
import '../provider/page_provider.dart';
import '../provider/detail_provider.dart';
import '../provider/predict_provider.dart';

import '../pages/detail_page.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/main_page.dart';
import '../pages/onboarding_page.dart';
import '../pages/splashscreen_page.dart';
import '../pages/predict_page.dart';
import '../pages/disease_list.dart';
import '../pages/petunjuk_page.dart';

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
        ChangeNotifierProvider<DiseaseProvider>(
          create: (context) => DiseaseProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'AlbertSans'),
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
          DiseaseList.routeName: (context) => const DiseaseList(),
          PetunjukPage.routeName: (context) => const PetunjukPage(),
        },
      ),
    );
  }
}
