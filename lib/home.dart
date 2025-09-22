import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rosalia_sprints/models/product.dart';
import 'package:rosalia_sprints/widgets/hot_offer_item.dart';
import 'package:rosalia_sprints/widgets/product-card.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int currentFeature = 0;

  final List<Product> products = [
    Product(
        id: 'p1',
        nameKey: "Camellia",
        descriptionKey: "camilia_description",
        imageUrl: "assets/images/camellia.jpeg.jpeg",
        price: 120),
    Product(
        id: 'p2',
        nameKey: 'Cherry Blossom',
        descriptionKey: "cherryBlossom_description",
        imageUrl: "assets/images/cherryBlossom.jpeg.jpeg",
        price: 190),
    Product(
        id: 'p3',
        nameKey: 'Chrysanthemum',
        descriptionKey: "Chrysanthemu_description",
        imageUrl: "assets/images/chrysanthemum.jpeg.jpeg",
        price: 180),
    Product(
        id: 'p4',
        nameKey: 'Jouri',
        descriptionKey: 'Jouri_description',
        imageUrl: "assets/images/jouri.jpeg.jpeg",
        price: 250),
    Product(
        id: 'p5',
        nameKey: 'Lotus',
        descriptionKey: 'Lotus_description',
        imageUrl: "assets/images/lotus.jpeg.jpeg",
        price: 200),
    Product(
        id: 'p6',
        nameKey: 'peony',
        descriptionKey: 'peony_description',
        imageUrl: "assets/images/peony.jpeg.jpeg",
        price: 300),
    Product(
        id: 'p7',
        nameKey: 'plumeria',
        descriptionKey: 'plumeria_description',
        imageUrl: "assets/images/plumeria.jpeg.jpeg",
        price: 150),
    Product(
        id: 'p8',
        nameKey: 'Tulip',
        descriptionKey: 'Tulip_description',
        imageUrl: "assets/images/tulip.jpeg.jpeg",
        price: 400),
  ];

  final List<Map<String, String>> hotOffers = [
    {'image': 'assets/images/valentine.jpeg', 'desc': "valentine_offer"},
    {'image': 'assets/images/wedding.jpeg', 'desc': "wedding_offer"},
    {'image': 'assets/images/motherDay.jpeg', 'desc': "mother_offer"},
    {'image': 'assets/images/corporate_events.jpeg', 'desc': "events_offer"},
    {'image': 'assets/images/spring.jpeg', 'desc': "spring_offer"}
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != currentFeature) {
        setState(() => currentFeature = page);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showSnackBar(String translationKey) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(translationKey.tr()),
      ),
    );
  }

  void _showProductDetails(Product p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xffE6879A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.5,
          maxChildSize: 0.75,
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        p.imageUrl,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      p.nameKey.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      p.descriptionKey.tr(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 250, 216, 203),
                              foregroundColor: const Color(0xffC3455E),
                            ),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              _showSnackBar("item_added");
                            },
                            child: Text(
                              "add_item".tr(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF3EE),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF3EE),
        title: Text(
          "Our Product".tr(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffC3455E),
              fontSize: 25),
        ),
        leading: IconButton( // ✅ سهم الرجوع
    icon: const Icon(Icons.arrow_back, color: Color(0xffC3455E)),
    onPressed: () {
      Navigator.pushReplacementNamed(context,"/sign_in" );  
    },
  ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar', 'EG'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(p.imageUrl, fit: BoxFit.cover),
                            Container(color: Colors.black.withOpacity(0.25)),
                            Positioned(
                              left: 12,
                              bottom: 12,
                              child: Text(
                                p.nameKey.tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 4, color: Colors.black54)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentFeature == i ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentFeature == i
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  final p = products[index];
                  return productCard(
                    product: p,
                    onTap: () => _showProductDetails(p),
                    onAddToCart: () => _showSnackBar('item_added'.tr()),
                  );
                }),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'hot_offers'.tr(),
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotOffers.length,
              itemBuilder: (context, i) {
                final offer = hotOffers[i];
                return HotOfferItem(
                  imageUrl: offer['image']!,
                  description: offer['desc']!.tr(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
