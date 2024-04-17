import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/profile/presentation/widgets/widgets.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DoubleCard(
      scroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('Accounts', style: 1),
          Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserInformation(),
              Row(
                children: [
                  Icon(FluentIcons.shield),
                  Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("Security Status", style: 5),
                      CustomText("Unsecured"),
                    ],
                  )
                ],
              ),
            ],
          ),
          Gap(32),
          WidgetExpander(
            icon: FluentIcons.account_management,
            title: "User Information",
            subtitle: "View or Modify your Information",
            content: UserAccount(),
          ),
          Gap(4),
          WidgetExpander(
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
