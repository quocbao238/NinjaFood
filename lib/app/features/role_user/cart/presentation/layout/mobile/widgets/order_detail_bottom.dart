import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/cart/controllers/cart_screen_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';

class OrderDetailBottom extends GetView<CartScreenController> {
  const OrderDetailBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.only(bottom: AppGapSize.small),
      child: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/icons/placeOrder.png'), fit: BoxFit.cover, opacity: 0.4),
            gradient: ThemeColors.gradientButtonColor,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(-4, 4)),
              BoxShadow(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(4, -4))
            ],
            borderRadius: BorderRadius.circular(16)),
        child: AppPadding.small(
          child: Obx(() {
            final subTotal = formatPriceToVND(controller.subTotalPrice.value) + " VND";
            final serviceFee = controller.serviceFee.toString() + "%";
            final discount = formatPriceToVND(controller.promotion.value) + " VND";
            final total = formatPriceToVND(controller.totalPrice.value) + " VND";
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderTitleValueText(title: 'Cart_Sub_Total'.tr, value: subTotal),
                OrderTitleValueText(title: 'Cart_Total_Tax'.tr, value: serviceFee),
                OrderTitleValueText(title: 'Cart_Total_Discount'.tr, value: discount),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText.titleSmall(
                          text: 'Cart_Total_Price'.tr, color: ThemeColors.textDarkColor, fontWeight: FontWeight.bold),
                      Expanded(
                        child: AppText.titleMedium(
                            textAlign: TextAlign.end,
                            text: total,
                            color: ThemeColors.textPriceColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class OrderTitleValueText extends StatelessWidget {
  final String title;
  final String value;

  const OrderTitleValueText({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppText.bodyLarge(
            text: title,
            color: ThemeColors.textDarkColor,
            fontWeight: FontWeight.w400,
          ),
          Expanded(
            child: AppText.bodyLarge(
              textAlign: TextAlign.end,
              text: value,
              color: ThemeColors.textDarkColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
