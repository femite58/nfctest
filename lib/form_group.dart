import 'package:flutter/material.dart';

import 'theme.dart';

class FormGroup extends StatefulWidget {
  const FormGroup({
    super.key,
    required this.focusNode,
    this.label = '',
    this.onSaved,
    this.validFunc,
    this.onSubmit,
    this.isPassword = false,
    this.errMsg,
    this.onTap,
    this.mb = 15,
    this.toggler,
    this.onChanged,
    this.keybType,
    this.padding,
    this.readonly = false,
    this.initialVal,
    this.controller,
    this.hint,
    this.textarea = false,
    this.height = 60,
    this.bg,
  });
  final FocusNode focusNode;
  final String label;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validFunc;
  final Function(String?)? onSubmit;
  final bool isPassword;
  final String? errMsg;
  final VoidCallback? onTap;
  final double mb;
  final Widget? toggler;
  final TextInputType? keybType;
  final EdgeInsetsGeometry? padding;
  final bool readonly;
  final bool textarea;
  final String? initialVal;
  final String? hint;
  final TextEditingController? controller;
  final double height;
  final Color? bg;

  @override
  State<FormGroup> createState() => _FormGroupState();
}

class _FormGroupState extends State<FormGroup> with TickerProviderStateMixin {
  late Animation<Offset> _position;
  late AnimationController _posCtrl;
  late Animation<double> _scale;
  TextEditingController _txtCtrl = TextEditingController();
  @override
  void dispose() {
    widget.focusNode.dispose();
    _posCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    widget.focusNode.addListener(() {
      setState(() {});
    });
    _posCtrl = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 400,
        ));
    _position = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -.7)).animate(
      CurvedAnimation(
        parent: _posCtrl,
        curve: Curves.ease,
      ),
    );
    _scale = Tween<double>(begin: 1, end: .84).animate(
      CurvedAnimation(
        parent: _posCtrl,
        curve: Curves.ease,
      ),
    );
    super.initState();
  }

  bool _isFocused() {
    return widget.focusNode.hasFocus ||
        (widget.controller ?? _txtCtrl).text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (_isFocused()) {
      _posCtrl.forward();
    } else {
      _posCtrl.reverse();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: widget.textarea ? 115 : widget.height,
              decoration: BoxDecoration(
                color: widget.errMsg == null || widget.errMsg!.isEmpty
                    ? widget.bg ??
                        (widget.readonly
                            ? const Color(0xFFF7F7F7)
                            : Colors.white)
                    : const Color(0x06FF0000),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.errMsg == null || widget.errMsg!.isEmpty
                      ? widget.focusNode.hasFocus
                          ? AppTheme.appColor
                          : const Color(0xFFE8E8E8)
                      : const Color(0xFFFF0000),
                ),
              ),
            ),
            Positioned(
              top: widget.height / 2,
              left: 18,
              child: FractionalTranslation(
                translation: Offset(0, -.5),
                child: SlideTransition(
                  position: _position,
                  child: ScaleTransition(
                    scale: _scale,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.hint as String,
                      style: TextStyle(
                        color: AppTheme.greyTxt,
                        fontSize: AppTheme.fontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              padding:
                  widget.padding ?? const EdgeInsets.symmetric(horizontal: 18),
              alignment:
                  widget.textarea ? Alignment.topCenter : Alignment.center,
              height: widget.textarea ? 115 : widget.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    height: _isFocused() ? 12 : 0,
                    duration: const Duration(milliseconds: 400),
                  ),
                  TextFormField(
                    focusNode: widget.focusNode,
                    obscureText: widget.isPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: widget.onSubmit,
                    onSaved: widget.onSaved,
                    readOnly: widget.readonly,
                    controller: widget.controller ?? _txtCtrl,
                    keyboardType: widget.keybType,
                    validator: widget.validFunc,
                    maxLines: widget.textarea ? 5 : 1,
                    onTap: widget.onTap,
                    initialValue: widget.initialVal,
                    onChanged: widget.onChanged,
                    style: const TextStyle(
                      fontSize: AppTheme.fontSize,
                      // fontWeight: FontWeight.w500,
                      color: AppTheme.bodyColorDark,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.toggler != null)
              Positioned(
                top: widget.height * .5,
                right: 5,
                child: FractionalTranslation(
                    translation: const Offset(0, -0.5),
                    child: widget.toggler as Widget),
              ),
          ],
        ),
        if (widget.errMsg != null && widget.errMsg!.isNotEmpty) ...[
          const SizedBox(height: 5),
          Text(
            '${widget.errMsg}',
            style: const TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 13,
            ),
          ),
        ],
        SizedBox(height: widget.mb),
      ],
    );
  }
}
