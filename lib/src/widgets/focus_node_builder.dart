import 'package:flutter/material.dart';

class FocusNodeBuilder extends StatefulWidget {
  const FocusNodeBuilder(
      {super.key, this.onFocusLost, this.onFocusGain, required this.builder});

  final VoidCallback? onFocusLost;
  final VoidCallback? onFocusGain;
  final Widget Function(BuildContext context, FocusNode focusNode) builder;

  @override
  State<FocusNodeBuilder> createState() => _FocusNodeBuilderState();
}

class _FocusNodeBuilderState extends State<FocusNodeBuilder> {
  late final FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(_listener);
    super.initState();
  }

  void _listener() {
    if (!focusNode.hasFocus) {
      widget.onFocusLost?.call();
    } else {
      widget.onFocusGain?.call();
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_listener);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, focusNode);
  }
}