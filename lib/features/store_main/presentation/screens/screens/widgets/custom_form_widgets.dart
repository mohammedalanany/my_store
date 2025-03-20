import 'package:flutter/material.dart';

class MyCustomFormButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback onPressedEvent;
  final Color textColor;
  final double height;
  final double radius;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final double width;
  MyCustomFormButton(
      {Key? key,
      required this.onPressedEvent,
      this.buttonText,
      this.fontSize = 14.0,
      this.height = 48.0,
      this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
      this.radius = 4.0,
      this.textColor = Colors.white,
      this.backgroundColor = const Color(0xFF05B09C),
      this.width = 159.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
//      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: MaterialButton(
          padding: padding,
          disabledColor: Theme.of(context).primaryColor.withOpacity(0.5),
          onPressed: onPressedEvent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0,
          color: backgroundColor,
          child: AnimatedSwitcher(
            switchOutCurve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                FadeTransition(
              opacity: animation,
              child: child,
            ),
            switchInCurve: Curves.easeOut,
            child: Text(
              buttonText!,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
//                          fontWeight: FontWeight.normal,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomComboBox extends StatefulWidget {
  final ValueChanged? onChangedEvent;
  final Function? onTap;
  final int? value;
  final labelText;
  final BuildContext? context;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final List<DropdownMenuItem> items;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  MyCustomComboBox({
    this.value,
    this.onSaved,
    this.validator,
    this.labelText,
    this.onTap,
    this.items = const [
      DropdownMenuItem(
        value: 0,
        child: Text(
          '...',
          style: TextStyle(
              fontSize: 16.0,
              color: const Color(0x99FFFFFF),
              fontWeight: FontWeight.normal),
        ),
      ),
    ],
    this.onChangedEvent,
    this.suffixIcon,
    this.prefixIcon,
    this.context,
  });
  @override
  _MyCustomComboBoxState createState() => _MyCustomComboBoxState();
}

class _MyCustomComboBoxState extends State<MyCustomComboBox> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
      ),
      child: DropdownButtonFormField(
        // itemHeight: 100,
        iconEnabledColor: Color(0xFF000000),
        iconSize: 26,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).brightness == Brightness.dark
              ? Color(0xFF000000)
              : Color(0xFF000000),
          size: 23,
        ),
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              right: widget.prefixIcon == null ? 15.0 : 5.0,
              left: 15,
              top: 10,
              bottom: 10),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Color(0xFFFFFFFF)
              : Color(0xFFFFFFFF),
          //,
          enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
              //  borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color(0x29000000),
                  // style: BorderStyle.solid,
                  width: 1.0)),

          labelText: widget.labelText,
          focusColor: Theme.of(context).primaryColor,
          // floatingLabelBehavior: FloatingLabelBehavior.auto,
          //  focusedErrorBorder: OutlineInputBorder(
          //      borderRadius: BorderRadius.circular(8),
          //      borderSide: BorderSide(
          //          color:  Color(0xFFFF0000),
          //          width: 1.0)
          //  ),
          //  errorBorder: OutlineInputBorder(
          //      borderRadius: BorderRadius.circular(8),
          //      borderSide: BorderSide(
          //          color:  Color(0xFFFF0000),
          //          width: 1.0)
          //  ),
          //  errorStyle: TextStyle(color:  Color(0xFFFF0000),),
          border: OutlineInputBorder(
              // borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
              // borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color(0x29000000),
                  // style: BorderStyle.solid,
                  width: 1.0)),
          labelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF000000).withOpacity(.6),
            // height: 1.5,
            letterSpacing: .29,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
        ),

        //validator: widget.validator,
        onSaved: widget.onSaved,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChangedEvent,
        items: widget.items,
        value: widget.value,
        onTap: widget.onTap as void Function()?,
      ),
    );
  }
}

class MyCustomInput extends StatelessWidget {
  final String? labelText;
  final EdgeInsets containerMargin;
  final String? initialValue;
  final String? errorText;
  final Color labelColor;
  final bool expands;
  final FormFieldValidator<String>? validator;
  final int inputMaxLines;
  final bool enabled;
  final TextInputType? inputType;
  final EdgeInsets contentPadding;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final String? placeholder;
  final TextEditingController? textEditingController;
  final bool obsecureText;
  final bool readOnly;
  final Color cursorColor;
  final double inputSize;
  final String? helperText;
  final Color focusedBorderColor;

  final Widget? prefixIcon;

  final Widget? prefixWidget;

