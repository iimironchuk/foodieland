import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/models/direction_model/cooking_step_model.dart';

import '../../../resources/app_colors.dart';

class DirectionsSection extends StatefulWidget {
  final List<CookingStepModel> steps;

  const DirectionsSection({super.key, required this.steps});

  @override
  State<DirectionsSection> createState() => _DirectionsSectionState();
}

class _DirectionsSectionState extends State<DirectionsSection> {
  late List<bool> _checkedList;

  @override
  void initState() {
    _checkedList = List<bool>.filled(widget.steps.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Directions',
          style: textTheme.labelMedium!.copyWith(fontSize: 36.0),
        ),
        // SizedBox(height: 48.0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.steps.length,
          itemBuilder: (context, index) {
            final step = widget.steps[index];
            if (step.type == StepBlockType.heading) {
              return Padding(
                padding: const EdgeInsets.only( top: 32.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      activeColor: Colors.black,
                      side: BorderSide(
                        color: AppColors.veryLightGrey,
                        width: 2.0,
                      ),
                      value: _checkedList[index],
                      onChanged: (value) {
                        setState(() {
                          _checkedList[index] = value!;
                        });
                      },
                    ),
                  ),
                  title: Text(
                    step.content,
                    style: textTheme.labelMedium!.copyWith(
                      color: _checkedList[index] == true
                          ? Color.fromRGBO(0, 0, 0, 0.6)
                          : Colors.black,
                      fontSize: 24.0,
                      decoration: _checkedList[index] == true
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
              );
            } else if (step.type == StepBlockType.image) {
              return AspectRatio(
                aspectRatio: 792 / 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: step.content,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else if (step.type == StepBlockType.paragraph) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Text(
                  step.content,
                  style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
