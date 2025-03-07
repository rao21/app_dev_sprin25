import 'package:app_dev_spring25/provider/character_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CharacterProvider with ChangeNotifier {
     
     List<Character> characters = [];
     bool isLoading = false;

     Future<void> fetchCharacters() async {
       isLoading = true;
       notifyListeners();
        final url = 'https://api.sampleapis.com/avatar/characters';
       try {
         final response = await http.get(Uri.parse(url));
         if (response.statusCode == 200) {
           final List<dynamic> data = json.decode(response.body);
           characters = data.map((json) => Character.fromJson(json)).toList();
         }
       } catch (e) {
         print('Error fetching characters: $e');
       }
       isLoading = false;
       notifyListeners();
     }
   }
