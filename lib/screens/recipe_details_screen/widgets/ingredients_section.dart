import 'package:flutter/material.dart';
import 'package:foodieland/models/ingredients_model/ingredients_model.dart';
import 'package:foodieland/resources/app_colors.dart';

class IngredientsSection extends StatefulWidget {
  final List<IngredientsModel> ingredients;

  const IngredientsSection({super.key, required this.ingredients});

  @override
  State<IngredientsSection> createState() => _IngredientsSectionState();
}

class _IngredientsSectionState extends State<IngredientsSection> {
  late List<bool> _checkedList;

  @override
  void initState() {
    _checkedList = List<bool>.filled(widget.ingredients.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: textTheme.labelMedium!.copyWith(fontSize: 36.0),
        ),
        // SizedBox(height: 48.0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.ingredients.length,
          itemBuilder: (context, index) {
            final ingredient = widget.ingredients[index];
            if (ingredient.type == 'heading') {
              return Padding(
                padding: const EdgeInsets.only(bottom: 32.0, top: 48.0),
                child: Text(
                  ingredient.text,
                  style: textTheme.labelMedium!.copyWith(fontSize: 24.0),
                ),
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          activeColor: Colors.black,
                          side: BorderSide(color: AppColors.veryLightGrey, width: 2.0),
                          value: _checkedList[index],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[index] = value!;
                            });
                          },
                        ),
                      ),
                      title: Text(
                        ingredient.text,
                        style: textTheme.labelMedium!.copyWith(
                          color: _checkedList[index] == true ? Color.fromRGBO(0, 0, 0, 0.6) : Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          decoration: _checkedList[index] == true
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Divider(color: AppColors.veryLightGrey),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
