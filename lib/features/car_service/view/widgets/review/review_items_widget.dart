import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hand_car/core/extension/theme_extension.dart';

// ReviewItemsWidget For Show In Details Page
class ReviewItemsWidget extends StatelessWidget {
   final String username;
  final String comment;
  final int rating;

  const ReviewItemsWidget({
    super.key,
    required this.username,
    required this.rating,

    required this.comment,
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Circle Avatar for Username
              CircleAvatar(child: Text(username[0])),
              SizedBox(width: context.space.space_100),
              // Username
              Text(username),
              const Spacer(),
              SizedBox(width: context.space.space_100),
            ],
          ),
          SizedBox(height: context.space.space_100),
          // Date
       
          SizedBox(height: context.space.space_100),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: index < rating ? Colors.amber : Colors.grey,
              ),
            ),
          ),
          SizedBox(height: context.space.space_100),
          // Comment
          Text(
            comment,
            style: context.typography.bodySemiBold,
          ),
          SizedBox(height: context.space.space_100),
          // Review
       
          SizedBox(height: context.space.space_200),
          // Grid view for multiple images
         
        ],
      ),
    );
  }
}
