import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitten adoption center',
      theme: ThemeData(
        textTheme: GoogleFonts.syneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(title: 'Kitten adoption center'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final kittens = [
  Image.asset('assets/images/kitten1.jpg'),
  Image.asset('assets/images/kitten2.png'),
  Image.asset('assets/images/kitten3.jpg'),
  Image.asset('assets/images/kitten5.jpg'),
  Image.asset('assets/images/kitten6.jpg'),
];

const cardHeight = 200.0;
const cardPadding = cardHeight / 10;
const textString =
    'Meet Whiskers, a fluffy and playful kitten with bright green eyes that will melt your heart. This little feline is full of energy and loves to chase after toys, but also enjoys cuddling up in your lap for a cozy nap.';

Widget myNewButton = Center(
  child: Container(
    color: const Color.fromARGB(255, 255, 254, 242),
    constraints: const BoxConstraints(maxHeight: 200, maxWidth: 600),
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            //upper line
            height: cardPadding,
          ),
        ),
        Expanded(
          flex: 10,
          child: Row(
            children: [
              Container(
                width: cardPadding,
              ), // left edge
              Flexible(flex: 8, child: kittens[2]), // image
              Container(
                width: cardPadding,
              ), //padding before text
              Expanded(
                flex: 8,
                child: Column(
                  //text section
                  children: [
                    const Text(
                      'WHISKERS',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: cardPadding / 2,
                    ),
                    const Flexible(
                      child: AutoSizeText(
                        textString,
                        minFontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: cardPadding,
                ),
              ),
              Expanded(
                //button section
                flex: 4,
                child: Container(
                  color: const Color.fromARGB(255, 255, 128, 0),
                  child: const Expanded(
                    child: Text(
                      'TAKE ME HOME',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 254, 242),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: cardPadding,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            //lower line
            height: cardPadding,
          ),
        ),
      ],
    ),
  ),
);

final startButton = Center(
  child: AspectRatio(
    aspectRatio: 16 / 6,
    child: Column(
      children: [
        Expanded(
          child: Container(),
        ),
        const AutoSizeText(
          'CUTE KITTENS NEED HOME',
          minFontSize: 30,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 254, 242),
          ),
        ),
      ],
    ),
  ),
);

final buttons = [
  startButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
];

const largeHeader = Center(
  child: AutoSizeText(
    'CUTE KITTENS NEED HOME',
    minFontSize: 55,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 254, 242),
    ),
  ),
);

final largeButtons = [
  largeHeader,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
  myNewButton,
];

Widget backgroudImage = ShaderMask(
  shaderCallback: (bounds) => const LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 152, 49),
      Color.fromARGB(0, 255, 152, 49),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).createShader(bounds),
  child: Image.asset(
    'images/garfield2.webp',
    fit: BoxFit.fill,
  ),
);

Widget smallBuild(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 128, 0),
    body: Stack(
      children: [
        Container(
          /*height: double.infinity, width: double.infinity, */ child:
              backgroudImage,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => buttons[index],
            itemCount: buttons.length,
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          ),
        )
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'Call us',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Check our kittens',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Message us',
        ),
      ],
    ),
  );
}

Widget largeBuild(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 128, 0),
    body: Row(
      children: [
        NavigationRail(destinations: const <NavigationRailDestination>[
          // navigation destinations
          NavigationRailDestination(
            icon: Icon(Icons.call),
            label: Text('Call us'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.camera),
            label: Text('Check our kittens'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.chat),
            label: Text('Message us'),
          ),
        ], selectedIndex: 0),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: backgroudImage,
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 40.0,
                crossAxisSpacing: 40.0,
                padding: const EdgeInsets.only(
                    top: 400.0, left: 20.0, right: 20.0, bottom: 20.0),
                childAspectRatio: 3 / 1,
                children: largeButtons,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width > 1000 ? largeBuild(context) : smallBuild(context);
    // return backgroudImage();
  }
}
