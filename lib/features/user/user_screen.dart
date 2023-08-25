import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal/features/user/user_notifier.dart';
import 'package:the_meal/widget/common/text_view_widget.dart';

import '../../core/base/base_view.dart';
import '../../core/resource/app_dimens.dart';
import '../../widget/common/common_app_bar.dart';
import '../../widget/common/common_elevated_button_widget.dart';

class UserScreen extends BaseView {
  @override
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {
    return const CommonAppBar(
      "User",
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final userNameTextEditingController = useTextEditingController();
    final userProvider = ref.watch(userNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(
        AppDimens.margin16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          userProvider.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            error: (e) => const TextViewWidget("Error"),
            success: (content) {
              userNameTextEditingController.text = content ?? "";
              return TextViewWidget(content ?? "");
            },
          ),
          TextField(
            controller: userNameTextEditingController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CommonElevatedButtonWidget(
                  onPressed: () {
                    ref.read(userNotifierProvider.notifier).getUserData();
                  },
                  text: "Get",
                ),
              ),
              const SizedBox(
                width: AppDimens.margin16,
              ),
              Expanded(
                child: CommonElevatedButtonWidget(
                  onPressed: () {
                    ref.read(userNotifierProvider.notifier).setUserData(
                        userNameTextEditingController.text.toString().trim());
                  },
                  text: "Save",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
