import 'package:flutter/material.dart';
import 'package:hand_car/core/extension/theme_extension.dart';
import 'package:hand_car/features/car_service/controller/location/location_list/location_list.dart';
import 'package:hand_car/features/car_service/model/service_model.dart';
import 'package:hand_car/features/car_service/view/widgets/grid_view_service_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationBasedGridView extends HookConsumerWidget {
  final List<ServiceModel> services;
  final String categoryName;

  const LocationBasedGridView({
    super.key,
    required this.services,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesState = ref.watch(servicesNotifierProvider);
    // final showNearbyServices = useState(false);

    // Filter services by category
    final filteredByCategory = services
        .where((service) => service.serviceCategory == categoryName)
        .toList();

    if (servicesState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (servicesState.error != null) {
      return Center(
        child: Text(
          servicesState.error!,
          style: context.typography.bodyLarge,
        ),
      );
    }

    // If we have nearby services, filter and sort them
    if (servicesState.services.isNotEmpty) {
      final nearbyServices = filteredByCategory.where((service) {
        final matchingService = servicesState.services.firstWhere(
          (nearbyService) => nearbyService.vendorName == service.vendorName,
          orElse: () => service,
        );
        return matchingService.distance != null;
      }).toList();

      // Sort by distance
      nearbyServices.sort((a, b) {
        final distanceA = servicesState.services
                .firstWhere(
                  (s) => s.vendorName == a.vendorName,
                  orElse: () => a,
                )
                .distance ??
            double.infinity;

        final distanceB = servicesState.services
                .firstWhere(
                  (s) => s.vendorName == b.vendorName,
                  orElse: () => b,
                )
                .distance ??
            double.infinity;

        return distanceA.compareTo(distanceB);
      });

      if (nearbyServices.isEmpty) {
        return Center(
          child: Text(
            'No $categoryName services available in the selected location',
            style: context.typography.bodyLarge,
            textAlign: TextAlign.center,
          ),
        );
      }

      return GridViewServicesWidget(
        services: nearbyServices,
        locationServices: servicesState.services,
      );
    }

    // If no location selected or no nearby services, show all services
    if (filteredByCategory.isEmpty) {
      return Center(
        child: Text(
          'No $categoryName services available',
          style: context.typography.bodyLarge,
          textAlign: TextAlign.center,
        ),
      );
    }

    return GridViewServicesWidget(
      services: filteredByCategory,
      locationServices: const [],
    );
  }
}
