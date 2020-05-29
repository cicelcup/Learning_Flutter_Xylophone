import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black // status bar color
      ));
  runApp(MyApp());
}

class XylophoneButton {
  final String soundNote;
  final MaterialColor buttonColor;

  XylophoneButton({this.soundNote, this.buttonColor});
}

class MyApp extends StatelessWidget {
  final List<XylophoneButton> xylophone = List.generate(
    7,
    (index) => XylophoneButton(
      soundNote: "note${index + 1}.wav",
      buttonColor: colors[index],
    ),
  );

  static final List<MaterialColor> colors = [
    Colors.orange,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.pink,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (int i = 0; i < xylophone.length; i++)
                Expanded(
                  child: FlatButton(
                    child: Container(),
                    color: xylophone[i].buttonColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      final player = AudioCache();
                      player.play(xylophone[i].soundNote);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
