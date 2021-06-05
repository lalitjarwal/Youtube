import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

const _images = {
  'interstellar':
      'https://images-na.ssl-images-amazon.com/images/I/A1JVqNMI7UL._SL1500_.jpg',
  'dragon3':
      'https://upload.wikimedia.org/wikipedia/en/f/fd/How_to_Train_Your_Dragon_3_poster.png',
  'arrival':
      'https://images-na.ssl-images-amazon.com/images/I/81fvNfPZBsL._RI_.jpg',
  'starwars': 'https://pbs.twimg.com/media/EMJ8wCfW4AU5l2C.jpg:large',
  'joker':
      'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
  'endgame':
      'https://static.wikia.nocookie.net/disney_m23wik/images/8/8c/Avengers-_Endgame.jpeg/revision/latest/scale-to-width-down/310?cb=20200322155935',
  'transformers':
      'https://m.media-amazon.com/images/M/MV5BN2YwOWM4ODgtZTMzMi00ZmFmLTk5NTEtNmY4ZDcwNzQxNDhjXkEyXkFqcGdeQXVyNTI0NzAyNjY@._V1_.jpg',
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scrollController = PageController();
  var pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
              controller: scrollController,
              reverse: true,
              children: _images.values
                  .map((url) => Image.network(
                        url,
                        fit: BoxFit.fill,
                      ))
                  .toList()),
          Container(color: Colors.black54),
          NotificationListener(
            onNotification: (_) {
              scrollController.animateTo(pageController.offset,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
              return true;
            },
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                _Page(
                  image: 'interstellar',
                  name: 'Interstellar',
                  scale: currentIndex == 0 ? 1 : 0.8,
                  rec: 'Star Network',
                  stars: 5,
                ),
                _Page(
                  image: 'dragon3',
                  name: 'Dragon 3',
                  stars: 4,
                  rec: 'IMDB',
                  scale: currentIndex == 1 ? 1 : 0.8,
                ),
                _Page(
                  image: 'arrival',
                  name: 'Arrival',
                  stars: 4,
                  rec: 'IMDB',
                  scale: currentIndex == 2 ? 1 : 0.8,
                ),
                _Page(
                  image: 'starwars',
                  name: 'Star Wars',
                  stars: 5,
                  rec: 'Max',
                  scale: currentIndex == 3 ? 1 : 0.8,
                ),
                _Page(
                  image: 'joker',
                  name: 'Joker',
                  stars: 5,
                  rec: 'HBO',
                  scale: currentIndex == 4 ? 1 : 0.8,
                ),
                _Page(
                  image: 'endgame',
                  name: 'Avengers Endgame',
                  stars: 5,
                  rec: 'Disney',
                  scale: currentIndex == 5 ? 1 : 0.8,
                ),
                _Page(
                  image: 'transformers',
                  name: 'Transformers',
                  stars: 3,
                  rec: 'World Cinema',
                  scale: currentIndex == 6 ? 1 : 0.8,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class _Page extends StatelessWidget {
  const _Page(
      {Key? key,
      required this.image,
      this.name,
      this.rec,
      this.scale = 1,
      this.stars = 4})
      : super(key: key);
  final String image;
  final String? name;
  final int stars;
  final String? rec;
  final double scale;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(12.0),
      transform: Matrix4.identity()..scale(scale),
      curve: Curves.bounceInOut,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                _images[image]!,
                height: 500,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$name',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < stars; i++)
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Recommended by: $rec',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0)),
            )
          ],
        ),
      ),
    );
  }
}
