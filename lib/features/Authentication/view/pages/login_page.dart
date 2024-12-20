import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hand_car/core/extension/theme_extension.dart';
import 'package:hand_car/core/widgets/button_widget.dart';
import 'package:hand_car/gen/assets.gen.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  static const route = 'login_page';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //controller
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.space.space_200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(Assets.icons.handCarIcon),
            ),
            SizedBox(height: context.space.space_200),
            Center(
              child: Text(
                "Login or signup with email or\nmobile number",
                style: context.typography.h3,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: context.space.space_200),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.space.space_200),
              child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email or Mobile Number',
                    prefixIcon: Icon(Icons.person),
                  )),
            ),
            SizedBox(height: context.space.space_200),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.space.space_200),
              child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ButtonWidget(
                      label: "Generate OTP",
                      onTap: () {
                        // if (controller.text.isNotEmpty) {
                        //   ref
                        //       .read(loginWithOtpControllerProvider.notifier)
                        //       .sendOtp(controller.text);
                        //   context.go('/otp');
                        // } else {
                        //   SnackbarUtil.showsnackbar(
                        //       message: "Enter Email or Mobile Number",
                        //       showretry: true);
                        // }
                      })),
            ),
            SizedBox(height: context.space.space_200),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "By signing in you are agreeing to handcar’s \nTerms of use and Privacy policy",
                style: context.typography.bodySemiBold
                    .copyWith(color: const Color(0xff7A7A7A)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
