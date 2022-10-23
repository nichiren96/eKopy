import 'package:flutter/material.dart';
import 'package:ekopy/src/helpers/view_helper.dart';

class Input extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final Function onChanged;
  final Function? togglePassword;

  const Input(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.onChanged,
      this.togglePassword,
      this.isPassword = false})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          spacing(vertical: 8),
          TextField(
            obscureText: widget.isPassword,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(widget.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => setState(() {
                        widget.togglePassword!();
                        print("INSSIDE INPUT");
                      }),
                    )
                  : SizedBox(),
              fillColor: Colors.white,
              filled: true,
              hintText: widget.placeholder,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (String value) => widget.onChanged(value),
          ),
        ],
      ),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 20,
          offset: Offset(10, 5),
        )
      ]),
    );
  }
}
