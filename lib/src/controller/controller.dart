import 'dart:convert';
import '../model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:io'; // Import dart:io for file operations
import '../view/view.dart';

class ControllerManga {
  final List<ModelManga> mangas;
  final ViewManga view;

  const ControllerManga(this.mangas, this.view);

  Future<void> fetchMangas() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.mangadex.org/manga?limit=5&offset=1&includes[]=author'));

      if (response.statusCode == 200) {
        // Parse the response as a map (object)
        Map<String, dynamic> jsonData = json.decode(response.body);

        // Extract the list from the "data" key
        List<dynamic> mangasData = jsonData['data'];

        // Clear existing data and add the new mangas
        mangas.clear();
        for (var item in mangasData) {
          mangas.add(
              ModelManga.fromJson(item)); // Assuming fromJson is implemented
        }

        // Display the fetched manga
        view.viewMangas(mangas);

        // Save data to JSON file
        await saveMangasToFile();
      } else {
        print('Failed to load mangas');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> saveMangasToFile() async {
    try {
      // Create a list of JSON objects from the mangas list
      List<Map<String, dynamic>> jsonMangas =
          mangas.map((manga) => manga.toJson()).toList();

      // Convert the list to a JSON string
      String jsonString = json.encode(jsonMangas);

      // Write the JSON string to a file (in current directory as "mangas.json")
      File file = File('mangas.json');
      await file.writeAsString(jsonString);

      print('Data successfully saved to mangas.json');
    } catch (e) {
      print('Failed to save data to file: $e');
    }
  }
}
