import 'package:flutter/material.dart';

class TermsUI extends StatefulWidget {
  bool _value = false;
   TermsUI({
    @required this.width,
   
  });

  final double width;
  

  @override
  _TermsUIState createState() => _TermsUIState();
}

class _TermsUIState extends State<TermsUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.06),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget._value = !widget._value;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xffedeef6)),
                  color: (widget._value) ? Colors.blue : Color(0xffedeef6)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: widget._value
                    ? Icon(
                        Icons.check,
                        size: 16.0,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: 16.0,
                        color: Color(0xffedeef6),
                      ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'I agree the Terms and Conditions',
            style: TextStyle(
                color: Colors.grey[600].withOpacity(0.8), fontSize: 15),
          )
        ],
      ),
    );
  }
}
