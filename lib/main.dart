import 'package:flutter/material.dart';
import 'package:flutter_animated_navigation/fade_transition.dart';
import 'package:flutter_animated_navigation/faded_scale_transition.dart';
import 'package:flutter_animated_navigation/faded_slide_transitions.dart';
import 'package:flutter_animated_navigation/rotated_transition.dart';
import 'package:flutter_animated_navigation/scale_transition.dart';
import 'package:flutter_animated_navigation/second_page.dart';
import 'package:flutter_animated_navigation/size_transition.dart';
import 'package:flutter_animated_navigation/slide_transition.dart';
import 'package:flutter_animated_navigation/third.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: MyHomePage.pageName,
      onGenerateRoute: onGenerateSlideRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  static const String pageName = "/homePage";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      Navigator.of(context).pushNamed(
        ThirdPage.pageName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushNamed(SecondPage.pageName);
                    });
                  },
                  child: Text("Go To Second Page")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushNamed(ThirdPage.pageName);
                    });
                  },
                  child: Text("Go To Third Page")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add)));
  }
}
