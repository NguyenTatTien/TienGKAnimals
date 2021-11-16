import 'package:flutter/cupertino.dart';
import 'package:momentum/momentum.dart';
import 'package:tiengkanimals/Controllers/game_controller.dart';
import 'package:tiengkanimals/Models/game_model.dart';
import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MomentumBuilder(
        controllers: [GameController],
        builder: (context, snashot) {
          var model = snashot<GameModel>();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                child: Text(
                                  "Level: ${model.level_game}",
                                  style: TextStyle(
                                      color: Colors.red[400], fontSize: 20),
                                ),
                                padding: EdgeInsets.all(10),
                              ))),
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                child: Text("Score ${model.score}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.red[400], fontSize: 20)),
                                padding: EdgeInsets.all(10),
                              ))),
                    ],
                  ),
                )),
                Expanded(
                    child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                child: ElevatedButton(
                                    child: Text("Easy"),
                                    onPressed: () =>Momentum.controller<GameController>(context).level(4),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.lightGreen)),
                                padding: EdgeInsets.all(10),
                              ))),
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                  child: ElevatedButton(
                                    child: Text("Medium"),
                                    onPressed: () => Momentum.controller<GameController>(context).level(6),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                  ),
                                  padding: EdgeInsets.all(10)))),
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                child: ElevatedButton(
                                    child: Text("Hard"),
                                    onPressed: () => Momentum.controller<GameController>(context).level(12),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red)),
                                padding: EdgeInsets.all(10),
                              ))),
                    ],
                  ),
                )),
                for (int i = 0; i < Momentum.controller<GameController>(context).number_animals * 2; i = i + 4)
                  Expanded(
                      child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int j = 0; j < 4; j++)
                                  Expanded(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: Container(
                                            child: InkWell(
                                              onTap: () =>Momentum.controller<GameController>(context).ClickImage(i + j),
                                              child: Image.asset(
                                                  "assets/images/${model.show_animal[i + j]}.png"),
                                            ),
                                            padding: EdgeInsets.all(10),
                                          ))),
                              ]))),
                Expanded(
                    child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                child: ElevatedButton(
                                    child: Text(
                                      "Start",
                                      style: TextStyle(color: Colors.red[300]),
                                    ),
                                    onPressed: () => Momentum.controller<GameController>(context).Start(),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue[50])),
                                padding: EdgeInsets.all(10),
                              ))),
                      Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Container(
                                child: ElevatedButton(
                                    child: Text("Restart",
                                        style:
                                            TextStyle(color: Colors.red[300])),
                                    onPressed: () => Momentum.controller<GameController>(context).Restart(),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue[50])),
                                padding: EdgeInsets.all(10),
                              ))),
                    ],
                  ),
                )),
              ],
            ),
          );
        });
  }
}
