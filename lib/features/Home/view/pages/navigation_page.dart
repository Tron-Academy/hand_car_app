import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hand_car/core/extension/theme_extension.dart';
import 'package:hand_car/gen/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationPage extends HookConsumerWidget {
  static const String route = '/navigation';
  final StatefulNavigationShell navigationShell;

  const NavigationPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, ref) {
    final navBarIndex = useState(navigationShell.currentIndex); // Use the current index from navigationShell

    // Function to handle tab switching
    void onItemTapped(int index) {
      navBarIndex.value = index;
      navigationShell.goBranch(index);
    }

    // useEffect hook to listen to the GoRouter's current location and update the BottomNavigationBar
   
    // Listen for route changes and update the navBarIndex
    useEffect(() {
      void listener() {
        final router = GoRouter.of(context);
        final location = router.location;
        
        if (location != null) {
          if (location.startsWith('/spares')) {
            navBarIndex.value = 0;
          } else if (location.startsWith('/accessories')) {
            navBarIndex.value = 1;
          } else if (location.startsWith('/home')) {
            navBarIndex.value = 2;
          } else if (location.startsWith('/services')) {
            navBarIndex.value = 3;
          } else if (location.startsWith('/subscription')) {
            navBarIndex.value = 4;
          }
        }
      }

      final router = GoRouter.of(context);
      router.addListener(listener);
      
      // Call the listener once to set the initial state
      listener();
      
      return () {
        router.removeListener(listener);
      };
    }, []);

    return Scaffold(
      body: navigationShell, // Display the navigation shell content
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.colors.primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: navBarIndex.value,
        onTap: onItemTapped,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navBarIndex.value == 0
                  ? Assets.icons.icSpareFilled
                  : Assets.icons.icSpareOutline,
              height: 30,
              colorFilter: navBarIndex.value == 0
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Spares',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navBarIndex.value == 1
                  ? Assets.icons.icCarSeatFilled
                  : Assets.icons.icCarSeatOutline,
              height: 30,
              colorFilter: navBarIndex.value == 1
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Accessories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navBarIndex.value == 2
                  ? Assets.icons.icHomeFilled
                  : Assets.icons.icHomeOutline,
              height: 30,
              colorFilter: navBarIndex.value == 2
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navBarIndex.value == 3
                  ? Assets.icons.icCarServiceFilled
                  : Assets.icons.icCarServiceOutline,
              height: 30,
              colorFilter: navBarIndex.value == 3
                  ? ColorFilter.mode(context.colors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      context.colors.containerShadow, BlendMode.srcIn),
            ),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navBarIndex.value == 4
                  ? Assets.icons.icSubscriptionFilled
                  : Assets.icons.icSubscriptionOutline,
              height: 30,
              colorFilter: navBarIndex.value == 4
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

extension on GoRouter {
   get location => null;

  void addListener(void Function() listener) {}
  
  removeListener(void Function() listener) {}
}