import 'package:flutter/material.dart';
import 'package:idkit_line/idkit_line.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Extension test of line package'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IDKitLine(
              height: 120,
              width: 200,
              align: LineAlign.center,
              axis: Axis.vertical,
              thickness: 2,
              type: LineType.dotted,
              dottedType: DottedType.dash_dot,
              w: 0.2,
              dashLength: 2,
              interval: 2,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
