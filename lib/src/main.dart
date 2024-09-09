import './controller/controller.dart';
import './view/view.dart';
import './model/model.dart';

void main() async {
  List<ModelManga> mangas = [];
  ViewManga view = ViewManga();
  ControllerManga controller = ControllerManga(mangas, view);

  await controller.fetchMangas();
}

