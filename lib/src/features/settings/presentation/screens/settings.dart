import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';
import 'package:otoscopia/src/features/settings/settings.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoubleCard(
      scroll: ref.watch(fontSizeProvider) >= 1.1 ? true : false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(kSettings, style: 1),
          const Gap(8),
          ListTile(
            title: const CustomText(kDarkMode),
            subtitle: const CustomText(kToggleDarkMode, style: 3),
            trailing: ToggleSwitch(
              checked: ref.watch(themeProvider) == ThemeMode.dark,
              onChanged: (value) =>
                  ref.read(themeProvider.notifier).toggleTheme(),
            ),
          ),
          ListTile(
            title: const CustomText(kFontSize),
            subtitle: const CustomText(kChangeFontSize, style: 3),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(kSM),
                const Gap(12),
                Slider(
                  value: ref.watch(fontSizeProvider),
                  onChanged: (value) =>
                      ref.read(fontSizeProvider.notifier).changeFontSize(value),
                  min: 0.5,
                  max: 2.0,
                  divisions: 10,
                ),
                const Gap(12),
                const CustomText(kLG),
              ],
            ),
          ),
          const ListTile(
            title: CustomText(kApplicationStorage),
            subtitle:
                CustomText(kChangeApplicationStorage, style: 3),
            // trailing: IconButton(
            //   icon: const Icon(Icons.folder),
            //   onPressed: () => ref
            //       .read(applicationStorageProvider.notifier)
            //       .changeApplicationStorage(),
            // ),
          ),
          const ListTile(
            title: CustomText(kCache),
            subtitle: CustomText(kClearCache, style: 3),
            // trailing: IconButton(
            //   icon: const Icon(Icons.delete),
            //   onPressed: () => ref.read(cacheProvider.notifier).clearCache(),
            // ),
          ),
          const ListTile(
            title: CustomText(kEnableEmailNotifications),
            subtitle: CustomText(kToggleEmailNotifications, style: 3),
            // trailing: ToggleSwitch(
            //   checked: ref.watch(emailNotificationsProvider),
            //   onChanged: (value) =>
            //       ref.read(emailNotificationsProvider.notifier).toggleEmail(),
            // ),
          ),
          const ListTile(
            title: CustomText(kEnablePinLock),
            subtitle: CustomText(kTogglePinLock, style: 3),
            // trailing: ToggleSwitch(
            //   checked: ref.watch(pinLockProvider),
            //   onChanged: (value) =>
            //       ref.read(pinLockProvider.notifier).togglePinLock(),
            // ),
          ),
          const ListTile(
            title: CustomText(kMasterPassword),
            subtitle: CustomText(kChangeMasterPassword, style: 3),
            // trailing: IconButton(
            //   icon: const Icon(Icons.lock),
            //   onPressed: () => ref
            //       .read(masterPasswordProvider.notifier)
            //       .changeMasterPassword(),
            // ),
          ),
          const ListTile(
            title: CustomText(kAccountPassword),
            subtitle: CustomText(kChangeAccountPassword, style: 3),
            // trailing: IconButton(
            //   icon: const Icon(Icons.lock),
            //   onPressed: () => ref
            //       .read(accountPasswordProvider.notifier)
            //       .changeAccountPassword(),
            // ),
          ),
        ],
      ),
    );
  }
}