  final bool filledEnabled;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final bool autoFocus;
  final bool hasFocus;
  final BoxShadow? boxShadow;
  final FloatingLabelBehavior? floatingLabelBehavior;

  final Widget? suffixIcon;

  final BorderSide? border;

  final bool enableBorder;

  final EdgeInsets? padding;

  MyCustomInput(
      {this.labelText,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      this.onChanged,
      this.enabled = true,
      this.textInputAction,
      this.errorText,
      this.onSaved,
      this.textEditingController,
      this.expands = false,
      this.placeholder,
      this.initialValue,
      this.inputMaxLines = 1,
      this.containerMargin = const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      this.boxShadow,
      this.inputType,
      this.validator,
      this.prefixIcon,
      this.obsecureText = false,
      this.labelColor = const Color(0xFF05B09C),
      Key? key,
      this.prefixWidget,
      this.filledEnabled = true,
      this.hasFocus = false,
      this.focusNode,
      this.suffixIcon,
      this.border,
      this.enableBorder = false,
      this.autoFocus = false,
      this.onFieldSubmitted,
      this.textAlign = TextAlign.start,
      this.cursorColor = const Color(0xFF05B09C),
      this.inputSize = 15.0,
      this.helperText,
      this.floatingLabelBehavior,
      this.focusedBorderColor = const Color(0X99000000),
      this.padding,
      this.readOnly = false})
      : super(key: key);

