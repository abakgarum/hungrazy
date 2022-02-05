import 'package:flutter/material.dart';
import 'package:hungrazy/custom_widget/menu.dart';
import 'package:hungrazy/custom_widget/product_card.dart';
import 'package:hungrazy/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Product> productList;
  @override
  void initState() {
    super.initState();
    getProductListModel();
  }

  int _selectedTab = 0;

  int _selectedIndex = 0;

getNavBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTab = 0;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.category_outlined,
                  color: _selectedTab == 0 ? Colors.amber[800] : Colors.grey,
                ),
                SizedBox(width: 20),
                Text(
                  'All Categories',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _selectedTab == 0 ? Colors.amber[800] : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTab = 1;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant_menu,
                  color: _selectedTab == 1 ? Colors.amber[800] : Colors.grey,
                ),
                SizedBox(width: 20),
                Text(
                  'All Resturant',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _selectedTab == 1 ? Colors.amber[800] : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getProductListModel() {
    List _imageList = [
      'assets/images/Momos2.png',
      "assets/images/Momos.webp",
      'assets/images/Momos2.png',
      "assets/images/Momos.webp",
      'assets/images/Momos2.png',
      "assets/images/Momos.webp",
    ];

    List _nameList = [
      'Momos 1',
      'Momos 2',
      'Momos 3',
      'Momos 4',
      'Momos 5',
      'Momos 6',
    ];
    productList = [];
    for (int i = 0; i < _imageList.length; i++) {
      Product product = Product(
        name: _nameList[i],
        imagePath: _imageList[i],
      );
      productList.add(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Color(0xFF1B1B1B),
        automaticallyImplyLeading: true,
        title: Text(
          'Hungrazy',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/order');
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            getNavBar(),
            SizedBox(height: 20),
            Divider(thickness: 1.5),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    productList.length,
                    (index) => ProductCard(
                      product: productList[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
