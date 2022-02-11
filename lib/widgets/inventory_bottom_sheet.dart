import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/enums.dart';
import '../../../data/provider/globals.dart';
import '../../../widgets/text_view.dart';
import '../core/values/colors.dart';
import '../data/model/inventory_item_v2.dart';
import '../modules/order_entry/screens/home/components/white_search_field.dart';
import '../utils/images.dart';

class InventoryBottomSheet extends StatelessWidget {
  final TextEditingController searchProductTextController;
  final Function(String) onSearchTextChange;
  final Function(InventoryItem) onTapItem;
  final Rx<InventoryItemV2> searchResult;
  const InventoryBottomSheet(
      {Key? key,
      required this.searchProductTextController,
      required this.onSearchTextChange,
      required this.onTapItem,
      required this.searchResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.2,
      maxChildSize: 0.75,
      expand: false,
      builder: (_, ctrl) => Container(
        color: AppColor.brightGray,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
              child: WhiteSearchField(
                  controller: searchProductTextController,
                  onChanged: (val) => onSearchTextChange(val),
                  onPress: () {},
                  isFetching: false.obs),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: ctrl,
                  itemCount: searchResult.value.items!.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    final InventoryItem item = searchResult.value.items![index];
                    return GestureDetector(
                      onTap: () {
                        onTapItem(item);
                        Navigator.pop(context);
                      },
                      child: Card(
                        child: Container(
                          height: 75,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CachedNetworkImage(
                                    imageUrl: item.itemInfo != null
                                        ? item.itemInfo!.imageUrl
                                        : "",
                                    height: 55,
                                    width: 70,
                                    errorWidget: (context, url, _) =>
                                        SvgPicture.asset(
                                            kProductPlaceholderImage,
                                            width: 80)),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        item.catalogSlide!.content!
                                            .description!,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: AppColor.charcoal)),
                                    AppText(
                                      text:
                                          "${"code".tr}: ${item.item!.id!.unicity}",
                                      style: TextTypes.caption,
                                      color: AppColor.metallicSilver,
                                    ),
                                    AppText(
                                      text:
                                          "${item.terms!.pvEach} ${"pv".tr} | ${item.terms!.priceEach} ${Globals.currency}",
                                      style: TextTypes.subtitle2,
                                      color: AppColor.charcoal,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
