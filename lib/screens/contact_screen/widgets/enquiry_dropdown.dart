import 'package:flutter/material.dart';
import '../../../resources/app_colors.dart';

class EnquiryDropdown extends StatefulWidget {
  const EnquiryDropdown({super.key});

  @override
  State<EnquiryDropdown> createState() => _EnquiryDropdownState();
}

class _EnquiryDropdownState extends State<EnquiryDropdown> {
  final List<String> enquiryTypes = [
    'Advertising',
    'Partnership',
    'Support',
    'Feedback',
  ];

  String selectedType = 'Advertising';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ENQUIRY TYPE',
            style: textTheme.labelSmall!.copyWith(
              fontSize: 12.0,
              color: Colors.grey[700],
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.dividerColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                value: selectedType,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                style: textTheme.labelSmall,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedType = value;
                    });
                  }
                },
                items: enquiryTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
