import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/favourite.dart';
import 'package:provider_demo/provider/foundation.dart';

import 'constants/constants.dart';
import 'count_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialColor = MaterialColor(
        Colors.brown.shade700.value, ColorsConstant().getSwatch(Colors.brown));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => CountProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => FavouriteProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => SliderProvider()),
        ),
                ChangeNotifierProvider(
          create: ((context) => DarkThemeProvider()),
        ),

      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {return  MaterialApp(
          themeMode: value.theme,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: materialColor,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.cyan)
            ),
            home: const FavouritePage()
            // MyHomePage(title: 'Flutter Demo Home Page'),
            ); },
        
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterPro = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      counterPro.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterPro = Provider.of<CountProvider>(context, listen: false);
    final sliderPro = Provider.of<SliderProvider>(context, listen: false);
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
              style: Theme.of(context).textTheme.headline4,
            ),
            Consumer<CountProvider>(
              builder: ((context, value, child) {
                return Text(
                  counterPro.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
            ),
            Consumer<SliderProvider>(builder: ((context, value, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Slider(
                        value: sliderPro.value,
                        onChanged: (val) {
                          sliderPro.change(val);
                        }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.amber.withOpacity(sliderPro.value),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.cyan.withOpacity(sliderPro.value),
                        ),
                      )
                    ],
                  )
                ],
              );
            })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => counterPro.setCount()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
