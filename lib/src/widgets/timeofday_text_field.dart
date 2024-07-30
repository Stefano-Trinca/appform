import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TimeOfDayTextField extends StatelessWidget {
  /// Time Of Day field
  ///
  /// use the MediaQuery for the format of the time
  ///
  /// ``` dart
  /// MediaQuery(
  ///   data: MediaQueryData(alwaysUse24HourFormat: true),
  ///   child: MaterialApp(
  ///   ...
  /// ```
  const TimeOfDayTextField({
    super.key,
    this.controller,
    this.value,
    this.showTimeOfDayPicker,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.center,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.obscureText = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onAppPrivateCommand,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.canRequestFocus = true,
    this.magnifierConfiguration,
    this.enableInteractiveSelection,
  });

  final TimeOfDay? value;
  final TextEditingController? controller;

  final Future<TimeOfDay?> Function(
      BuildContext context, TimeOfDay? initialTime)? showTimeOfDayPicker;

  final TextMagnifierConfiguration? magnifierConfiguration;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool autofocus;
  final bool obscureText;
  final String obscuringCharacter;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final bool expands;
  final bool readOnly;
  final bool? showCursor;
  final int? maxLength;
  final ValueChanged<TimeOfDay>? onChanged;
  final VoidCallback? onEditingComplete;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final bool canRequestFocus;

  void selectTimeOfDay(BuildContext context) async {
    final date = showTimeOfDayPicker == null
        ? await showTimePicker(
            // ignore: use_build_context_synchronously
            context: context,
            initialTime: value ?? TimeOfDay.now(),
          )
        // ignore: use_build_context_synchronously
        : await showTimeOfDayPicker?.call(context, value);
    if (date != null) {
      onChanged?.call(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController fieldController =
        (controller ?? TextEditingController());
    if (value != null) {
      fieldController.text = value!.format(context);
    }

    return TextFormField(
      controller: fieldController,
      obscureText: obscureText,
      decoration: decoration,
      keyboardType: keyboardType ?? TextInputType.datetime,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      showCursor: showCursor,
      autofocus: autofocus,
      obscuringCharacter: obscuringCharacter,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      expands: expands,
      maxLength: maxLength,
      // onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onAppPrivateCommand: onAppPrivateCommand,
      enabled: enabled,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorOpacityAnimates: cursorOpacityAnimates,
      cursorColor: cursorColor,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      dragStartBehavior: dragStartBehavior,
      selectionControls: selectionControls,
      onTap: () => selectTimeOfDay(context),
      onTapOutside: onTapOutside,
      mouseCursor: mouseCursor,
      buildCounter: buildCounter,
      scrollController: scrollController,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      scribbleEnabled: scribbleEnabled,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      canRequestFocus: canRequestFocus,
      magnifierConfiguration: magnifierConfiguration,
      enableInteractiveSelection: enableInteractiveSelection ?? false,
    );
  }
}
