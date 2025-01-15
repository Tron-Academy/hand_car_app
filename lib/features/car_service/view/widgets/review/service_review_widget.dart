import 'package:flutter/material.dart';
import 'package:hand_car/core/extension/theme_extension.dart';

import 'package:hand_car/features/Accessories/view/widgets/accessories/progress_indicator_bar_widget.dart';
import 'package:hand_car/features/car_service/controller/rating/service_rating_controller.dart';
import 'package:hand_car/features/car_service/view/widgets/review/bottom_sheet_for_write_review_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


// class ServiceReviewWidget extends StatelessWidget {
//   final String serviceId;
//   final String serviceName;
//   final String? serviceImage;
//   final double rating;
//   final int totalReviews;
//   final List<int> starCounts;

//   const ServiceReviewWidget({
//     super.key,
//     required this.serviceId,
//     required this.serviceName,
//     this.serviceImage,
//     required this.rating,
//     required this.totalReviews,
//     required this.starCounts,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Service Ratings & Reviews',
//             style: context.typography.h3,
//           ),
//           SizedBox(height: context.space.space_100),
//           Text(
//             'Have a review about this service?',
//             style: context.typography.bodyLargeMedium,
//           ),
//           TextButton(
//             onPressed: () {
//                 showModalBottomSheet(
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(20)),
//                     ),
//                     context: context,
//                     builder: (context) =>  BottomSheetForWriteReviewWidget(
//                       serviceId: serviceId,
//                       serviceName: serviceName,
//                     )
//                     );
//             },
//             child: Text(
//               "Write here...",
//               style: context.typography.bodyLargeMedium.copyWith(
//                 color: const Color(0xff4069D8),
//               ),
//             ),
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 rating.toStringAsFixed(1),
//                 style: context.typography.h3,
//               ),
//               const SizedBox(width: 8),
//               Row(
//                 children: List.generate(
//                   5,
//                   (index) => Icon(
//                     index < rating.floor() ? Icons.star : Icons.star_border,
//                     color: Colors.amber,
//                     size: 24,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: context.space.space_100),
//           Text(
//             'Based on $totalReviews reviews',
//             style: context.typography.subtitle,
//           ),
//           SizedBox(height: context.space.space_200),
//           ...List.generate(
//             5,
//             (index) => _buildStarBar(5 - index, starCounts[4 - index], context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStarBar(int stars, int count, BuildContext context) {
//     final percentage = count / totalReviews;
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: context.space.space_50),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 16,
//             child: Text('$stars', style: context.typography.bodySemiBold),
//           ),
//           Icon(Icons.star, size: context.space.space_200, color: Colors.amber),
//           SizedBox(width: context.space.space_100),
//           Expanded(
//             child: CustomPaint(
//               size: Size(double.infinity, context.space.space_100),
//               painter: MultiColorProgressPainter(
//                 percentage: percentage,
//                 backgroundColor: Colors.grey[300]!,
//                 progressColor: stars >= 4 ? Colors.green : Colors.orange,
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           SizedBox(
//             width: 32,
//             child: Text(
//               '${(percentage * 100).toInt()}%',
//               style: const TextStyle(fontSize: 12),
//               textAlign: TextAlign.end,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class ServiceReviewWidget extends ConsumerWidget {
  final String serviceId;
  final String serviceName;
  final String? serviceImage;

  const ServiceReviewWidget({
    super.key,
    required this.serviceId,
    required this.serviceName,
    this.serviceImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingAsync = ref.watch(serviceRatingControllerProvider);

    return ratingAsync.when(
      data: (ratingList) {
        // Calculate star counts
        final starCounts = List<int>.filled(5, 0);
        for (var rating in ratingList.ratings) {
          if (rating.rating >= 1 && rating.rating <= 5) {
            starCounts[rating.rating - 1]++;
          }
        }

        final totalReviews = ratingList.ratings.length;
        final averageRating = ratingList.ratings.isEmpty 
          ? 0.0 
          : ratingList.ratings.fold(0, (sum, rating) => sum + rating.rating) / totalReviews;

        return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Service Ratings & Reviews',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Have a review about this service?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.2,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    context: context,
                    builder: (context) => BottomSheetForWriteReviewWidget(
                      serviceId: serviceId,
                      serviceName: serviceName,
                    ),
                  );
                },
                child: const Text(
                  "Write here...",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF4069D8),
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Icon(
                          index < averageRating.floor() 
                            ? Icons.star 
                            : Icons.star_border,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Based on $totalReviews reviews',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                5,
                (index) {
                  final starLevel = 5 - index;
                  final count = starCounts[4 - index];
                  final percentage = totalReviews > 0 
                    ? (count / totalReviews) * 100 
                    : 0.0;
                  
                  return _buildStarBar(
                    stars: starLevel,
                    percentage: percentage,
                    context: context,
                  );
                },
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: ${error.toString()}'),
      ),
    );
  }

  Widget _buildStarBar({
    required int stars,
    required double percentage,
    required BuildContext context,
  }) {
    final progressColor = stars >= 4 ? Colors.green[500] : Colors.orange[400];
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$stars',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: 8,
                color: Colors.grey[200],
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percentage / 100,
                  child: Container(
                    color: progressColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            child: Text(
              '${percentage.toInt()}%',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                height: 1.2,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}