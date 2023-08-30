import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:models/models.dart';
import 'package:obrix/ui_layout/my_ui_const_app.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:business_layout/business_layout.dart';

//flutter build web --web-renderer canvaskit
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QbrixBloc>(
      lazy: false,
      create: (context) => QbrixBloc(),
      child: MaterialApp(
        scaffoldMessengerKey: MyUiConstApp.snackBarKey,
        debugShowCheckedModeBanner: false,
        theme: themeLight(context),
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => const HomePage(),
          PdfGeneratePage.id: (context) => const PdfGeneratePage(),
        },
      ),
    );
  }
}
