import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:once_power/widgets/base/base_input.dart';

class DialogBaseInput extends StatefulWidget {
  const DialogBaseInput({
    super.key,
    this.enable = true,
    required this.value,
    this.hintText = '',
    this.autofocus = false,
    this.inputFormatters,
    required this.onChanged,
  });

  final bool enable;
  final String value;
  final String hintText;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChanged;

  @override
  State<DialogBaseInput> createState() => _DialogBaseInputState();
}

class _DialogBaseInputState extends State<DialogBaseInput> {
  late TextEditingController controller;
  bool show = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value)
      ..addListener(() {
        if (controller.text.isNotEmpty) {
          show = true;
        } else {
          show = false;
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onClear() {
    controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      enable: widget.enable,
      controller: controller,
      autofocus: widget.autofocus,
      showClear: show,
      onClear: onClear,
      hintText: widget.hintText,
      inputFormatters: widget.inputFormatters,
      maxLines: 1,
      onChanged: widget.onChanged,
    );
  }
}
