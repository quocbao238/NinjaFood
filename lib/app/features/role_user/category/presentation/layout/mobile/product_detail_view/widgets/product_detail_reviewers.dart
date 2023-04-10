
part of product_detail_mobile_widgets;


class ProductDetailReviewer extends StatelessWidget {
  const ProductDetailReviewer();

  @override
  Widget build(BuildContext context) {
    final List<RateAndCmt> personRating = RateAndCmt.personRating;

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: personRating.length,
        itemBuilder: (context, index) {
          final isDarkMode = Theme.of(context).brightness == Brightness.dark;
          final _personRating = personRating[index];
          return AppPadding(
              padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ColoredBox(
                  color: isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
                  child: AppPadding.medium(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(_personRating.image),
                        Expanded(
                          child: AppPadding(
                            padding: AppEdgeInsets.only(left: AppGapSize.medium),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.bodyLarge(text: _personRating.name),
                                AppText.bodyMedium(text: '12 April 2021'),
                                AppPadding(
                                    padding: AppEdgeInsets.only(top: AppGapSize.medium),
                                    child: AppText.bodyMedium(
                                      text: _personRating.comment,
                                      textAlign: TextAlign.start,
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
