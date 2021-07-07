import 'package:flutter/material.dart';
import 'numberaudio.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.orange, "Two"),
    NumberAudio("three.wav", Colors.deepPurple, "Three"),
    NumberAudio("four.wav", Colors.indigo, "Four"),
    NumberAudio("five.wav", Colors.green, "Five"),
    NumberAudio("six.wav", Colors.teal, "Six"),
    NumberAudio("seven.wav", Colors.pink, "Seven"),
    NumberAudio("eight.wav", Colors.deepOrange, "Eight"),
    NumberAudio("nine.wav", Colors.cyan, "Nine"),
    NumberAudio("ten.wav", Colors.blue, "Ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Number"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                        color: numberList[i].buttonColor,
                        child: Text(
                          numberList[i].buttonText,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          play(numberList[i].audioUri);
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
