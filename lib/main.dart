import 'package:flutter/material.dart';
import 'package:shared_pref_play/user/user_widget.dart';
import 'package:shared_pref_play/util/prefs.dart';
import 'package:shared_pref_play/user/user_model.dart';

Future<void> main() async {
  // Ensure Widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Shared preferences
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _userName = '';
  String _userEmail = '';

  void _saveInfo() {
    setState(() {
      User newUser = User(name: _userName, email: _userEmail);
      Prefs.user = newUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UserWidget(), // The User information widget is added here
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  decoration: const InputDecoration(hintText: 'User name'),
                  onChanged: (value) async {
                    _userName = value;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  decoration: const InputDecoration(hintText: 'User email'),
                  onChanged: (value) async {
                    _userEmail = value;
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveInfo,
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
