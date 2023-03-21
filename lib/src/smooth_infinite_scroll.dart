import 'package:flutter/material.dart';
import 'package:smooth_infinite_scroll/src/smooth_infinite_scroll_loader.dart';

/// {@template smooth_infinite_scroll}
/// Smooth infinite scroll Class
/// {@endtemplate}
class SmoothInfiniteScroll<T> extends StatelessWidget {
  /// {@macro smooth_infinite_scroll}
  const SmoothInfiniteScroll({
    required this.items,
    required this.itemBuilder,
    super.key,
    this.seperator,
    this.loader,
    this.onLoadMore,
    this.errorWidget,
    this.emptyWidget,
    this.hasMore = false,
    this.hasError = false,
    this.seperatorHeight = 10,
  });

  /// {@macro smooth_infinite_scroll}
  /// List of items
  final List<T> items;

  /// {@macro smooth_infinite_scroll}
  /// Widget to be displayed for each item
  final Widget Function(BuildContext, int) itemBuilder;

  /// {@macro smooth_infinite_scroll}
  /// Widget to be displayed between each item
  final Widget? seperator;

  /// {@macro smooth_infinite_scroll}
  /// Height of the default seperator
  final double seperatorHeight;

  /// {@macro smooth_infinite_scroll}
  /// Widget to be displayed when loading more items
  final Widget? loader;

  /// {@macro smooth_infinite_scroll}
  /// Callback to be called when loading more items
  final VoidCallback? onLoadMore;

  /// {@macro smooth_infinite_scroll}
  /// Widget to be displayed when an error occurs
  final Widget? errorWidget;

  /// {@macro smooth_infinite_scroll}
  /// Widget to be displayed when there are no items
  final Widget? emptyWidget;

  /// {@macro smooth_infinite_scroll}
  /// Checks if there are more items to be loaded
  final bool hasMore;

  /// {@macro smooth_infinite_scroll}
  /// Checks if an error occured
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == items.length) {
          if (hasError) {
            return errorWidget ??
                const Center(
                  child: Text('An error occured'),
                );
          }
          if (hasMore) {
            return SmoothInfiniteScrollLoader(
              loader: onLoadMore,
              child: loader,
            );
          }
          return const SizedBox.shrink();
        }
        if (items.isEmpty) {
          return emptyWidget ??
              const Center(
                child: Text('No items'),
              );
        }
        return itemBuilder(context, index);
      },
      separatorBuilder: (context, index) =>
          seperator ?? SizedBox(height: seperatorHeight),
      itemCount: items.length + 1,
    );
  }
}
