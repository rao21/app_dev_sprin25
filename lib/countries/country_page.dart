import 'package:app_dev_spring25/countries/bloc/countries_bloc.dart';
import 'package:app_dev_spring25/countries/bloc/events.dart';
import 'package:app_dev_spring25/countries/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
     @override
      void initState() {
        context.read<CountryBloc>().add(LoadCountriesEvent());
        super.initState();
        
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries List'),
      ),
      
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          
          if (state is CountriesInitial || state is CountriesLoading) {
            return Text('Loading');
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountriesLoaded) {
            return Text('Data loaded');
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blue.shade100.withValues(alpha: 0.1),
                    child: ListTile(
                      leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage(country.flag),
                  backgroundColor: Colors.transparent,
                                ),
                      title: Text(country.name),
                      subtitle: Text('Capital: ${country.capital}'),
                    ),
                  ),
                );
              },
            );
          } else if (state is CountriesError) {

            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      
    );
  }
}