import 'package:flutter/material.dart';
import '../models/data_model.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
bool isPlaying = false;
double progress = 0.0;
double duration = 0.0;

Future<void> _speak(String text) async {
  await flutterTts.setLanguage('ru-RU');
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(text);
}

class DetailActivity extends StatefulWidget {
  final DataModel data;
  final String defaultImage = 'default_image.jpg';

  const DetailActivity({required this.data});

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  @override
  void initState() {
    super.initState();
    flutterTts.setProgressHandler((String text, int start, int end, String word) {
      setState(() {
        progress = start.toDouble();
        duration = end.toDouble();
      });
    });
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
        progress = 0.0;
        duration = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Activity',
          style: TextStyle(
            fontFamily: 'SF Pro Text', // Используйте шрифт SF Pro Text
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'ID: ${widget.data.id}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Text', // Используйте шрифт SF Pro Text
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Name: ${widget.data.name}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Text', // Используйте шрифт SF Pro Text
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Description: ${widget.data.description}',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'SF Pro Text', // Используйте шрифт SF Pro Text
              ),
            ),
          ),

          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(
              'assets/${widget.data.imageName}.jpg',
              fit: BoxFit.contain,
              height: 200,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset(
                  'assets/${widget.defaultImage}',
                  fit: BoxFit.contain,
                  height: 200,
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (!isPlaying) {
                _speak(widget.data.description);
                setState(() {
                  isPlaying = true;
                });
              } else {
                flutterTts.stop();
                setState(() {
                  isPlaying = false;
                  progress = 0.0;
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isPlaying ? 'Stop' : 'Play',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SF Pro Text', // Используйте шрифт SF Pro Text
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 200.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: progress / widget.data.description.length.toDouble(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF517398), // Установите нужный цвет фона здесь

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.white, // Установите цвет иконки здесь
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}