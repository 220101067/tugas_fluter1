import 'package:flutter/material.dart';
import 'package:latian_1/Nafbar/launcher.dart'; // Impor file launcher.dart

class LitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Jumlah tab: All, Adventure, Superheroes, New Releases
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          elevation: 2,
          toolbarHeight: 70,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // Fungsi pencarian
                  showSearch(
                    context: context,
                    delegate: ComicSearchDelegate(comics: [
                      ComicData('Boruto', '\$12.00', 'assets/boruto.jpg'),
                      ComicData('One Piece', '\$10.00', 'assets/wanpic.jpg'),
                      ComicData('Attack on Titan', '\$15.00', 'assets/attack_on_titan.webp'),
                      ComicData('Dragon Ball', '\$18.00', 'assets/dragonball.jpg'),
                      ComicData('Demon Slayer', '\$16.00', 'assets/demonslayer.jpg'),
                      ComicData('Chainsaw Man', '\$14.00', 'assets/chainsawman.jpg'),
                      ComicData('My Hero Academia', '\$13.00', 'assets/myhero.jpg'),
                      ComicData('Fairy Tail', '\$12.00', 'assets/fairytail.jpg'),
                      ComicData('Hunter x Hunter', '\$14.00', 'assets/hxh.webp'),
                      ComicData('Bleach', '\$15.00', 'assets/bleach.jpeg'),
                    ]),
                  );
                },
              );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Comic Books',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ],
        ),
        endDrawer: CustomDrawer(),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover Your Favorite",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Comic Books & Characters",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  TabBar(
                    isScrollable: true,
                    labelColor: Colors.redAccent,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.redAccent,
                    tabs: [
                      Tab(text: "All"),
                      Tab(text: "Adventure"),
                      Tab(text: "Superheroes"),
                      Tab(text: "New Releases"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ComicGrid(comics: [
                    ComicData('Boruto', '\$12.00', 'assets/boruto.jpg'),
                    ComicData('One Piece', '\$10.00', 'assets/wanpic.jpg'),
                    ComicData('Attack on Titan', '\$15.00', 'assets/attack_on_titan.webp'),
                    ComicData('Dragon Ball', '\$18.00', 'assets/dragonball.jpg'),
                    ComicData('Demon Slayer', '\$16.00', 'assets/demonslayer.jpg'),
                    ComicData('Chainsaw Man', '\$14.00', 'assets/chainsawman.jpg'),
                    ComicData('My Hero Academia', '\$13.00', 'assets/myhero.jpg'),
                    ComicData('Fairy Tail', '\$12.00', 'assets/fairytail.jpg'),
                    ComicData('Hunter x Hunter', '\$14.00', 'assets/hxh.webp'),
                    ComicData('Bleach', '\$15.00', 'assets/bleach.jpeg'),
                  ]),
                  ComicGrid(comics: [
                    ComicData('One Piece', '\$10.00', 'assets/wanpic.jpg'),
                    ComicData('Dragon Ball', '\$18.00', 'assets/dragonball.jpg'),
                    ComicData('Hunter x Hunter', '\$14.00', 'assets/hxh.webp'),
                    ComicData('Fairy Tail', '\$12.00', 'assets/fairytail.jpg'),
                    ComicData('Fullmetal Alchemist', '\$15.00', 'assets/fullmetal.jpg'),
                    ComicData('Made in Abyss', '\$13.00', 'assets/made_in_abyss.jpg'),
                    ComicData('Magi: The Labyrinth of Magic', '\$14.00', 'assets/magi.jpg'),
                    ComicData('Attack on Titan', '\$15.00', 'assets/attack_on_titan.webp'),
                    ComicData('Sword Art Online', '\$12.00', 'assets/swordart.jpg'),
                    ComicData('Akame ga Kill!', '\$16.00', 'assets/akame.jpeg'),
                  ]),
                  ComicGrid(comics: [
                    ComicData('One-Punchman', '\$20.00', 'assets/saitama.jpg'),
                    ComicData('Jujutsu kaisen', '\$22.00', 'assets/jujutsu_kaisen.jpg'),
                  ]),
                  ComicGrid(comics: [
                    ComicData('Demon Slayer', '\$16.00', 'assets/demonslayer.jpg'),
                    ComicData('Chainsaw Man', '\$14.00', 'assets/chainsawman.jpg'),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComicSearchDelegate extends SearchDelegate {
  final List<ComicData> comics;

  ComicSearchDelegate({required this.comics});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = comics
        .where((comic) => comic.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ComicGrid(comics: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = comics
        .where((comic) => comic.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ComicGrid(comics: suggestions);
  }
}

class ComicGrid extends StatelessWidget {
  final List<ComicData> comics;

  ComicGrid({required this.comics});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

        return Padding(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: comics.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final comic = comics[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                        child: Image.asset(
                          comic.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        comic.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        comic.price,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ComicData {
  final String title;
  final String price;
  final String imagePath;

  ComicData(this.title, this.price, this.imagePath);
}
