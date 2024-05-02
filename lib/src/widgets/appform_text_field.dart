import 'package:appform/src/fields/appform_field_string.dart';
import 'package:appform/src/widgets/appform_field_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFormTextField extends StatelessWidget {
  const AppFormTextField({
    super.key,
    required this.field,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.undoController,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
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
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.enableInteractiveSelection,
  });

  final AppFormFieldString field;
  final String? hintText;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
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
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final bool? showCursor;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
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
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final bool canRequestFocus;
  final UndoHistoryController? undoController;
  final SpellCheckConfiguration? spellCheckConfiguration;

  @override
  Widget build(BuildContext context) {
    return AppFormFieldBuilder(field: field,
        builder: (context, value, child) {
          final inputDecoration = (decoration ?? const InputDecoration()).copyWith(
            errorText: value.error,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            label: label==null ? null : Text(label!),
          );

          return TextField(
            controller: field.controller,
            focusNode: focusNode,
            decoration: inputDecoration,
            undoController: undoController,
            keyboardType: keyboardType,
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
            obscureText: obscureText,
            autocorrect: autocorrect,
            smartDashesType: smartDashesType,
            smartQuotesType: smartQuotesType,
            enableSuggestions: enableSuggestions,
            maxLines: maxLines,
            minLines: minLines,
            expands: expands,
            maxLength: maxLength,
            maxLengthEnforcement: maxLengthEnforcement,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onSubmitted: onSubmitted,
            onAppPrivateCommand: onAppPrivateCommand,
            inputFormatters: inputFormatters,
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
            onTap: onTap,
            onTapOutside: onTapOutside,
            mouseCursor: mouseCursor,
            buildCounter: buildCounter,
            scrollController: scrollController,
            scrollPhysics: scrollPhysics,
            autofillHints: autofillHints,
            contentInsertionConfiguration: contentInsertionConfiguration,
            clipBehavior: clipBehavior,
            restorationId: restorationId,
            scribbleEnabled: scribbleEnabled,
            enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
            contextMenuBuilder: contextMenuBuilder,
            canRequestFocus: canRequestFocus,
            spellCheckConfiguration: spellCheckConfiguration,
            magnifierConfiguration: magnifierConfiguration,
            enableInteractiveSelection: enableInteractiveSelection,
          );
        },
    );
    // return ValueListenableBuilder(
    //     valueListenable: field,
    //     builder: (context, value, child) {
    //       final inputDecoration = (decoration ?? const InputDecoration()).copyWith(
    //         errorText: value.error,
    //         hintText: hintText,
    //         suffixIcon: suffixIcon,
    //         prefixIcon: prefixIcon,
    //       );
    //
    //       return TextField(
    //         controller: field.controller,
    //         focusNode: focusNode,
    //         decoration: inputDecoration,
    //         undoController: undoController,
    //         keyboardType: keyboardType,
    //         textInputAction: textInputAction,
    //         textCapitalization: textCapitalization,
    //         style: style,
    //         strutStyle: strutStyle,
    //         textAlign: textAlign,
    //         textAlignVertical: textAlignVertical,
    //         textDirection: textDirection,
    //         readOnly: readOnly,
    //         showCursor: showCursor,
    //         autofocus: autofocus,
    //         obscuringCharacter: obscuringCharacter,
    //         obscureText: obscureText,
    //         autocorrect: autocorrect,
    //         smartDashesType: smartDashesType,
    //         smartQuotesType: smartQuotesType,
    //         enableSuggestions: enableSuggestions,
    //         maxLines: maxLines,
    //         minLines: minLines,
    //         expands: expands,
    //         maxLength: maxLength,
    //         maxLengthEnforcement: maxLengthEnforcement,
    //         onChanged: onChanged,
    //         onEditingComplete: onEditingComplete,
    //         onSubmitted: onSubmitted,
    //         onAppPrivateCommand: onAppPrivateCommand,
    //         inputFormatters: inputFormatters,
    //         enabled: enabled,
    //         cursorWidth: cursorWidth,
    //         cursorHeight: cursorHeight,
    //         cursorRadius: cursorRadius,
    //         cursorOpacityAnimates: cursorOpacityAnimates,
    //         cursorColor: cursorColor,
    //         keyboardAppearance: keyboardAppearance,
    //         scrollPadding: scrollPadding,
    //         dragStartBehavior: dragStartBehavior,
    //         selectionControls: selectionControls,
    //         onTap: onTap,
    //         onTapOutside: onTapOutside,
    //         mouseCursor: mouseCursor,
    //         buildCounter: buildCounter,
    //         scrollController: scrollController,
    //         scrollPhysics: scrollPhysics,
    //         autofillHints: autofillHints,
    //         contentInsertionConfiguration: contentInsertionConfiguration,
    //         clipBehavior: clipBehavior,
    //         restorationId: restorationId,
    //         scribbleEnabled: scribbleEnabled,
    //         enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
    //         contextMenuBuilder: contextMenuBuilder,
    //         canRequestFocus: canRequestFocus,
    //         spellCheckConfiguration: spellCheckConfiguration,
    //         magnifierConfiguration: magnifierConfiguration,
    //         enableInteractiveSelection: enableInteractiveSelection,
    //       );
    //     });
  }
}
