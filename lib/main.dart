import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/auth/auth.dart';
import 'package:to_do_c10_monday/home/home_screen.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/add_task_bottom_sheet_provider.dart';
import 'package:to_do_c10_monday/providers/home_screen_provider.dart';
import 'package:to_do_c10_monday/providers/main_provider.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';
import 'package:to_do_c10_monday/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "keys.env");

  // Initialize Firebase
  try {
    print('Initializing Firebase...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully.');
  } catch (e) {
    print('Error initializing Firebase: $e');
    return;
  }
  LocalJsonLocalization.delegate.directories = ['lib/i18n'];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => AddTaskBottomSheetProvider()),
        ChangeNotifierProvider(create: (context) => SelectedDateProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'localizations Sample App',
      localizationsDelegates: [
        LocalJsonLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale("${provider.languageCode}"),
      //locale: Locale("${provider.languageCode}"),
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : AuthScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        AuthScreen.routeName: (context) => AuthScreen(),
      },
    );
  }
}
