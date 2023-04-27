import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swadesh_interview/screens/home.dart';
import 'package:swadesh_interview/state/beneficiary_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BeneficiaryState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff0A6CFF),
        ),
        home: const Home(),
      ),
    );
  }
}