  //  margin: containerMargin,
  //         height: 48,
  //         padding: EdgeInsets.only(
  //          // bottom: 5,
  //           top: 8,
  //         ),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(8),
  //               border: Border.all(
  //                 width: 1.0,
  //                 color:  hasFocus ? Color(0xBD000000) : Color(0x29000000),
  //               )
  //         ),

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin,
      child: TextFormField(
        focusNode: focusNode,
        expands: expands,
        textInputAction: textInputAction,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xDE000000),
          // height: 2,
          letterSpacing: .29,
          fontWeight: FontWeight.w600,
          fontFamily: 'Nunito',
        ),
        maxLines: inputMaxLines ?? 1,
        validator: validator,
        textAlign: textAlign,
        keyboardType: inputType,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: autoFocus,
        initialValue: initialValue,
        obscureText: obsecureText,
        onChanged: onChanged,
        onSaved: onSaved,
        enabled: enabled,
        readOnly: readOnly,
        controller: textEditingController,
        cursorColor: cursorColor,
        cursorHeight: 20,
        cursorWidth: 1.5,
        decoration: InputDecoration(
          contentPadding: padding,
          // floatingLabelBehavior:
          // floatingLabelBehavior ?? FloatingLabelBehavior.auto,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFFF0000),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          helperText: helperText ?? null,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: hasFocus ? Color(0xFF037979) : Color(0x29000000),
            ),
            borderRadius: BorderRadius.circular(8),
          ),

          labelStyle: TextStyle(
            fontSize: 16,
            color: Color(0x99000000),
            // height: 1.5,
            letterSpacing: .4,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
          hintStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF000000).withOpacity(.6),
            // height: 1.5,
            letterSpacing: .29,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
          hintText: placeholder,
          //  alignLabelWithHint: true,
          prefix: prefixWidget,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorText: errorText,
          enabledBorder: enableBorder
              ? UnderlineInputBorder(borderSide: BorderSide.none)
              : OutlineInputBorder(
                  // borderSide: BorderSide.none,
                  borderSide: BorderSide(
                    width: 1,
                    color: hasFocus ? Color(0xFF037979) : Color(0x29000000),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
          labelText: labelText,
          fillColor: Colors.white,
          filled: filledEnabled,
          border: enableBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide.none,
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: hasFocus ? Color(0xFF037979) : Color(0x29000000),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
        ),
      ),
    );
  }
}
// class MyCustomInput extends StatelessWidget {
//   final String labelText;
//   final EdgeInsets containerMargin;
//   final String initialValue;
//   final String errorText;
//   final Color labelColor;
//   final bool expands;
//   final FormFieldValidator<String> validator;
//   final int inputMaxLines;
//   final bool enabled;
//   final TextInputType inputType;
//   final EdgeInsets contentPadding;
//   final ValueChanged<String> onFieldSubmitted;
//   final TextInputAction textInputAction;
//   final ValueChanged<String> onChanged;
//   final FormFieldSetter<String> onSaved;
//   final String placeholder;
//   final TextEditingController textEditingController;
//   final bool obsecureText;
//   final bool readOnly;
//   final Color cursorColor;
//   final double inputSize;
//   final String helperText;
//   final Color focusedBorderColor;
//
//   final Widget prefixIcon;
//
//   final Widget prefixWidget;
//
//   final bool filledEnabled;
//   final FocusNode focusNode;
//   final TextAlign textAlign;
//   final bool autoFocus;
//   final bool hasFocus;
//   final BoxShadow boxShadow;
//   final FloatingLabelBehavior floatingLabelBehavior;
//
//   final Widget suffixIcon;
//
//   final BorderSide border;
//
//   final bool enableBorder;
//
//   final EdgeInsets padding;
//
//   MyCustomInput({
//     this.labelText,
//     this.contentPadding =
//     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
//     this.onChanged,
//     this.enabled = true,
//     this.textInputAction,
//     this.errorText,
//     this.onSaved,
//     this.textEditingController,
//     this.expands = false,
//     this.placeholder,
//     this.initialValue,
//     this.inputMaxLines = 1,
//     this.containerMargin = const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
//     this.boxShadow,
//     this.inputType,
//     this.validator,
//     this.prefixIcon,
//     this.obsecureText = false,
//     this.labelColor = const Color(0xFF05B09C),
//     Key key,
//     this.prefixWidget,
//     this.filledEnabled = true,
//     this.hasFocus = false,
//     this.focusNode,
//     this.suffixIcon,
//     this.border,
//     this.enableBorder = false,
//     this.autoFocus = false,
//     this.onFieldSubmitted,
//     this.textAlign = TextAlign.start,
//     this.cursorColor = const Color(0xFF05B09C),
//     this.inputSize = 15.0,
//     this.helperText,
//     this.floatingLabelBehavior,
//     this.focusedBorderColor = const Color(0X99000000),
//     this.padding,
//     this.readOnly = false
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         margin: containerMargin,
//         height: 48,
//         padding: EdgeInsets.only(
//          // bottom: 5,
//           top: 8,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 width: 1.0,
//                 color:  hasFocus ? Color(0xBD000000) : Color(0x29000000),
//               )
//         ),
//         child: TextFormField(
//           focusNode:focusNode ,
//           expands: expands,
//           textInputAction: textInputAction,
//           style: TextStyle(
//             fontSize: 16,
//             color:  Color(0xDE000000),
//             // height: 2,
//             letterSpacing: .29,
//             fontWeight: FontWeight.w600,
//             fontFamily: 'Nunito',
//           ),
//           maxLines: inputMaxLines ?? 1,
//           validator: validator,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           textAlign: textAlign,
//           keyboardType: inputType,
//           onFieldSubmitted: onFieldSubmitted,
//           autofocus: autoFocus,
//           initialValue: initialValue,
//           obscureText: obsecureText,
//           onChanged: onChanged,
//           onSaved: onSaved,
//           readOnly: readOnly,
//           controller: textEditingController,
//           cursorColor: cursorColor,cursorHeight: 20,cursorWidth: 1.5,
//           decoration: InputDecoration(
//             contentPadding: padding,
//             // floatingLabelBehavior:
//             // floatingLabelBehavior ?? FloatingLabelBehavior.auto,
//             helperText: helperText ?? null,
// //          focusedBorder: OutlineInputBorder(
// //            borderRadius: BorderRadius.circular(4.0),
// //            borderSide: BorderSide(
// //              width: 2.0,
// //              color: Theme.of(context).accentColor,
// //            ),
// //          ),
//
//             labelStyle: TextStyle(
//             fontSize: 16,
//             color:  Color(0x99000000),
//             // height: 1.5,
//             letterSpacing: .4,
//             fontWeight: FontWeight.w600,
//             fontFamily: 'Nunito',
//           ),
//             hintStyle: TextStyle(
//               fontSize: 16,
//               color:  Color(0xFF000000).withOpacity(.6),
//               // height: 1.5,
//               letterSpacing: .29,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'Nunito',
//             ),
//             hintText: placeholder,
//           //  alignLabelWithHint: true,
//             prefix: prefixWidget,
//             suffixIcon: suffixIcon,
//             prefixIcon: prefixIcon,
//             errorText: errorText,
//             enabled: enabled,
//             enabledBorder: enableBorder
//                 ? UnderlineInputBorder(
//                 borderSide: BorderSide.none)
//                 : OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             labelText: labelText,
//             fillColor:   Colors.white,
//             filled: filledEnabled,
//             border: enableBorder
//                 ? UnderlineInputBorder(
//               borderSide: BorderSide.none,
//             )
//                 : OutlineInputBorder(
//                borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
