import 'package:ceyiz/categories.dart';
import 'package:ceyiz/statics.dart';
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
  var sum = 0;
  final pricecontroller = TextEditingController();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
              decoration: formFieldDecoration(),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
      body: homePageListView(),
      floatingActionButton: FittedBox(
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Statics()),
          ),
          label: Text(
            ("${findTotal()} ₺"),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }

  ListView homePageListView() {
    return ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 2, bottom: 2),
            child: ListTile(
              leading: (isChecked[index] == 1)
                  ? GestureDetector(
                      onTap: () => setState(() {
                        isChecked[index] = 0;
                      }),
                      child: const Icon(
                        Icons.check_box,
                        size: 35,
                        color: Color.fromARGB(255, 14, 134, 18),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => setState(() {
                        isChecked[index] = 1;
                      }),
                      child: const Icon(
                        Icons.check_box_outline_blank,
                        size: 35,
                      ),
                    ),
              title: GestureDetector(
                  onTap: () => bottomSheet(context, index),
                  child: SizedBox(
                      height: 20, width: 200, child: Text(groceries[index]))),
              subtitle: GestureDetector(
                  onTap: () => bottomSheet(context, index),
                  child: SizedBox(
                      height: 20,
                      width: 200,
                      child: Text('${pieces[index].toInt()} adet'))),
              trailing: GestureDetector(
                onTap: () => bottomSheet(context, index),
                child: Text(
                  '${prices[index] * pieces[index]}₺',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ));
        });
  }

  Future<dynamic> bottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 211, 211),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          groceries[index],
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        maxLength: 10,
                        controller: pricecontroller,
                        onEditingComplete: () => setState(() {
                          set();
                          FocusManager.instance.primaryFocus?.unfocus();

                          try {
                            prices[index] = double.parse(pricecontroller.text);
                          } on Exception {
                            prices[index] = 0;
                          }
                        }),
                        keyboardType: TextInputType.number,
                        decoration: formFieldDecoration().copyWith(
                          hintText: prices[index].toString(),
                          suffixText: '₺',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => setState(() {
                                  if (pieces[index] > 0) {
                                    pieces[index]--;
                                  }
                                  set();
                                }),
                            child: const Icon(Icons.remove)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            pieces[index].toInt().toString(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => setState(() {
                                  pieces[index]++;
                                  set();
                                }),
                            child: const Icon(Icons.add)),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  InputDecoration formFieldDecoration() {
    return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 148, 146, 146))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(0, 129, 129, 129),
            )),
        hintText: 'Search',
        contentPadding: const EdgeInsets.all(5.0));
  }

  set() {
    setState(() {});
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

findTotal() {
  double sum = 0;
  for (var i = 0; i < 220; i++) {
    sum += prices[i] * pieces[i] * isChecked[i];
  }
  return sum;
}
