import '../model/model.dart';

class ViewManga{
  void view(ModelManga manga) {
    String display = manga.desc != null ? '${manga.desc}' : 'not provided';
    print('this Manga title is ${manga.title} and the description are $display');
  }

  void viewMangas(List<ModelManga> mangas){
    for (var manga in mangas) {
      view(manga);
    }
  }
}