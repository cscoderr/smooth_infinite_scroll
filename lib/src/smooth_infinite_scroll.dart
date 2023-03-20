import 'package:flutter/material.dart';
import 'package:smooth_infinite_scroll/src/smooth_infinite_scroll_loader.dart';

/// {@template smooth_infinite_scroll}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class SmoothInfiniteScroll<T> extends StatelessWidget {
  /// {@macro smooth_infinite_scroll}
  const SmoothInfiniteScroll({
    required this.items,
    required this.item,
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

  final List<T> items;
  final Widget item;
  final Widget? seperator;
  final double seperatorHeight;
  final Widget? loader;
  final VoidCallback? onLoadMore;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final bool hasMore;
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
        return item;
      },
      separatorBuilder: (context, index) =>
          seperator ?? SizedBox(height: seperatorHeight),
      itemCount: items.length + 1,
    );
  }
}
