import 'package:ceyiz/lists.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statics extends StatefulWidget {
  final double total;
  const Statics({super.key, required this.total});

  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  final dataMap = <String, double>{
    "Mutfak": categoriesTotalSpent(0),
    "Beyaz Eşya": categoriesTotalSpent(1),
    "Yatak Odası": categoriesTotalSpent(2),
    "Oturma Odası": categoriesTotalSpent(3),
    "Banyo": categoriesTotalSpent(4),
    "Tekstil": categoriesTotalSpent(5),
    "Küçük Ev Aletleri": categoriesTotalSpent(6),
    "Alet Edevat": categoriesTotalSpent(7),
    "Diğer": categoriesTotalSpent(8),
  };
  final colorList = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    const Color.fromARGB(255, 238, 27, 143),
    Colors.orange,
    Colors.teal,
    Colors.brown,
  ];
  @override
  void initState() {
    countCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 183, 184, 185),
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
                              blurRadius: 10,
                              spreadRadius: -5,
                              color: Color.fromARGB(148, 255, 255, 255),
                              offset: Offset(-5, -5)),
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: -2,
                              color: Color.fromARGB(255, 119, 118, 118),
                              offset: Offset(4, 4)),
                        ]),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: PieChart(
                          colorList: colorList,
                          centerText: '${widget.total} ₺',
                          centerTextStyle: const TextStyle(
                              backgroundColor: Colors.transparent,
                              color: Colors.black,
                              fontSize: 25),
                          dataMap: dataMap,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 50,
                          legendOptions: const LegendOptions(
                            showLegends: false,
                            legendPosition: LegendPosition.bottom,
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            chartValueStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 65, 65, 65)),
                            showChartValuesInPercentage: true,
                            showChartValueBackground: false,
                            showChartValuesOutside: true,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                staticsCategories(
                    Colors.purple,
                    Colors.yellow,
                    const Color.fromARGB(255, 238, 27, 143),
                    'Oturma Odası',
                    'Banyo',
                    'Tekstil'),
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
                    style: const TextStyle(fontSize: 12),
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
                    style: const TextStyle(fontSize: 12),
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
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
