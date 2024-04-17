import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/profile/profile.dart';

class UserAccount extends ConsumerStatefulWidget {
  const UserAccount({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAccountState();
}

class _UserAccountState extends ConsumerState<UserAccount> {
  final _controllers = UserAccountControllers();

  @override
  void initState() {
    final user = ref.read(userProvider);

    _controllers.update(
      name: user.name,
      email: user.email,
      phone: user.phone,
      address: user.workAddress,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
      ],
    );
  }
}
