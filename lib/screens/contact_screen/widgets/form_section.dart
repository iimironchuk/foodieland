import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/app_colors.dart';
import 'custom_text_field.dart';
import 'enquiry_dropdown.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'Enter your name...',
                title: 'NAME',
                maxLines: 1,
                contentTopPadding: 20.0,
                contentBottomPadding: 20.0,
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: CustomTextField(
                hintText: 'Your email address...',
                title: 'EMAIL ADDRESS',
                maxLines: 1,
                contentTopPadding: 20.0,
                contentBottomPadding: 20.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.0),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'Enter subject...',
                title: 'SUBJECT',
                maxLines: 1,
                contentTopPadding: 20.0,
                contentBottomPadding: 20.0,
              ),
            ),
            SizedBox(width: 20.0),
            EnquiryDropdown(),
          ],
        ),
        SizedBox(height: 24.0),
        CustomTextField(
          contentTopPadding: 18.0,
          hintText: 'Enter your messages...',
          title: 'MESSAGES',
          maxLines: 6,
        ),
      ],
    );
  }
}
