// main.dart
import 'package:app_dev_spring25/countries/bloc/countries_bloc.dart';
import 'package:app_dev_spring25/countries/country_page.dart';
import 'package:app_dev_spring25/repo/country_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CountryRepository countryRepository = CountryRepository();
  final CountryBloc countryBloc = CountryBloc(countryRepository: countryRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => countryBloc),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries App',
      
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const CountryScreen(),
    );
  }
}