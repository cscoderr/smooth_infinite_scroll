import 'package:flutter/material.dart';

/// {@template smooth_infinite_scroll}
/// Smooth infinite scroll Loader Class
/// {@endtemplate}
class SmoothInfiniteScrollLoader extends StatefulWidget {
  /// {@macro smooth_infinite_scroll}
  const SmoothInfiniteScrollLoader({
    super.key,
    this.loader,
    this.child,
  });

  /// {@macro smooth_infinite_scroll}
  /// Callback to be called when loading more items
  final VoidCallback? loader;

  /// {@macro smooth_infinite_scroll}
  /// Widget to be displayed when loading more items
  final Widget? child;

  @override
  State<SmoothInfiniteScrollLoader> createState() =>
      _SmoothInfiniteScrollLoaderState();
}

class _SmoothInfiniteScrollLoaderState
    extends State<SmoothInfiniteScrollLoader> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.loader?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const CircularProgressIndicator();
  }
}
