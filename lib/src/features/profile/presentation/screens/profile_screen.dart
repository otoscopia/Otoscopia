import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/profile/presentation/widgets/widgets.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mfa = ref.read(userProvider).mfaFactors;

    return DoubleCard(
      scroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText('Accounts', style: 1),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UserInformation(),
              Row(
                children: [
                  Icon(mfa ? FluentIcons.shield_solid : FluentIcons.shield),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText("Security Status", style: 5),
                      CustomText(mfa ? "Secured" : "Unsecured"),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Gap(32),
          const WidgetExpander(
            icon: FluentIcons.account_management,
            title: "User Information",
            subtitle: "View or Modify your Information",
            content: UserAccount(),
          ),
          const Gap(4),
          const WidgetExpander(
            icon: FluentIcons.lightning_secure,
            title: "Account Security & Notification",
            subtitle: "Modify your Security and Notification Settings",
            content: AccountSecurity(),
          ),
        ],
      ),
    );
  }
}
