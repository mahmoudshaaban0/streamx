import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamx/core/constants/assets.dart';
import 'package:streamx/core/helpers/spacing.dart';
import 'package:streamx/core/theme/app_textstyle.dart';
import 'package:streamx/features/search/logic/cubit/upcoming_cubit.dart';
import 'package:streamx/features/search/logic/cubit/upcoming_state.dart';
import 'package:streamx/features/search/ui/widgets/search_item_skelton_widget.dart';
import 'package:streamx/features/search/ui/widgets/search_item_widget.dart';

import '../widgets/category_item.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  List<String> categories = ['Movies', 'TV Shows', 'People', 'Comedy', 'Drama'];

  @override
  Widget build(BuildContext context) {
    context.read<UpcomingCubit>().getUpcomingData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: AppTextStyle.fMulishB1Bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(24),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search ...',
                  hintStyle: AppTextStyle.fMulishB3Bold,
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 40, minHeight: 40),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SvgPicture.asset(
                      Assets.iconsSearchIcon,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ),
              ),
              verticalSpace(16),
              Flexible(
                child: SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SearchCategoryItem(
                          title: categories[index],
                        );
                      },
                    )),
              ),
              verticalSpace(16),
              BlocBuilder<UpcomingCubit, UpcomingState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      loading: () => const SearchItemSketlonWIdget(),
                      orElse: () => const SizedBox(),
                      success: (movieItems) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15.w,
                              mainAxisExtent: 250.h,
                              mainAxisSpacing: 5.h,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movieItems.results.length,
                            itemBuilder: (context, index) {
                              return SearchItemWidget(
                                  title: movieItems.results[index].title,
                                  subTitle: movieItems
                                      .results[index].voteAverage
                                      .toStringAsFixed(2),
                                  imageUrl:
                                      movieItems.results[index].posterPath);
                            });
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
