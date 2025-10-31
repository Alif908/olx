import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';
import 'package:olx/login%20page/login.dart';
import 'package:olx/parts/olxtopbar.dart';
import 'package:olx/parts/product_card.dart';
import 'package:olx/parts/top_bar.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> searchTerms = [
    'Bikes',
    'Cars',
    'Mobiles',
    'Jobs',
    'Properties',
  ];
  int currentIndex = 0;
  Timer? timer;
  late AnimationController animationController;
  late Animation<double> animation;
  final TextEditingController textController = TextEditingController();
  bool isTyping = false;
  Set<int> favorites = {};

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'image': ImagesCons.zencar,
      'price': '₹ 1,00,00',
      'title': 'zen',
      'subtitle': '2 BHK - 2 Bathroom - 1350 sqft',
      'location': 'MANEED, MULAMTHURUTHY',
      'featured': true,
    },
    {
      'id': 2,
      'image': ImagesCons.brezzacar,

      'price': '₹ 8,75,000',
      'title': 'suzuki brezza, 2023, PETROL',
      'subtitle': '2023 - 7,579 km',
      'location': 'MUVATTUPUZHA, MUVATTUPU...',
      'featured': true,
    },
    {
      'id': 3,
      'image': ImagesCons.iphone13,
      'price': '₹ 26,000',
      'title': 'IPHONE 13 128 GB',
      'subtitle': '',
      'location': 'KADATHY PALAM, MUVATTUPU...',
      'featured': false,
    },
    {
      'id': 4,
      'image': ImagesCons.redme,
      'price': '₹ 18,000',
      'title': 'OPPO F27PRO +',
      'subtitle': '',
      'location': 'MUDUTTUPUZHA, MUVATTUPPU...',
      'featured': false,
    },
    {
      'id': 5,
      'image': ImagesCons.zencar,
      'price': '₹ 1,00,00',
      'title': 'zen',
      'subtitle': '2 BHK - 2 Bathroom - 1350 sqft',
      'location': 'MANEED, MULAMTHURUTHY',
      'featured': true,
    },
    {
      'id': 6,
      'image': ImagesCons.brezzacar,

      'price': '₹ 8,75,000',
      'title': 'suzuki brezza, 2023, PETROL',
      'subtitle': '2023 - 7,579 km',
      'location': 'MUVATTUPUZHA, MUVATTUPU...',
      'featured': true,
    },
    {
      'id': 7,
      'image': ImagesCons.iphone13,
      'price': '₹ 26,000',
      'title': 'IPHONE 13 128 GB',
      'subtitle': '',
      'location': 'KADATHY PALAM, MUVATTUPU...',
      'featured': false,
    },
    {
      'id': 8,
      'image': ImagesCons.redme,
      'price': '₹ 18,000',
      'title': 'OPPO F27PRO +',
      'subtitle': '',
      'location': 'MUDUTTUPUZHA, MUVATTUPPU...',
      'featured': false,
    },
    {
      'id': 9,
      'image': ImagesCons.zencar,
      'price': '₹ 1,00,00',
      'title': 'zen',
      'subtitle': '2 BHK - 2 Bathroom - 1350 sqft',
      'location': 'MANEED, MULAMTHURUTHY',
      'featured': true,
    },
    {
      'id': 10,
      'image': ImagesCons.brezzacar,

      'price': '₹ 8,75,000',
      'title': 'suzuki brezza, 2023, PETROL',
      'subtitle': '2023 - 7,579 km',
      'location': 'MUVATTUPUZHA, MUVATTUPU...',
      'featured': true,
    },
    {
      'id': 11,
      'image': ImagesCons.iphone13,
      'price': '₹ 26,000',
      'title': 'IPHONE 13 128 GB',
      'subtitle': '',
      'location': 'KADATHY PALAM, MUVATTUPU...',
      'featured': false,
    },
    {
      'id': 12,
      'image': ImagesCons.redme,
      'price': '₹ 18,000',
      'title': 'OPPO F27PRO +',
      'subtitle': '',
      'location': 'MUDUTTUPUZHA, MUVATTUPPU...',
      'featured': false,
    },
  ];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    // Start the animation loop
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (!isTyping) {
        animationController.forward().then((_) {
          setState(() {
            currentIndex = (currentIndex + 1) % searchTerms.length;
          });
          animationController.reset();
        });
      }
    });

    textController.addListener(() {
      setState(() {
        isTyping = textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    animationController.dispose();
    textController.dispose();
    super.dispose();
  }

  void toggleFavorite(int id) {
    setState(() {
      if (favorites.contains(id)) {
        favorites.remove(id);
      } else {
        favorites.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topbar(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  olxtopbar(),
                  Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey),
                        Text(
                          "2H3R+6VC,Kerala 686673,India",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            search(),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  spacing: 10,
                  children: [
                    Column(
                      spacing: 20,
                      children: [
                        All(
                          context,
                          name: 'Cars',
                          image: ImagesCons.Cars,
                          size: 45,
                        ),
                        All(
                          context,
                          name: 'Bikes',
                          image: ImagesCons.bike,
                          size: 30,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        All(
                          size: 35,
                          context,
                          name: 'Properties',
                          image: ImagesCons.Properties,
                        ),
                        All(
                          size: 55,
                          context,
                          name: 'Electronics &\n Appliances',
                          image: ImagesCons.electronicsappliances,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        All(
                          context,
                          name: 'Mobiles',
                          image: ImagesCons.Mobiles,
                          size: 55,
                        ),
                        All(
                          context,
                          name: 'Commercial \nVehicles & sp...',
                          image: ImagesCons.vehiclespare,
                          size: 55,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        All(
                          context,
                          name: 'Jobs',
                          image: ImagesCons.Jobs,
                          size: 35,
                        ),
                        All(
                          context,
                          name: 'Furniture',
                          image: ImagesCons.furniture,
                          size: 35,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        All(
                          context,
                          name: 'Fasion',
                          image: ImagesCons.Fasion,
                          size: 100,
                        ),
                        All(
                          context,
                          name: 'Pets',
                          image: ImagesCons.pets,
                          size: 6,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        All(
                          context,
                          name: "Book,Sports &\n Hobbies",
                          image: ImagesCons.BooksSportsHobbies,
                          size: 70,
                        ),
                        All(
                          context,
                          name: "Services",
                          image: ImagesCons.services,
                          size: 4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse(
                  'https://in.pinterest.com/pin/pickle-creative-ads--255297872622766801/',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 100,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(ImagesCons.pickellogo),
                        radius: 30,
                      ),
                      Text(
                        "Any Time \nA Good Time For Pickel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          //border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Text("Fresh recommendations"),
            SizedBox(height: 20),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse('https://www.tripadvisor.in/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: Container(
                decoration: BoxDecoration(),
                child: Image.asset(ImagesCons.tripadutersemnet),
              ),
            ),

            // Product Grid Added Here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    isFavorite: favorites.contains(product['id']),
                    onFavoriteToggle: () => toggleFavorite(product['id']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell All(
    BuildContext context, {
    required String name,
    required String image,
    required double size,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: Column(
        children: [
          Image.asset(image, scale: size),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }
  //search button

  Padding search() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic, color: Colors.black),
                    hintText: "Search",
                  ),
                ),
                if (!isTyping)
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IgnorePointer(
                          child: AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, -20 * animation.value),
                                child: Opacity(
                                  opacity: 1 - animation.value,
                                  child: Text(
                                    "${searchTerms[currentIndex]}",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border, color: Colors.black, size: 28),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
