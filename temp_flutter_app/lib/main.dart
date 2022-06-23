import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('sisisisising')),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _tempHumidity = 0;
  double _tempLight = 0;

  double _humidity = 0;
  double _light = 0;

  @override
  void initState() {
    super.initState();
    _tempHumidity = _humidity;
    _tempLight = _light;
  }

  void changeSet() {
    setState(() {
      _humidity = _tempHumidity;
      _light = _tempLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.water_drop,
                  color: Colors.blue,
                  size: 40.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Text('55%'),
                Icon(
                  Icons.light,
                  color: Colors.yellow,
                  size: 40.0,
                ),
                Text('14%'),
                Icon(
                  Icons.nature,
                  color: Colors.green,
                  size: 40.0,
                ),
                Text('35%'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('습도'),
                Slider(
                  value: _tempHumidity,
                  max: 50,
                  divisions: 50,
                  label: _tempHumidity.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _tempHumidity = value;
                    });
                  },
                ),
                Text('$_humidity'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('조도'),
                Slider(
                  value: _tempLight,
                  max: 50,
                  divisions: 50,
                  label: _tempLight.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _tempLight = value;
                    });
                  },
                ),
                Text('$_light'),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  changeSet();
                  final snackBar = SnackBar(
                      content: Text('설정 완료'),
                      action: SnackBarAction(
                        label: '되돌리기',
                        onPressed: () {},
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('변경')),
          ],
        ),
      ),
    );
  }
}
