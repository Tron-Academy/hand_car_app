import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hand_car/core/extension/theme_extension.dart';
import 'package:hand_car/features/Home/view/widgets/drawer_widget.dart';
import 'package:hand_car/features/SpareParts/view/widgets/product_search_container_widget.dart';
import 'package:hand_car/features/SpareParts/view/widgets/carousel_slider_for_genuine_spare_widget.dart';
import 'package:hand_car/features/SpareParts/view/widgets/spare_more_widget.dart';
import 'package:hand_car/gen/assets.gen.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SparesPage extends HookWidget {
  static const String routeName = 'spares';
  const SparesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: SvgPicture.asset(Assets.icons.handCarIcon),
        title: Text("Auto Parts", style: context.typography.h2),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ],
      ),
      drawer: const DrawerWidget(),
      endDrawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.space.space_200),
          child: Column(
            children: [
              Text(
                "Find best in quality ",
                style: context.typography.h3,
              ),
              Text(
                "spare parts for your drive",
                style: context.typography.h3,
              ),
              SizedBox(height: context.space.space_200),
              Text(
                "Reliable Performance, Guaranteed:",
                style: context.typography.buttonTxt,
              ),
              Text(
                "Discover top-tier spare parts engineered to ",
                style: context.typography.buttonTxt,
              ),
              Text(
                "elevate your driving experience. ",
                style: context.typography.buttonTxt,
              ),
              SizedBox(height: context.space.space_200),
              Image.asset(
                Assets.images.warehouseFemale.path,
              ),
              SizedBox(height: context.space.space_200),
              const ProductSearchContainerWidget(),
              SizedBox(height: context.space.space_200),
              SizedBox(
                height: context.space.space_200,
              ),
              Text("Why Choose Us?", style: context.typography.h3),
              SizedBox(height: context.space.space_200),
              const GenuinePartsSliderWidget(),
              SizedBox(height: context.space.space_200),
              SpareMoreWidget()
            ],
          ),
        ),
      ),
    );
  }
}