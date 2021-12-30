import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/colors.dart';
import '../controller/dashboard.controller.dart';

class CarouselSliderWithCustomIndicator extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          CarouselSlider(
            items: controller.corouselImages.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Text('Image error!'),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 308,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                controller.currentActiveImage.value = index;
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.corouselImages.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    child: Container(
                      width: controller.currentActiveImage.value == entry.key
                          ? 10.0
                          : 3.0,
                      height: 3.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: controller.currentActiveImage.value == entry.key
                            ? AppColor.pastelOrange
                            : Colors.black.withOpacity(
                                controller.currentActiveImage.value == entry.key
                                    ? 0.9
                                    : 0.4),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
