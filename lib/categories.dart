import 'package:ceyiz/home_page.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 114, 114, 114),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tümü',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 114, 114, 114),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mutfak',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Icon(
                  Icons.soup_kitchen,
                  size: 70,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 114, 114, 114),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Beyaz Eşya',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Icon(
                  Icons.kitchen,
                  size: 70,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: const Color.fromARGB(255, 114, 114, 114),
            child: Column(
              children: const [Text('Mutfak'), Icon(Icons.kitchen)],
            ),
          ),
        ),
      ],
    ));
  }
}
