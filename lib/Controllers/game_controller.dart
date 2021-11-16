import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:momentum/momentum.dart';
import 'package:tiengkanimals/Models/game_model.dart';

class GameController extends MomentumController<GameModel> {
  String? level_game;
  int score = 0;
  var images = [
    "001-dog",
    "002-bird",
    "003-cat",
    "004-bee",
    "005-fish",
    "006-chicken",
    "007-animal",
    "008-animal-1",
    "009-camel",
    "010-animal-2",
    "011-cow",
    "012-halloween",
    "013-duck",
    "014-snake",
    "015-turkey",
    "016-frog"
  ];
  var animal_data = [];
  var show_animal = [];
  var choose = [];
  int index_choose = 0;
  int number_animals = 0;
  bool? start;
  Timer? timer;
  int time = 0;
  AudioCache audio_cache = new AudioCache();
  @override
  GameModel init() {
    level_game = "Easy";
    animal_data = List.filled(24, "");
    show_animal = List.filled(24, "018-back");
    choose = List.filled(2, "");
    start = false;
    Start_Game(4);
    return GameModel(this,
        level_game: level_game, score: score, show_animal: show_animal);
  }

  void Start_Game(int number_animals) {
    start = false;
    this.number_animals = number_animals;
    animal_data = List.filled(number_animals * 2, "");
    show_animal = List.filled(number_animals * 2, "018-back");
    choose = List.filled(2, "");
    level_game = "Easy";
    ShowAnimals();
  }

  void level(int number_animals) {
    start = false;
    this.number_animals = number_animals;
    animal_data = List.filled(number_animals * 2, "");
    show_animal = List.filled(number_animals * 2, "018-back");
    choose = List.filled(2, "");
    if (number_animals == 4) {
      level_game = "Easy";
    } else if (number_animals == 6) {
      level_game = "Medium";
    } else {
      level_game = "Hard";
    }
    model.update(
        level_game: level_game, score: score, show_animal: show_animal);

    ShowAnimals();
    model.update(
        level_game: level_game, score: score, show_animal: show_animal);
  }
  void ShowAnimals(){
    Random rd = new Random();
    Random rdAnimal = new Random();
 
    for (int i = 0; i < number_animals; i++) {
      var name_amimal = rdAnimal.nextInt(16);
      int count = 0;
      while (true) {
        if (!animal_data.contains(images[name_amimal])) {
          while (true) {
            int rdLoacation = rd.nextInt(number_animals * 2);
            if (animal_data[rdLoacation] == "") {
              animal_data[rdLoacation] = images[name_amimal];

              count++;
            }
            if (count > 1) {
              break;
            }
          }
          break;
        } else {
          name_amimal = rdAnimal.nextInt(16);
        }
      }
    }
    show_animal = animal_data;
  }
  void ClickImage(int index) {
    if (start == true) {
      if (index_choose < 2) {
        choose[index_choose] = animal_data[index];

        if (show_animal[index] != "017-checked") {
          show_animal[index] = animal_data[index];

          model.update(
              level_game: level_game, score: score, show_animal: show_animal);
          index_choose++;
        } else {
          if (index_choose < 1) {
            index_choose = 0;
          }
        }
      }
      if (index_choose == 2) {
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (time > 0) {
            time--;
          } else {
            if (choose[0] == choose[1]) {
              for (int i = 0; i < number_animals * 2; i++) {
                if (show_animal[i] == choose[0]) {
                  audio_cache
                      .play("audios/Am-thanh-tra-loi-dung-chinh-xac.mp3");
                  show_animal[i] = "017-checked";
                }
              }

              score += 10;
              index_choose = 0;
              model.update(
                  level_game: level_game,
                  score: score,
                  show_animal: show_animal);
            } else {
              audio_cache.play("audios/Tieng-bao-sai.mp3");
              for (int i = 0; i < animal_data.length; i++) {
                if (animal_data[i] == choose[0] ||
                    animal_data[i] == choose[1]) {
                  show_animal[i] = "018-back";
                }
              }

              score -= 5;
              index_choose = 0;
              model.update(
                  level_game: level_game,
                  score: score,
                  show_animal: show_animal);
            }
            timer.cancel();
          }
        });
      }
    }
  }

  void Start() {
    if (start == false) {
      start = true;

      show_animal = List.filled(number_animals * 2, "018-back");
      model.update(
          level_game: level_game, score: score, show_animal: show_animal);
    }
  }

  void Restart() {
    score = 0;
    if (level_game == "Easy") {
      level(4);
    } else if (level_game == "Medium") {
      level(6);
    } else {
      level(12);
    }
  }
}
