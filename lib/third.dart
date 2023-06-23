import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  static const String pageName = "/thirdPage";

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Third Page",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Exit'))
          ],
        ),
      ),
    );
  }
}
