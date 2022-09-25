import 'package:flutter/material.dart';
import 'package:provider_flutter/state_management/counter_model.dart';
import 'package:provider/provider.dart';

//First Provider Usage -- ChangeNotifierProvider
////ChangeNotifierProvider helps to create instances of the ChangeNotifier class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        title: 'Provider_Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Provider_Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    ////Consumer helps to pass data from the change notifier class in order to trigger an update
    return Consumer<CounterModel>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                style: Theme.of(context).textTheme.headline4,
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
                data.decrementCounter();
              },
              tooltip: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
    });
  }
}

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
//2nd Usage using MultiProvider and Consumer
// import 'package:flutter/material.dart';
// import 'package:provider_flutter/state_management/counter_model.dart';
// import 'package:provider/provider.dart';

// //First Provider Usage -- ChangeNotifierProvider
// //ChangeNotifierProvider helps to create instances of ChangeNotifier
// ///
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         //ChangeNotifierProvider helps to create instances of the ChangeNotifier class
//         ChangeNotifierProvider(
//           create: (context) => CounterModel(),
//         ),
//       ],
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
//     ////Consumer helps to pass data from the change notifier class in order to trigger an update
//     return Consumer<CounterModel>(builder: (context, data, _) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 '${data.getCounter}',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
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
//               tooltip: 'Decrement',
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
//
//
//
//
//
//
//
//
// ////3rd Usage using Provider.of to listen to changes from ChangeNotifier class
// import 'package:flutter/material.dart';
// import 'package:provider_flutter/state_management/counter_model.dart';
// import 'package:provider/provider.dart';

// //First Provider Usage -- ChangeNotifierProvider
// //ChangeNotifierProvider helps to create instances of ChangeNotifier
// ///
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //ChangeNotifierProvider helps to create instances of the ChangeNotifier class
//     return ChangeNotifierProvider(
//       create: ((context) => CounterModel()),
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
//     final data = Provider.of<CounterModel>(context);
//     //Provider.of listen : false disable the provider form listening to the change notifier class
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
//               style: Theme.of(context).textTheme.headline4,
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
