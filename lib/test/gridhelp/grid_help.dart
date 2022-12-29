// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GridHelp extends StatelessWidget {
  const GridHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: double.infinity,
          color: Colors.grey,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: gridIconsAndTextList.length,
            itemBuilder: (context, index) => GridItem(
              icon: gridIconsAndTextList[index].icon,
              title: gridIconsAndTextList[index].title,
            ),
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const GridItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class GridIconsAndText {
  final IconData icon;
  final String title;
  const GridIconsAndText({
    required this.icon,
    required this.title,
  });
}

List<GridIconsAndText> gridIconsAndTextList = const [
  GridIconsAndText(icon: Icons.label, title: 'label'),
  GridIconsAndText(icon: Icons.e_mobiledata, title: 'e mobile'),
  GridIconsAndText(icon: Icons.wallet, title: 'wallet'),
  GridIconsAndText(icon: Icons.cabin, title: 'cabin'),
  GridIconsAndText(icon: Icons.flag, title: 'flag'),
  GridIconsAndText(icon: Icons.vaccines, title: 'vac'),
  GridIconsAndText(icon: Icons.back_hand, title: 'hand'),
  GridIconsAndText(icon: Icons.qr_code, title: 'qr code'),
  GridIconsAndText(icon: Icons.nat, title: 'nat'),
  GridIconsAndText(icon: Icons.yard, title: 'yard'),
  GridIconsAndText(icon: Icons.zoom_in, title: 'zoom'),
  GridIconsAndText(icon: Icons.wb_sunny, title: 'wb'),
  GridIconsAndText(icon: Icons.dangerous, title: 'danger'),
  GridIconsAndText(icon: Icons.nature, title: 'nature'),
  GridIconsAndText(icon: Icons.mail, title: 'mail'),
  GridIconsAndText(icon: Icons.u_turn_left, title: 'u turn'),
];
