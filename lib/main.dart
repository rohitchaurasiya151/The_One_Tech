import 'package:flutter/material.dart';
import 'package:game_app/start_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Game',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: TextFormField(
                controller: numController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder()
                ),

              ),
            ),
            ElevatedButton(onPressed: (){

              if(numController.text.isNotEmpty){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StartGame(numberOfBox: int.parse(numController.text))));
              }
            }, child: const Text("Next"),)
          ],
        ),
      ),
    );
  }
}
