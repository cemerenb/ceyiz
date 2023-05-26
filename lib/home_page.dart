import 'dart:developer';

import 'package:ceyiz/categories.dart';
import 'package:ceyiz/statics.dart';
import 'package:flutter/material.dart';
import 'package:ceyiz/lists.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  final int i;
  const HomePage({super.key, required this.i});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  bool isCategorised = false;
  var sum = 0;

  final pricecontroller = TextEditingController();
  final myController = TextEditingController();

  final _itemsBox = Hive.box('itemsBox');

  @override
  void initState() {
    readItems();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  // void getData() {
  //   log('get dataya girdi');
  //   try {
  //     for (var i = 0; i < 220; i++) {
  //       prices[i] = _pricesBox.get(i) ?? 0.0;
  //     }
  //     for (var i = 0; i < 220; i++) {
  //       pieces[i] = _piecesBox.get(i) ?? 0.0;
  //     }
  //     for (var i = 0; i < 220; i++) {
  //       isChecked[i] = _isCheckedBox.get(i) ?? 0.0;
  //     }
  //     // ignore: empty_catches
  //   } on Exception {}
  // }

  // void writeData(index) async {
  //   log('write dataya girdi');
  //   await _pricesBox.put(index, prices[index]);
  //   await _piecesBox.put(index, pieces[index]);
  //   await _isCheckedBox.put(index, isChecked[index]);
  //   log('data yazıldı');
  //   return;
  // }

  Future<void> writeItem(int index, Item item) async {
    await _itemsBox.put(index, item.toJson());
  }

  void readItems() async {
    int itemCount = _itemsBox.length;
    if (itemCount > 0) {
      Iterable<String> itemsString = _itemsBox
          .valuesBetween(
            startKey: 0,
            endKey: itemCount - 1,
          )
          .cast();
      List<Item> _items = itemsString
          .map(
            (String json) => Item.fromJson(json),
          )
          .toList();
      items = _items;
    } else {
      for (int index = 0; index < items.length; index++) {
        await _itemsBox.put(index, items[index].toJson());
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    log("new frame");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (true) {
            Item item = items[index];
            return Card(
                child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 2, bottom: 2),
              child: ListTile(
                leading: (item.isChecked)
                    ? GestureDetector(
                        onTap: () => setState(() {
                          item.isChecked = false;
                          writeItem(index, item);
                        }),
                        child: const Icon(
                          Icons.check_box,
                          size: 35,
                          color: Color.fromARGB(255, 14, 134, 18),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => setState(() {
                          item.isChecked = true;
                          writeItem(index, item);
                        }),
                        child: const Icon(
                          Icons.check_box_outline_blank,
                          size: 35,
                        ),
                      ),
                title: GestureDetector(
                    onTap: () => bottomSheet(context, index),
                    child: SizedBox(
                        height: 20, width: 200, child: Text(item.name))),
                subtitle: GestureDetector(
                    onTap: () => bottomSheet(context, index),
                    child: SizedBox(
                        height: 20,
                        width: 200,
                        child: Text('${item.piece} adet'))),
                trailing: GestureDetector(
                  onTap: () => bottomSheet(context, index),
                  child: Text(
                    '${item.price * item.piece}₺',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ));
          }
          return const SizedBox();
        });
  }

  Future<dynamic> bottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          Item item = items[index];

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
                          item.name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        maxLength: 10,
                        controller: pricecontroller,
                        onChanged: (value) => setState(() {
                          // FocusManager.instance.primaryFocus?.unfocus();
                          try {
                            item.price = double.parse(value);
                            items[index] = item;
                            writeItem(index, item);
                            set();
                          } on Exception catch (e) {
                            print(e);
                          }
                        }),
                        keyboardType: TextInputType.number,
                        decoration: formFieldDecoration().copyWith(
                          hintText: item.price.toString(),
                          suffixText: '₺',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => setState(() {
                                  if (item.piece > 0) {
                                    item.piece--;
                                  }
                                  items[index] = item;
                                  writeItem(index, item);
                                }),
                            child: const Icon(Icons.remove)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            item.piece.toString(),
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => setState(() {
                                  item.piece++;
                                  items[index] = item;
                                  writeItem(index, item);
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
  for (var i = 0; i < items.length; i++) {
    if (items[i].isChecked) {
      sum += items[i].piece * items[i].price;
    }
  }
  return sum;
}
