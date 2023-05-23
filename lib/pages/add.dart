import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mitarbeiter_app/mitarbeiter.dart';

class Add extends StatefulWidget {
  final List<Mitarbeiter> mitarbeiter;
  final Function() notifyParent;
  const Add({super.key, required this.mitarbeiter, required this.notifyParent});

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mitarbeiter"),
        ),
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
                child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
            )),
            Expanded(
                child: TextFormField(
              controller: ageController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Alter',
              ),
            ))
          ]),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              widget.mitarbeiter.add(Mitarbeiter(
                                  name: nameController.value.text,
                                  alter:
                                      int.tryParse(ageController.value.text) ??
                                          0)),
                              widget.notifyParent(),
                              Navigator.of(context).pop()
                            }))
                      },
                  child: const Text("Add")),
              ElevatedButton(
                  onPressed: () =>
                      {setState(() => Navigator.of(context).pop())},
                  child: const Text("Cancel"))
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ]));
  }
}
