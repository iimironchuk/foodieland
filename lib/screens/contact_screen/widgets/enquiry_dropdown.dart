import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/contact_screen/contact_screen_providers/contact_screen_providers.dart';
import '../../../resources/app_colors.dart';

class EnquiryDropdown extends ConsumerStatefulWidget {
  const EnquiryDropdown({super.key});

  @override
  ConsumerState<EnquiryDropdown> createState() => _EnquiryDropdownState();
}

class _EnquiryDropdownState extends ConsumerState<EnquiryDropdown> {
  final List<String> enquiryTypes = [
    'Advertising',
    'Partnership',
    'Support',
    'Feedback',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final selectedType = ref.watch(contactEnquiryProvider);
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
                    ref.read(contactEnquiryProvider.notifier).state = value;

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
