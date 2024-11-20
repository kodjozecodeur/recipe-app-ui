import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app_ui/model/recipe_model.dart';
import 'package:recipe_app_ui/utils/categorie_tiles.dart';
import 'package:recipe_app_ui/utils/menu_tiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: bottomNavbar(),
      backgroundColor: const Color(0xFFFCFFFF),
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            const SizedBox(height: 20),
            searchField(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular menus",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Color(0xFF58C585)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            popularMenus(),
            const SizedBox(height: 10),
            popularItemsTiles(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Color(0xFF58C585),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            categorieItems(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/person.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jane Doe",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Expert Chef",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavbar() {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Iconsax.chart), label: "Statistics"),
      BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: "Favorites"),
      BottomNavigationBarItem(icon: Icon(Iconsax.profile), label: "Profile"),
    ]);
  }

  SingleChildScrollView categorieItems() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategorieTiles(
            tilesColor: Color(0xFFD8D8D8),
            categorieTitle: 'Oats',
          ),
          CategorieTiles(
            tilesColor: Color(0xFFF3CFCC),
            categorieTitle: 'Cereals',
          ),
          CategorieTiles(
            tilesColor: Color(0xFFB8EECF),
            categorieTitle: 'Fruits',
          ),
          CategorieTiles(
            tilesColor: Color(0xFFFFE9B1),
            categorieTitle: 'Vegetables',
          ),
          CategorieTiles(
            tilesColor: Color(0xFFDDD0A4),
            categorieTitle: 'Breads',
          ),
        ],
      ),
    );
  }

  Padding popularItemsTiles() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MenuTiles(
              tilesText: "Salad Mix",
            ),
            MenuTiles(
              tilesText: "Shrimp Kale",
            ),
            MenuTiles(
              tilesText: "Chicken Salade",
            ),
            MenuTiles(
              tilesText: "Beef wellington",
            ),
          ],
        ),
      ),
    );
  }

  Padding popularMenus() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            menuItems.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? const Color(0xFF58C585)
                        : const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.white
                        : const Color(0xFF000000),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFF1F2F4)),
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //text goes here
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Hello Peter \n",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: "What do you want to eat today",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          //avatar goes here
          Stack(children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            Positioned(
              left: 50,
              bottom: 40,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
