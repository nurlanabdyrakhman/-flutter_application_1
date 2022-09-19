import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeardBTN extends StatelessWidget {
  const HeardBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        print('selam');
      },
      child: Icon(
        IconlyLight.heart,
        size: 20,
        color: color,
      ),
    );
  }
}
