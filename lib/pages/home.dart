import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mitarbeiter_app/mitarbeiter.dart';
import 'package:mitarbeiter_app/pages/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Mitarbeiter> mitarbeiter = [];
  int selected = -1;

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mitarbeiter"),
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: mitarbeiter.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                title: Text(mitarbeiter[index].toString()),
                onTap: () => {
                  setState(
                    () => selected = index,
                  )
                },
              ));
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Add(
                                        mitarbeiter: mitarbeiter,
                                        notifyParent: refresh,
                                      )))
                            }))
                      },
                  child: const Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              if (selected != -1)
                                {mitarbeiter.removeAt(selected), selected = -1}
                            }))
                      },
                  child: const Icon(Icons.remove))
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ]));
  }
}
