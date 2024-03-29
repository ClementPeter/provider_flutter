// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'counter_provider/counter_provider.dart';

// //First Provider Usage -- ChangeNotifierProvider
// //ChangeNotifierProvider helps to create instances of the ChangeNotifier class

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //Change Notifier Provider helps our app to create an Instance of the Providers we created
//     return ChangeNotifierProvider(
//       create: (context) => CounterProvider(),
//       child: MaterialApp(
//         title: 'Provider_Flutter',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Provider_Flutter'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     //Consumer helps to pass data from the change notifier class
//     // in order to trigger an update to the widget we want to update
//     return Consumer<CounterProvider>(builder: (context, data, child) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('You have pushed the button this many times:'),
//               Text(
//                 '${data.getCounter}',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FloatingActionButton(
//               onPressed: () {
//                 data.incrementCounter();
//               },
//               tooltip: 'Increment',
//               child: const Icon(Icons.add),
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 data.decrementCounter();
//               },
//               tooltip: 'decrement',
//               child: const Icon(Icons.remove),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //2nd Usage using MultiProvider and Consumer to increase, decrease counter and toggle light/dark mode
//There is really no point using stateful widget with PROVIDER
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider/counter_provider.dart';

void main() {
  //MultiProvider helps us pass multiple provider just in case we have more than one
  runApp(MultiProvider(
    providers: [
      //MultiProvider helps us pass multiple provider just in case we have more than one
      ChangeNotifierProvider(create: (context) => CounterProvider()),
    ],
    child: const MyApp(),
  ));
}

//ChangeNotifierProvider(create = (context) => CounterProvider()),

//bool isDark = true; //hold dark mode value

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CounterProvider>(context);
    return MaterialApp(
      title: 'Provider_Flutter',
      // theme: context.read<CounterProvider>().getDark
      //     ? ThemeData.dark(useMaterial3: true)
      //     : ThemeData.light(useMaterial3: true),
      theme: data.getDark
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      //home: const MyHomePage(title: 'Provider_Flutter'),
      //specify the provider type inside < >
      home: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Provider_Flutter"),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${data.getCounter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    data.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // setState(() {
                    //   isDark = !isDark;
                    // });
                    data.switchTheme();
                  },
                  tooltip: 'theme mode',
                  //tapping from consumer data
                  child: provider.getDark
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                ),
                FloatingActionButton(
                  onPressed: () {
                    data.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //

/// 3rd Usage using Provider.of to listen to changes from Counter Model ChangeNotifier class
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'counter_provider/counter_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //ChangeNotifierProvider helps to create instances of the ChangeNotifier class
//     return ChangeNotifierProvider(
//       create: ((context) => CounterProvider()),
//       child: MaterialApp(
//         title: 'Provider_Flutter',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Provider_Flutter'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     //Provider .of helps to listen to changes from the provider class and pass the data too
//     final data = Provider.of<CounterProvider>(context);

//     //Provider.of listen : false disable the provider form listening to the change notifier class - (CounterModel)
//     // final data = Provider.of<CounterModel>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '${data.getCounter}',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               data.incrementCounter();
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               data.decrementCounter();
//             },
//             tooltip: 'decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
