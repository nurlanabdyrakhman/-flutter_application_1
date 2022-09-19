import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/inner_screens/feeds_screen.dart';
import 'package:flutter_application_1/inner_screens/on_sale_screen.dart';
import 'package:flutter_application_1/provider/dark_theme_provider.dart';
import 'package:flutter_application_1/services/utils.dart';
import 'package:flutter_application_1/widgets/on_sale_widget.dart';
import 'package:flutter_application_1/widgets/text_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../services/global_medhods.dart';
import '../widgets/feed_items.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> _offerImages = [
    "assets/offres/Offer1.jpg",
    "assets/offres/Offer2.jpg",
    "assets/offres/Offer3.jpg",
    "assets/offres/Offer4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    //final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    //GlobalMedhods globalMedhods = GlobalMedhods();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.cover,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                // ignore: prefer_const_constructors
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: const DotSwiperPaginationBuilder(
                    color: Colors.red,
                    activeColor: Colors.green,
                  ),
                ),
                //control: const SwiperControl(color: Colors.pink),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                //  globalMedhods.
                GlobalMedhods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                maxLines: 1,
                color: Colors.pink,
                textSize: 18,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On slae'.toUpperCase(),
                        color: Colors.red,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.42,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return const OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                  //  Spacer(),
                  TextButton(
                    onPressed: () {
                      GlobalMedhods.navigateTo(
                          ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      maxLines: 1,
                      color: Colors.pink,
                      textSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width * 0.6 / (size.height * 0.59),
              children: List.generate(
                4,
                (index) {
                  return const FeedItemsWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
