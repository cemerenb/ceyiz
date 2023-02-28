import 'dart:math';

import 'package:ceyiz/categories.dart';
import 'package:flutter/material.dart';
import 'package:ceyiz/lists.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void incrementCounter(_counter) {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Categories()),
                  ),
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: Visibility(
              visible: isVisible,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 148, 146, 146))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.all(5.0)),
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  )),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: groceries.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 2, bottom: 2),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.check_box_outline_blank,
                      size: 35,
                    ),
                  ),
                  title: Text(groceries[index]),
                  subtitle: Text('${pieces[index]} adet'),
                  trailing: Text(
                    '${prices[index] * pieces[index]}₺',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ));
            }));
  }
}

class MyFilter extends TextInputFormatter {
  static final _reg = RegExp(r'^\d+$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _reg.hasMatch(newValue.text) ? newValue : oldValue;
  }
}
