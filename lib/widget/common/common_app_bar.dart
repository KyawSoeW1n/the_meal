import 'package:flutter/material.dart';
import 'package:the_meal/widget/common/text_view_widget.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionList;

  const CommonAppBar(this.title, {this.actionList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextViewWidget(
        title,
      ),
      actions: actionList,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
