import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();
}

class LoadCountriesEvent extends CountryEvent {
  @override
  List<Object> get props => [];
}