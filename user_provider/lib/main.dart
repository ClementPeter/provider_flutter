import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/user_provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Tap into our create provider using ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: ((context) => UserProvider()),
      child: MaterialApp(
        title: 'User Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'User Provider'),
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
  //Form Key helps us in Form validation
  final GlobalKey<FormState> _formKey = GlobalKey();
  //Calling this method is equivalent to calling:
  // context.
  //Provider.of<T>(context)
  //
  @override
  Widget build(BuildContext context) {
    //listen is true by default
    final data = Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Enter Username and Password',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    //accessing provider value with context
                    // controller: context.watch<UserProvider>().nameController,
                    controller: data.nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                    //onchanged helps to reflect input on the fly
                    onChanged: (value) {
                      print(value);
                      //read - listen for changes from our provider and causes update in UI
                      //context.read<UserProvider>().updateName(value);
                      data.updateName(value);
                      //...
                      //watch - Does not listen for changes and does not cause update to the UI
                      //context.watch<UserProvider>().updateName(value);
                    },
                    // onFieldSubmitted: (value) {
                    //   print('submitted');
                    // },
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: data.ageController,
                    autovalidateMode: AutovalidateMode.always,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Value must contain only numbers';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    //onchanged helps to reflect input on the fly
                    onChanged: (value) {
                      // context.read<UserProvider>().updatePassword(
                      //       int.parse(value),
                      //     );
                      data.updatePassword(int.parse(value));
                    },
                    // onFieldSubmitted: (value) {},
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Save Details',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added Successfully'),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  ////
                  //Wrapping consumer around the widget we want to update state
                  Consumer<UserProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          Text(
                            'Hii ${provider.userName}',
                            style: const TextStyle(
                              fontSize: 20,
                              //color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'You password is ${provider.userPassword}',
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
//
//
//
//
//
//
//
///





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:user_provider/provider/user_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //Tap into our create provider using ChangeNotifierProvider
//     return ChangeNotifierProvider(
//       create: ((context) => UserProvider()),
//       child: MaterialApp(
//         title: 'User Provider',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(title: 'User Provider'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   //Calling this method is equivalent to calling:
//   // context.
//   //Provider.of<T>(context)
//   //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             'Enter Username and Password',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     //accessing provider value with context
//                     controller: context.watch<UserProvider>().nameController,
//                     keyboardType: TextInputType.name,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Field is required';
//                       }
//                       return null;
//                     },
//                     //onchanged helps to reflect input on the fly
//                     onChanged: (value) {
//                       print(value);
//                       //read - listen for changes from our provider and causes update in UI
//                       context.read<UserProvider>().updateName(value);
//                       //...
//                       //watch - Does not listen for changes and does not cause update to the UI
//                       //context.watch<UserProvider>().updateName(value);
//                     },
//                     // onFieldSubmitted: (value) {
//                     //   print('submitted');
//                     // },
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your name',
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.always,
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Field is required';
//                       } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                         return 'Value must contain only numbers';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your password',
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                     ),
//                     //onchanged helps to reflect input on the fly
//                     onChanged: (value) {
//                       context.read<UserProvider>().updatePassword(
//                             int.parse(value),
//                           );
//                     },
//                     // onFieldSubmitted: (value) {},
//                   ),
//                   const SizedBox(height: 15),
//                   ElevatedButton(
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30),
//                       child: Text(
//                         'Save Details',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Added Successfully'),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 25),
//                   ////
//                   //Wrapping consumer around the widget we want to update state
//                   Consumer<UserProvider>(
//                     builder: (context, provider, child) {
//                       return Column(
//                         children: [
//                           Text(
//                             'Hii ${provider.userName}',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               //color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             'You password is ${provider.userPassword}',
//                           ),
//                         ],
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
