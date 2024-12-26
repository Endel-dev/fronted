import '../../../../config.dart';
import '../../../../plugin_list.dart';
import 'package:piggypaisa/common/common_path_list.dart';

import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../plugin_list.dart';
import '../../../../common/theme/scale.dart';
import '../../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../../provider/app_pages_provider/details_provider.dart';
import '../../../../provider/app_pages_provider/direction_provider.dart';
import '../../../../provider/theme_provider/theme_service.dart';
import '../../../../routes/index.dart';
import '../../../../utils/common_function.dart';
import '../../../../widgets/common_widgets.dart';
import 'common_container.dart';
import 'common_list_header.dart';
import 'details_carousel_image.dart';
import 'details_check_delivery_sublayout.dart';
import 'details_second_layout/details_widget.dart';
class DetailsSubLayoutCarousel extends StatelessWidget {
  const DetailsSubLayoutCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      //carousel slider layout
      return CarouselSlider(
          carouselController: details.carouselController,
          items: appArray.imageArray.asMap().entries.map((entry) {
            final index = entry.key;
            final imageUrl = entry.value;
            final isEnlarged = index == details.currentPage;
            return DetailsCarousel(
              data: imageUrl,
              index: isEnlarged,
            );
          }).toList(),
          options: CarouselOptions(
              onPageChanged: (isEnlarged, reason) {
                details.onChangePage(isEnlarged);
              },
              disableCenter: true,
              padEnds: false,
              enlargeStrategy: CenterPageEnlargeStrategy.values.first,
              height: Sizes.s238,
              animateToClosest: true,
              viewportFraction: 0.6,
              enlargeCenterPage: true,
              enlargeFactor: 0.65,
              enableInfiniteScroll: true,
              initialPage: 0,
              autoPlay: false));
    });
  }
}
