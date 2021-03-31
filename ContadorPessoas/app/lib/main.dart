import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _result = "Pode Entrar";

  void _changePeople(int change) {
    setState(() {
      _people += change;
      _result = _people < 0
          ? "Mundo Invertido"
          : _people <= 10
              ? "Pode Entrar"
              : "Lotado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      home: Stack(
        children: <Widget>[
          Image.asset(
            'images/restaurant.jpg',
            fit: BoxFit.cover,
            height: 1000,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_people',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      child: Text(
                        '+1',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => _changePeople(1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: Text(
                        '-1',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => _changePeople(-1),
                    ),
                  ),
                ],
              ),
              Text(
                _result,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
