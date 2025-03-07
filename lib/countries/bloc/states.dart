// features/countries/states/country_states.dart
import 'package:app_dev_spring25/countries/model.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class CountriesInitial extends CountryState {
  @override
  List<Object> get props => [];
}

class CountriesLoading extends CountryState {
  @override
  List<Object> get props => [];
}

class CountriesLoaded extends CountryState {
  final List<CountryModel> countries;

  const CountriesLoaded({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountriesError extends CountryState {
  final String message;

  const CountriesError({required this.message});

  @override
  List<Object> get props => [message];
}