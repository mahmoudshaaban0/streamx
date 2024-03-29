import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamx/core/helpers/app_functions.dart';
import 'package:streamx/core/theme/app_colors.dart';

import '../../data/dummy_carousel_data.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = news
        .map((item) => InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: item.imgUrl,
                            fit: BoxFit.cover,
                            height: 220.h,
                            width: double.infinity,
                            memCacheWidth: 500.cacheSize(context),
                            memCacheHeight: 220.cacheSize(context),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[300],
                            ),
                            placeholder: (context, url) {
                              return Container(
                                color: Colors.grey[300],
                              );
                            },
                          ),
                          Container(
                            height: 220.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue, // Starting color of the gradient
                                  Colors
                                      .transparent, // End color of the gradient (transparent)
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: news.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _current == entry.key ? 40.0 : 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: _current == entry.key
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withOpacity(0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
