import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Mitarbeiter App",
        home: const HomePage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          cardColor: const Color.fromARGB(255, 96, 116, 185),
          listTileTheme: const ListTileThemeData(
            tileColor: Color.fromARGB(255, 96, 116, 185),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
          ),
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color.fromRGBO(71, 86, 138, 1),
              selectionColor: Color.fromARGB(255, 96, 116, 185),
              selectionHandleColor: Color.fromARGB(255, 96, 116, 185)),
          inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 96, 116, 185))),
              labelStyle: TextStyle(color: Color.fromARGB(255, 96, 116, 185))),
          highlightColor: const Color.fromARGB(255, 96, 116, 185),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 114, 137, 218)),
                  foregroundColor: MaterialStatePropertyAll(Colors.white))),
          useMaterial3: true,
        ));
  }
}
