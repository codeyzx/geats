import 'package:flutter/material.dart';
import 'package:geats/src/constants/constants.dart';

class NutritionFactsPage extends StatelessWidget {
  const NutritionFactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nutrition Facts',
          style: TypographyApp.titleScan,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Nutrition Facts',
                  style: TypographyApp.titleScan,
                ),
              ),
              Gap.h12,
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Compare',
                    style: TypographyApp.descScan,
                  ),
                ),
              )
            ],
          ),
          // line horizontal
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          Gap.h12,
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  'Serving Size',
                  style: TypographyApp.descScan,
                ),
              ),
              Gap.h12,
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  '1 cup (228g)',
                  style: TypographyApp.descScan,
                ),
              ),
            ],
          ),
          Gap.h12,
          // line horizontal
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          Gap.h12,
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  'Amount Per Serving',
                  style: TypographyApp.descScan,
                ),
              ),
              Gap.h12,
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  'Calories 250',
                  style: TypographyApp.descScan,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
