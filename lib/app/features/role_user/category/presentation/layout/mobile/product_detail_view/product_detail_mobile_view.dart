import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/product_detail_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'widgets/product_detail_mobile_widgets.dart';

class FoodDetailMobileView extends GetView<ProductDetailController> {
  const FoodDetailMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsController = TabsController.instant;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 64),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProductDetailAppbar(
                    title: AppButtonBack(onPressed: () => Get.back()),
                    expandedHeight: MediaQuery.of(context).size.height * 0.4,
                    minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                    backgroundImage:
                        CachedNetworkImage(imageUrl: controller.currentProduct.image?.url ?? '', fit: BoxFit.cover),
                  ),
                ),
                ProductDetailDescription(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () {
                print("Rebuild button");
                final loading = controller.loading.value;
                return Obx(() {
                  final isInCurrentCarts = controller.isInCarts.value;
                  final String textButton = isInCurrentCarts ? 'This item is already in your cart' : 'Add To Cart';
                  return AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.regular),
                    child: SafeArea(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: AnimationButton(
                              duration: Duration(milliseconds: 300),
                              loading: loading,
                              textButton: textButton,
                              textDone: 'Added..',
                              textLoading: 'Adding...',
                              ratioWidthButton: isInCurrentCarts ? 0.65 : 0.85,
                              ratioWidthDone: 0.3,
                              ratioWidthLoading: 0.55,
                              onPressed: () {
                                if (!isInCurrentCarts) {
                                  controller.addToCart();
                                }
                              },
                            ),
                          ),
                          if (isInCurrentCarts && !loading)
                            Obx(() {
                              final counterCarts = controller.lstCurrentCart.length;
                              return Container(
                                margin: const EdgeInsets.only(left: 16.0),
                                height: 80,
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        tabsController.onChangeToCartScreen();
                                        Get.until((route) => Get.currentRoute == AppRouteProvider.tabScreen);
                                      },
                                      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                          backgroundColor:
                                              MaterialStateProperty.all(ThemeColors.backgroundTextFormDark()),
                                          fixedSize: MaterialStateProperty.all(Size(64, 64)),
                                          maximumSize: MaterialStateProperty.all(Size(64, 64)),
                                          minimumSize: MaterialStateProperty.all(Size(64, 64)),
                                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                          )),
                                      child: Icon(FontAwesomeIcons.cartShopping, color: ThemeColors.primaryColor),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 16.0),
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                            color: ThemeColors.primaryColor.withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(16)),
                                        child: AppText.bodySmall(
                                          text: counterCarts.toString(),
                                          textAlign: TextAlign.center,
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
