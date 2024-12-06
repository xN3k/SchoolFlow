import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String name;
  final String imgPath;

  const DashboardCard({super.key, required this.name, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.005,
      ),
      height: height * 0.12,
      width: width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.03),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/$imgPath",
            width: width * 0.10,
            height: height * 0.05,
            fit: BoxFit.contain,
          ),
          SizedBox(height: height * 0.01),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.03,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
