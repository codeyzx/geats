import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';

class TutorialRecyclePage extends ConsumerWidget {
  const TutorialRecyclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> tutorial = [
      {
        'name': 'How to make your own compost',
        'desc': 'Composting is a great way to reduce your carbon footprint.',
      },
      {
        'name': 'Recycling Food: A Step-by-Step Guide',
        'desc':
            'Learn how to recycle food waste and contribute to a sustainable environment.',
      },
      {
        'name': 'Reducing Food Packaging Waste',
        'desc':
            'Discover tips and tricks to minimize food packaging waste in your daily life.',
      },
      {
        'name': 'Creative Ways to Repurpose Food Containers',
        'desc':
            'Turn your used food containers into useful items with these innovative ideas.',
      },
      {
        'name': 'Zero-Waste Cooking: Practical Tips for Every Kitchen',
        'desc':
            'Explore strategies for minimizing waste while preparing delicious and nutritious meals.',
      },
      {
        'name': 'Eco-Friendly Grocery Shopping: A Guide to Sustainable Choices',
        'desc':
            'Make environmentally conscious decisions during your grocery shopping trips.',
      },
      {
        'name': 'Understanding Food Labels: A Sustainable Consumer\'s Guide',
        'desc':
            'Decode food labels to make informed choices that align with sustainable practices.',
      },
      {
        'name': 'DIY Reusable Beeswax Wraps',
        'desc':
            'Create your own eco-friendly alternative to plastic wraps with this simple tutorial.',
      },
      {
        'name': 'Upcycling Kitchen Scraps for Garden Fertilizer',
        'desc':
            'Transform kitchen scraps into nutrient-rich fertilizer for your garden.',
      },
      {
        'name': 'Companion Planting: Enhancing Garden Biodiversity',
        'desc':
            'Learn how to pair plants strategically to promote a healthier and more productive garden.',
      },
      {
        'name': 'Making Natural Cleaning Products at Home',
        'desc':
            'Craft environmentally friendly cleaning solutions using simple, natural ingredients.',
      },
      {
        'name': 'The Basics of Sustainable Eating',
        'desc':
            'Explore the principles of sustainable eating and their positive impact on the environment.',
      },
      {
        'name': 'DIY Cloth Napkins: An Eco-Friendly Alternative',
        'desc':
            'Sew your own reusable cloth napkins and reduce your reliance on disposable paper products.',
      },
      {
        'name': 'Waste-Free Lunches: Packed with Sustainability',
        'desc':
            'Discover ways to pack waste-free and sustainable lunches for work or school.',
      },
      {
        'name': 'Green Energy at Home: Small Changes, Big Impact',
        'desc':
            'Implement energy-saving practices in your home to contribute to a greener environment.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: -10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tutorial Recycle Food',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h8,
              TextFormField(
                style: TypographyApp.invenSearchOn,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TypographyApp.invenSearchHint.copyWith(
                    color: HexColor('#747688'),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: HexColor('#747688'),
                    size: 26.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17.r),
                    borderSide: BorderSide(
                      color: HexColor('#CDCACA'),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17.r),
                    borderSide: BorderSide(
                      color: ColorApp.secondary,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
              Gap.h16,
              Text(
                'Most Popular Tutorial',
                style: TypographyApp.text1.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap.h16,
              SizedBox(
                height: 240.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Container(
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: HexColor('#F2F2F2'),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child:

                                        //           CachedNetworkImage(
                                        //   imageUrl:
                                        //       'https://picsum.photos/250?image=9',
                                        //   imageBuilder: (context, imageProvider) =>
                                        //       Container(
                                        //     decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(10.r),
                                        //       image: DecorationImage(
                                        //         image: imageProvider,
                                        //         fit: BoxFit.cover,
                                        //       ),
                                        //     ),
                                        //   ),
                                        //   placeholder: (context, url) =>
                                        //       const Center(
                                        //     child: CircularProgressIndicator(),
                                        //   ),
                                        //   errorWidget: (context, url, error) =>
                                        //       const Icon(Icons.error),
                                        // ),

                                        Container(
                                      height: 100.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: HexColor('#F1F5F5'),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.fastfood_rounded,
                                          color: HexColor('#85B1B4'),
                                          size: 50.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap.h8,
                                Text(
                                  tutorial[index]['name'],
                                  style: TypographyApp.text1.copyWith(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Gap.h4,
                                SizedBox(
                                  width: 150.w,
                                  child: Text(
                                    tutorial[index]['desc'],
                                    style: TypographyApp.text1.copyWith(
                                      color: HexColor('#747688'),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
              Gap.h16,
              Text(
                'All Tutorial',
                style: TypographyApp.text1.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap.h16,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tutorial.length,
                itemBuilder: (context, index) {
                  return FoodBankWidget(
                    foodbank: tutorial[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodBankWidget extends StatelessWidget {
  final Map<String, dynamic> foodbank;

  const FoodBankWidget({
    required this.foodbank,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: HexColor('#F2F2F2'),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child:

                          // CachedNetworkImage(
                          //   imageUrl: 'https://picsum.photos/250?image=9',
                          //   imageBuilder: (context, imageProvider) => Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.r),
                          //       image: DecorationImage(
                          //         image: imageProvider,
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //   ),
                          //   placeholder: (context, url) => const Center(
                          //     child: CircularProgressIndicator(),
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          // ),
                          Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: HexColor('#F1F5F5'),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.fastfood_rounded,
                            color: HexColor('#85B1B4'),
                            size: 30.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap.w8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          foodbank['name'],
                          style: TypographyApp.text1.copyWith(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gap.h4,
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          foodbank['desc'],
                          style: TypographyApp.text1.copyWith(
                            color: HexColor('#747688'),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
