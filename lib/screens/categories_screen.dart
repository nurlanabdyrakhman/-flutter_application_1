import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/categories_widget.dart';
import 'package:flutter_application_1/widgets/text_widget.dart';

import '../services/utils.dart';

class CatigoriesScreen extends StatelessWidget {
  CatigoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    Color(0xFF65dd4ff),
    Color(0xFFD1D200),
    Color(0xFFCD55F2),
    Color(0xFFD3BD66),
    Color(0xFFFF5544),
    Color(0xFF88DFC3),
    ];
  List<Map<String, dynamic>> catInfo = [
    {"imgPath": "assets/cat/fruits.png", "catText": "Fruist",},
    {"imgPath": "assets/cat/veg.png", "catText": "Vegetables",},
    {"imgPath": "assets/cat/Spinach.png", "catText": "Herbs",},
    {"imgPath": "assets/cat/nuts.png", "catText": "Nuts",},
    {"imgPath": "assets/cat/spices.png", "catText": "Spices",},
    {"imgPath": "assets/cat/grains.png", "catText": "Grains",},
  ];
  @override
  Widget build(BuildContext context) {
    //final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, //üç katar kılgan kelse bul jaktı uç kılsan bolot
          childAspectRatio: 300 / 250,
          crossAxisSpacing: 20,//vertical jak
          mainAxisSpacing: 20,  // horizontal
          children: List.generate(
            6,
            (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
               passedColor: gridColors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
