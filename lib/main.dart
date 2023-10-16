import 'package:ecommerce_app/common/misc/injection.dart';
import 'package:ecommerce_app/config/routes/route_handler.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Injection.providerList,
      child: MaterialApp(
        title: 'Eccomerce App',
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteHandler.initialRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
