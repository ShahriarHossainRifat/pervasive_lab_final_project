import 'package:pervasive_lab_final_project/pages/calculator.dart';
import 'package:pervasive_lab_final_project/pages/portfolio.dart';
import 'package:pervasive_lab_final_project/pages/quiz.dart';
import 'package:pervasive_lab_final_project/pages/weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Final Project',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LabFinal(),
    );
  }
}

class LabFinal extends StatefulWidget {
  @override
  _LabFinalState createState() => _LabFinalState();
}

class _LabFinalState extends State<LabFinal> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    Portfolio(),
    Calculator(),
    WeatherProject(),
    Quiz()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Final Project'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Shahriar Hossain Rifat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Portfolio'),
              onTap: () {
                _selectPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Calculator'),
              onTap: () {
                _selectPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Weather'),
              onTap: () {
                _selectPage(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Quiz'),
              onTap: () {
                _selectPage(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentPageIndex],
    );
  }

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contact Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
