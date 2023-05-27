import 'package:flutter/material.dart';

class Statics extends StatefulWidget {
  const Statics({super.key});

  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harcalamalar'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: LayoutBuilder(
                  builder: (context, constraint) => Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 183, 184, 185),
                          boxShadow: [
                        BoxShadow(
                            blurRadius: 17,
                            spreadRadius: -10,
                            color: Colors.white,
                            offset: Offset(4, 4)),
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: -2,
                            color: Color.fromARGB(255, 119, 118, 118),
                            offset: Offset(4, 4)),
                      ])),
                ),
              ),
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height / 2,
              child: Row(children: [
                const Spacer(),
                staticsCategories(Colors.red, Colors.blue, Colors.green,
                    'Mutfak', 'Beyaz Eşya', 'Yatak Odası'),
                Container(width: MediaQuery.of(context).size.width / 20),
                staticsCategories(Colors.purple, Colors.yellow, Colors.black,
                    'Oturma Odası', 'Banyo', 'Tekstil'),
                Container(width: MediaQuery.of(context).size.width / 20),
                staticsCategories(Colors.orange, Colors.teal, Colors.brown,
                    'Küçük Ev Aleti', 'Alet & Edevat', 'Diğer'),
                const Spacer(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget staticsCategories(staticsColor1, staticsColor2, staticsColor3,
      String name1, String name2, String name3) {
    return Expanded(
      flex: 3,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: staticsColor1,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      name1,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: staticsColor2,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      name2,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: staticsColor3,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      name3,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
