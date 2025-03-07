// models/country_model.dart
import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final String name;
  final String capital;
  final String region;
  final String subregion;
  final int population;
  final String flag;

  const CountryModel({
    required this.name,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'] ?? '',
      capital: (json['capital'] ?? [''])[0],
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      population: json['population'] ?? 0,
      flag: json['flags']['png'] ?? '',
    );
  }

  @override
  List<Object?> get props => [name, capital, region, subregion, population, flag];
}