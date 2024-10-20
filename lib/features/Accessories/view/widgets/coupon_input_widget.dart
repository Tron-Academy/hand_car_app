import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hand_car/core/extension/theme_extension.dart';
import 'package:hand_car/core/widgets/button_widget.dart';

class CouponInputSection extends HookWidget {
  final TextEditingController controller;

  const CouponInputSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.space.space_200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do you have any Coupon code ?',
            style: context.typography.bodyLarge,
          ),
          SizedBox(height: context.space.space_100),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter code here',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: context.space.space_200),
              ButtonWidget(label: "Apply", onTap: () {})
            ],
          ),
        ],
      ),
    );
  }
}

