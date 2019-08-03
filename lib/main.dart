
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajarprovider/counter.dart';
import 'package:belajarprovider/counter2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Counter(0)),
        ChangeNotifierProvider(builder: (_) => Counter2(2)),
      ],
      child: Consumer2<Counter, Counter2>(
        builder: (context, a, b, _) {
          return MaterialApp(
            title: 'Belajar Provider',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final counter = Provider.of<Counter>(context);
    final counter2 = Provider.of<Counter2>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '${counter2.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              counter2.getFinal( counter.getCounter() , counter2.getCounter()).toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counter2.decrement,
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}