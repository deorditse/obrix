import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:models/models.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//flutter build web --web-renderer canvaskit
Future<void> main() async {
  //для экрана заставки
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDateFormatting();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MarketplaceApp());
}

//flutter create --template=package

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      initialRoute: HomePage.id,
      routes: {
        PdfGeneratePage.id: (_) => const PdfGeneratePage(croppedFile: null),
        HomePage.id: (_) => const HomePage(),
      },
    );
  }
}
