import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdl_app/library/provider/theme_provider.dart';
import 'package:tdl_app/pages/first_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//initializing the hive(database)
  await Hive.initFlutter();

//open the box
  await Hive.openBox('mybox');
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const TdlApp(),
  ));
}

class TdlApp extends StatelessWidget {
  const TdlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const FirstPage(),
    );
  }
}
