import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiminweb/resource/colors.dart';
import 'package:jiminweb/view/root.dart';

void main() {
  runApp(ProviderScope(child: const AppTheme()));
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PORTFOLIO',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors().primaryColor,
      ),
      home: const RootScreen(),
    );
  }
}