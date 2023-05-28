import 'package:ceyiz/home_page.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 0, 253),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: const Color.fromARGB(255, 115, 0, 253),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(fontSize: 40),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 224, 248, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  childAspectRatio: (MediaQuery.of(context).size.height *
                      0.5 /
                      MediaQuery.of(context).size.height /
                      0.60),
                  crossAxisCount: 3,
                  children: [
                    categoriesBlocks(context, 10, 'All',
                        'https://images.homify.com/c_fill,f_auto,q_0,w_740/v1548448428/p/photo/image/2888218/ENNA_HOUSE_25.jpg'),
                    categoriesBlocks(context, 0, 'Kitchen',
                        'https://jumanji.livspace-cdn.com/magazine/wp-content/uploads/sites/4/2022/02/10094359/Cover-02-1.png'),
                    categoriesBlocks(context, 1, 'Appliances',
                        'https://media.cnn.com/api/v1/images/stellar/prod/220831103435-labor-lead-best-buy.jpg?c=16x9&q=h_720,w_1280,c_fill'),
                    categoriesBlocks(context, 2, 'Bedroom',
                        'https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/featured-image-bedroom-decor.jpeg.jpg'),
                    categoriesBlocks(context, 3, 'Living Room',
                        'https://images.unsplash.com/photo-1615529182904-14819c35db37?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGl2aW5nJTIwcm9vbSUyMGludGVyaW9yJTIwZGVzaWdufGVufDB8fDB8fHww&w=1000&q=80'),
                    categoriesBlocks(context, 4, 'Bathroom',
                        'https://imageio.forbes.com/specials-images/imageserve/5ffdfc89a676bc1fa37f33cb/Black-and-white-bathroom-with-deep-tub-and-large-shower-/960x0.png?height=471&width=711&fit=bounds'),
                    categoriesBlocks(context, 5, 'Home Textile',
                        'https://www.arlontextile.com/wp-content/uploads/2020/07/ev-tekstili.jpg'),
                    categoriesBlocks(context, 6, 'Small Appliances',
                        'https://www.harveynorman.com.au/blog/assets/Colour-Appliances-1920x768.jpg'),
                    categoriesBlocks(context, 7, 'Tools',
                        'https://st1.myideasoft.com/idea/iq/65/myassets/products/279/imgl7422-1000x1250w.jpg?revision=1640265802'),
                    categoriesBlocks(context, 8, 'Ligthing',
                        'https://www.avantajport.com/ProductImages/110576/big/gold-camli-pera-3lu-sarkit-avize.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector categoriesBlocks(
    BuildContext context, int destination, String name, String link) {
  return GestureDetector(
    //Tümü
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  category: destination,
                )),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 202, 202, 202),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6.5,
              width: MediaQuery.of(context).size.width / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Colors.transparent
                          ],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.network(
                        link,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name,
                    style: const TextStyle(fontSize: 18, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
