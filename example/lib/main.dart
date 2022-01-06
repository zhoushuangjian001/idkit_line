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
            IDKitLine.solid(),
            const SizedBox(height: 20),
            IDKitLine.solid(
              color: Colors.red,
              width: 300,
              height: 5,
              thickness: 3,
            ),
            const SizedBox(height: 20),
            IDKitLine.solid(
              color: Colors.purple,
              width: 300,
              axis: Axis.vertical,
              height: 20,
            ),
            const SizedBox(height: 20),
            IDKitLine.dotted(),
            const SizedBox(height: 20),
            IDKitLine.dotted(
              dashLength: 5,
              interval: 3,
              thickness: 3,
            ),
            const SizedBox(height: 20),
            IDKitLine.dotted(
              width: 200,
              color: Colors.purple,
              dashLength: 5,
              interval: 3,
            ),
            const SizedBox(height: 20),
            IDKitLine.dotted(
              dashLength: 5,
              interval: 3,
              dottedType: DottedType.dash_dot,
            ),
            const SizedBox(height: 20),
            IDKitLine.dotted(
              width: 200,
              color: Colors.purple,
              dashLength: 10,
              interval: 3,
              thickness: 4,
              dottedType: DottedType.dash_dot,
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                IDKitLine.dotted(
                  width: 200,
                  height: 30,
                  color: Colors.purple,
                  dashLength: 5,
                  interval: 3,
                  axis: Axis.vertical,
                ),
                IDKitLine.dotted(
                  width: 200,
                  height: 30,
                  color: Colors.purple,
                  dashLength: 5,
                  interval: 3,
                  dottedType: DottedType.dash_dot,
                  axis: Axis.vertical,
                )
              ],
            ),
            const SizedBox(height: 20),
            IDKitLine.wavy(),
            const SizedBox(height: 20),
            IDKitLine.wavy(
              color: Colors.red,
              width: 300,
            ),
            const SizedBox(height: 20),
            IDKitLine.wavy(
              axis: Axis.vertical,
              height: 200,
              thickness: 4,
              a: 6,
              w: 0.2,
            ),
            const SizedBox(height: 20),
            IDKitLine.delete(
              child: const Text('¥：10'),
              thickness: 2,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            IDKitLine.delete(
              child: const Text('¥：10000000000'),
              thickness: 4,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
