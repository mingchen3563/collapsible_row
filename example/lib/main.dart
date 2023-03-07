import 'package:collapsible_row/collapsible_row.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key})
      : super(
          key: key,
        );

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  CollapsibleController collapsibleController = CollapsibleController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          collapsibleController.toggle();
                        });
                      },
                      child: const Text('toggle expasion'))
                ],
              ),
              Expanded(
                child: CollapsibleRowTwoColumn(
                  left: Container(
                    color: Colors.red,
                    child: const Placeholder(),
                  ),
                  right: Container(
                    color: Colors.green,
                    child: const Placeholder(),
                  ),
                  controller: collapsibleController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
