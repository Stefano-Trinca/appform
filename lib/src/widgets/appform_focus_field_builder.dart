import 'package:flutter/material.dart';

class AppFormFocusFieldBuilder extends StatefulWidget {
  const AppFormFocusFieldBuilder(
      {super.key, this.onFocusLost, this.onFocusGain, required this.builder});

  final VoidCallback? onFocusLost;
  final VoidCallback? onFocusGain;
  final Widget Function(BuildContext context, FocusNode focusNode) builder;

  @override
  State<AppFormFocusFieldBuilder> createState() => _AppFormFocusFieldBuilderState();
}

class _AppFormFocusFieldBuilderState extends State<AppFormFocusFieldBuilder> {
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
