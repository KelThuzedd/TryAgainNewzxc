import 'package:flutter/material.dart';
import '../models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/data_model.dart';


final FlutterTts flutterTts = FlutterTts();
bool isPlaying = false;

Future<void> _speak(String text) async {
  await flutterTts.setLanguage('ru-RU');
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(text);
}


class DetailActivity extends StatelessWidget {
  final DataModel data;

  const DetailActivity({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Activity'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('ID: ${data.id}'),
          Text('Name: ${data.name}'),
          Text('Description: ${data.description}'),
          SizedBox(height: 16.0),
          Image.asset(
            'assets/${data.imageName}.jpg',
            fit: BoxFit.contain,
            height: 200,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (!isPlaying) {
                _speak(data.description);
                isPlaying = true;
              } else {
                flutterTts.stop();
                isPlaying = false;
              }
            },
            child: Text(isPlaying ? 'Stop' : 'Play'),
          ),
        ],
      ),
    );
  }}