import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/auth/auth_provider.dart';
import 'package:flutter_bootstrap/auth/login_screen.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_provider.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProxyProvider<AuthProvider, TodoListProvider>(
        create: (context) => TodoListProvider(),
        update: (_, auth, __) => TodoListProvider(auth),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: Consumer<AuthProvider>(
            builder: (context, authModel, child) => authModel.authenticated
                ? const TodoListScreen()
                : const LoginScreen()));
  }
}
