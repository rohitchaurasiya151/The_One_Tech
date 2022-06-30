import 'dart:math';

import 'package:flutter/material.dart';

class StartGame extends StatefulWidget {
  final int numberOfBox;

  const StartGame({Key? key, required this.numberOfBox}) : super(key: key);

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  List<Color> arrayColor = [];
  int countRedBox = 0;

  @override
  void initState() {
    generateArray();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 140,
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: widget.numberOfBox,
            itemBuilder: (BuildContext ctx, index) {
              // int selectedIndex = myProducts[index]["isSelected"];
              return ElevatedButton(
                style: ElevatedButton.styleFrom(primary: arrayColor[index]),
                onPressed: (arrayColor[index] == Colors.red ||
                        arrayColor[index] == Colors.transparent)
                    ? () {}
                    : () {
                        setState(() {
                          arrayColor[index] = Colors.red;
                          print(index);
                          print(arrayColor[index]);
                          print(Colors.red);
                          changeNo();
                        });
                        if (countRedBox == arrayColor.length) {
                          showDialog(
                              context: ctx,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text("Game Over"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Close"))
                                    ],
                                  ));
                        }
                      },
                child: Container(
                  width: 50,
                ),
              );
            }),
      ),
    );
  }

  void generateArray() {
    for (int i = 0; i < widget.numberOfBox; i++) {
      arrayColor.add(Colors.transparent);
    }
    var rnd = Random();
    int v = rnd.nextInt(widget.numberOfBox);
    arrayColor[v] = Colors.green;
    countRedBox = 1;
  }

  void changeNo() {
    var rnd = Random();
    bool flag = true;
    int countColor = 0;
    int v = rnd.nextInt(widget.numberOfBox);
    for (int i = 0; i < widget.numberOfBox; i++) {
      if (flag) {
        if (arrayColor[v] != Colors.red) {
          flag = false;

          arrayColor[v] = Colors.green;
          break;
        } else {
          v = rnd.nextInt(widget.numberOfBox);
          countColor++;
        }
      }
    }
    countRedBox = countColor;
  }
}
