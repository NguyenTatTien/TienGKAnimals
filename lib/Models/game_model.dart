import 'package:momentum/momentum.dart';
import 'package:tiengkanimals/Controllers/game_controller.dart';

class GameModel extends MomentumModel<GameController> {
  String? level_game;
  int? score;
  var show_animal;
  GameModel(GameController controller,
      {required this.level_game, this.score,  this.show_animal})
      : super(controller);
  @override
  void update({String? level_game, int? score, var show_animal}) {
    GameModel(controller, level_game:level_game,score:score,show_animal: show_animal).updateMomentum();
  }
}
