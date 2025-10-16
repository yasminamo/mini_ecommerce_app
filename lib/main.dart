import 'package:flutter/material.dart';
import 'package:miniecommerce_app/providers/cart_providers.dart';
import 'package:miniecommerce_app/providers/product_provider.dart';
import 'package:miniecommerce_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProviders())
      ],
      child: const StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
