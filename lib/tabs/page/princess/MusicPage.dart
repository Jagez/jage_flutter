import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  // 定义ValueNotifier<int> 对象 _counter
  final ValueNotifier<String> _counter = ValueNotifier<String>("0");

  void _incrementCounter() {
    _counter.value += "1";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ValueNotifierTestPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetA(),
              Text('You have pushed the button this many times:'),
              ValueListenableBuilder<String>(
                builder: _buildWithValue,
                valueListenable: _counter,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildWithValue(BuildContext context, String value, Widget? child) {
    return Text(
      '$value',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('I am a widget that will not be rebuilt.');
  }
}
