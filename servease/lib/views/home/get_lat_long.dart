import 'package:flutter/material.dart';
import 'package:servease/widgets_common/cat_mod.dart';
import 'package:servease/widgets_common/profile.dart';
import 'package:servease/widgets_common/location.dart';
import 'package:servease/category/elec.dart';

class GetLatLongScreen extends StatefulWidget {
  const GetLatLongScreen({Key? key}) : super(key: key);

  @override
  State<GetLatLongScreen> createState() => _GetLatLongScreenState();
}

class _GetLatLongScreenState extends State<GetLatLongScreen> {
  String address = "Fetching location...";
  String error = "";
  int _selectedIndex = 1; // Default to home screen
  TextEditingController nameController = TextEditingController();

  final LocationService locationService = LocationService();

  @override
  void initState() {
    super.initState();
    getLatLong();
  }

  void getLatLong() {
    locationService.determinePosition().then((position) {
      locationService
          .getLocality(position.latitude, position.longitude)
          .then((addr) {
        setState(() {
          address = addr;
        });
      });
    }).catchError((error) {
      setState(() {
        this.error = error.toString();
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryTapped(String categoryName) {
    // Handle category tap
    print('Category tapped: $categoryName');
    if (categoryName == 'Electrician') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Elec()),
      );
    } else {
      // Handle other categories if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
              leading: IconButton(
                icon: Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  // Handle menu button press
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,
                      color: const Color.fromARGB(255, 255, 0, 0)),
                  SizedBox(width: 8),
                  Text(
                    error.isEmpty ? address : "Error",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, color: Colors.black, fontFamily: 'uber'),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    // Handle notification bell press
                  },
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight + 2),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 238, 238, 238),
                              borderRadius: BorderRadius.circular(19.94),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(fontSize: 16),
                                contentPadding: EdgeInsets.all(6),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Color(0xFFEEEEEE),
                              ),
                              onChanged: (value) {
                                // Handle search functionality here
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.filter_list, color: Colors.black),
                          onPressed: () {
                            // Handle filter button press
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  IndexedStack(
                    index: _selectedIndex,
                    children: [
                      buildCategoriesScreen(),
                      buildHomeScreen(),
                      ProfileScreen(nameController: nameController),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 2),
              child: Image.asset('assets/images/Scroll.png', height: 35),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 2),
              child: Image.asset('assets/images/Home.png', height: 35),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 2),
              child: Image.asset('assets/images/User.png', height: 35),
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget buildHomeScreen() {
    final List<Map<String, String>> deals = [
      {
        'image': 'assets/images/deal_0.png',
        'text': '12 hours Cooking service',
        'description': 'Meal packages',
      },
      {
        'image': 'assets/images/deal_1.png',
        'text': '1+1 services for 1st time u..',
        'description': 'One time offer',
      },
      {
        'image': 'assets/images/deal_2.png',
        'text': 'Car services',
        'description': 'Low prices, Premium',
      },
    ];

    final List<Map<String, String>> topRated = [
      {
        'image': 'assets/images/top_3.png',
        'text': 'Mechanic',
      },
      {
        'image': 'assets/images/top_0.png',
        'text': 'AC service',
      },
      {
        'image': 'assets/images/top_1.png',
        'text': 'Pet Sitting',
      },
      {
        'image': 'assets/images/top_2.png',
        'text': 'Gardener',
      },
    ];

    final List<Map<String, String>> within900m = [
      {
        'image': 'assets/images/near_2.png',
        'text': 'Electrician',
      },
      {
        'image': 'assets/images/near_1.png',
        'text': 'AC service',
      },
      {
        'image': 'assets/images/near_0.png',
        'text': 'Gardener',
      },
      {
        'image': 'assets/images/near_3.png',
        'text': 'Car service',
      },
    ];

    return Padding(
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'uberB',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categorydata.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _onCategoryTapped(Categorydata[index].name),
                      child: Container(
                        height: 80,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 55,
                              width: 64,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 238, 238, 238),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(Categorydata[index].icon),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  Categorydata[index].name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Grab Deals",
                style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deals.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(deals[index]['image']!),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 160,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              deals[index]['text']!,
                              style:
                                  TextStyle(fontSize: 12, fontFamily: 'uberB'),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 160,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              deals[index]['description']!,
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'uber',
                                color: const Color.fromARGB(255, 123, 122, 122),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top rated",
                style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(topRated[index]['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 110,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              topRated[index]['text']!,
                              style:
                                  TextStyle(fontSize: 12, fontFamily: 'uberB'),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Within 900m",
                style: TextStyle(fontSize: 20, fontFamily: 'uberB'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: within900m.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(within900m[index]['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 160,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              within900m[index]['text']!,
                              style:
                                  TextStyle(fontSize: 12, fontFamily: 'uberB'),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
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

  Widget buildCategoriesScreen() {
    // Build your categories screen here
    return Center(child: Text('Categories Screen'));
  }
}
