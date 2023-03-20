import 'package:flutter/material.dart';

class SmoothInfiniteScrollLoader extends StatefulWidget {
  const SmoothInfiniteScrollLoader({
    super.key,
    this.loader,
    this.child,
  });

  final VoidCallback? loader;
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
