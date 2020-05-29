import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class XylophoneButton {
  final String soundNote;
  final Color buttonColor;

  XylophoneButton(this.soundNote, this.buttonColor);
}

class MyApp extends StatelessWidget {
  final List<XylophoneButton> xylophone = List.generate(
    7,
    (index) => XylophoneButton(
      "note${index + 1}.wav",
      Colors.orange[(index + 1) * 100],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Play Audio Files"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (int i = 0; i < xylophone.length; i++)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      final player = AudioCache();
                      player.play(xylophone[i].soundNote);
                    },
                    child: Container(
                      color: xylophone[i].buttonColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
