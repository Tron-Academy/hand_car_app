import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hand_car/core/extension/theme_extension.dart';
import 'package:hand_car/core/utils/bottom_nav_controller.dart';
import 'package:hand_car/features/Accessories/view/pages/accessories_page.dart';
import 'package:hand_car/features/Home/view/pages/home_page.dart';
import 'package:hand_car/features/Home/view/widgets/drawer_widget.dart';
import 'package:hand_car/features/SpareParts/view/pages/spares_page.dart';
import 'package:hand_car/features/Subscriptions/view/pages/subscription_page.dart';
import 'package:hand_car/features/car_service/view/pages/services_page.dart';
import 'package:hand_car/gen/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Navigation Page
class NavigationPage extends HookConsumerWidget {
  static const String route = '/navigation';

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// Get the navigation state from the provider.
    final navigationState = ref.watch(navigationProvider);

    // Listen for page changes and update the provider.
    useEffect(() {
      navigationState.pageController.addListener(() {
        if (navigationState.pageController.page != null) {
          ref.read(navigationProvider.notifier).changeSelectedItemIndex(
              navigationState.pageController.page!.round());
        }
      });
      return () => navigationState.pageController.dispose();
    }, const []);

    // Ensure the controller jumps to the correct page after being built.
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (navigationState.pageController.hasClients) {
          navigationState.pageController
              .jumpToPage(navigationState.selectedNavBarItemIndex);
        }
      });
      return null;
    }, [navigationState.selectedNavBarItemIndex]);

    return Scaffold(
      drawer: const DrawerWidget(),
      body: PageView(
        controller: navigationState.pageController,
        children: [
          /// Auto Parts Page
          const AutoPartsPage(),

          /// Accessories Page
          const AccessoriesPage(),

          /// Home Page
          const HomePage(),

          /// Services Page
          ServicesPage(),

          /// Subscription Page
          const SubscriptionPage()
        ],

        /// Change the selected item index when the page changes
        onPageChanged: (index) => ref
            .read(navigationProvider.notifier)
            .changeSelectedItemIndex(index),
      ),

      /// Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.colors.primary,
        unselectedItemColor: context.colors.primaryTxt,
        selectedLabelStyle: context.typography.body,
        unselectedLabelStyle: context.typography.bodySmall,
        type: BottomNavigationBarType.fixed,
        // / Set the selected item index
        currentIndex: navigationState.selectedNavBarItemIndex,
        // / Update the selected item index
        onTap: (int index) => ref
            .read(navigationProvider.notifier)
            .changeSelectedItemIndex(index),
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navigationState.selectedNavBarItemIndex == 0
                  ? 'assets/icons/ic_spare_filled.svg'
                  : 'assets/icons/ic_spare_outline.svg',
              height: 30,
              colorFilter: navigationState.selectedNavBarItemIndex == 0
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Auto Parts',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navigationState.selectedNavBarItemIndex == 1
                  ? 'assets/icons/ic_car_seat_filled.svg'
                  : 'assets/icons/ic_car_seat_outline.svg',
              height: 30,
              colorFilter: navigationState.selectedNavBarItemIndex == 1
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Accessories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navigationState.selectedNavBarItemIndex == 2
                  ? Assets.icons.garageFilled
                  : Assets.icons.garage,
              height: 30,
              colorFilter: navigationState.selectedNavBarItemIndex == 2
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navigationState.selectedNavBarItemIndex == 3
                  ? 'assets/icons/ic_car_service_filled.svg'
                  : 'assets/icons/ic_car_service_outline.svg',
              height: 30,
              colorFilter: navigationState.selectedNavBarItemIndex == 3
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navigationState.selectedNavBarItemIndex == 4
                  ? 'assets/icons/ic_subscription_filled.svg'
                  : 'assets/icons/ic_subscription_outline.svg',
              height: 30,
              colorFilter: navigationState.selectedNavBarItemIndex == 4
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Subscription',
          ),
        ],
      ),
    );
  }
}
