import 'package:app_dev_spring25/countries/bloc/events.dart';
import 'package:app_dev_spring25/countries/bloc/states.dart';
import 'package:app_dev_spring25/repo/country_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository countryRepository;

  CountryBloc({required this.countryRepository}) 
    : super(CountriesInitial()) {
    on<LoadCountriesEvent>(_onLoadCountries);
  }

  Future<void> _onLoadCountries(
    LoadCountriesEvent event,
    Emitter<CountryState> emit,
  ) async {
    emit( CountriesLoading());
    try {
      final countries = await countryRepository.fetchCountries();
      emit(CountriesLoaded(countries: countries));
    } catch (e) {
      emit(CountriesError(message: e.toString()));
    }
  }
}