import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:otoscopia/config/config.dart';
import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/guest/guest.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    return ApplicationContainer(
      child: CenterCard(
        child: SizedBox(
          width: 440,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Logo(height: 32),
              const Gap(16),
              const Text(kSignUp).fontSize(24),
              const Gap(12),
              const Text(kNotAvailable).fontSize(16),
              const Text(kEmail).textColor(AppColors.accentColor).fontSize(16),
              const Gap(12),
              const CustomHyperLink(kEmailNowBtn, to: kMailToBtn),
              const TextNavigator(kGoBackBtn, pop: true, bold: false)
            ],
          ),
        ),
      ),
    );
  }
}
