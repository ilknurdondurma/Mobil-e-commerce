import 'package:apigiris/UIhelper/constant/ui_colors.dart';
import 'package:flutter/material.dart';

class MyIconButtonWidget extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double size;
  final String? buttonText;
  final Function() onPressed;

  const MyIconButtonWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
    required this.onPressed,
    this.buttonText="",
  }) : super(key: key);

  @override
  State<MyIconButtonWidget> createState() => _MyIconButtonWidgetState();
}

class _MyIconButtonWidgetState extends State<MyIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: widget.color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              widget.icon,
              size: widget.size,
              color: Colors.black,
            ),
            onPressed: () => widget.onPressed(),
          ),
          SizedBox(width: 15,),
          Text(widget.buttonText!,style: TextStyle(
            fontSize: 20
          ),)
        ],
      ),
    );
  }
}