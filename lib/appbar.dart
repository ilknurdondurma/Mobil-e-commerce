import 'package:apigiris/UIhelper/constant/ui_colors.dart';
import 'package:apigiris/UIhelper/constant/ui_text.dart';
import 'package:apigiris/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const MyAppBar({Key? key, this.title= UIText.appBarText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      actions: [IconButton(icon:Icon(Icons.shopping_cart,size: 35,),onPressed: ()=>Get.to(()=>CartScreen()),)],
      centerTitle: true,
      backgroundColor: UIColors.appBarBackgroundColor,
      // Diğer AppBar özelliklerini burada yapılandırabilirsiniz
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}