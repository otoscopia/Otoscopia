import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/guest/guest.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  double scale = 1;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ApplicationContainer(
      child: Center(
        child: Card(
          padding: const EdgeInsets.all(44),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                width: 440,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Logo(height: 32),
                    const Gap(16),
                    const Text(kSignIn).fontSize(24),
                    const Gap(12),
                    TextBox(
                      controller: emailController,
                      placeholder: kEmailAddress,
                    ),
                    const Gap(16),
                    PasswordBox(
                      controller: passwordController,
                      placeholder: kPassword,
                    ),
                    const Gap(16),
                    const TextNavigator(
                      kNoAccount,
                      bold: false,
                      child: NamedGuest.register,
                    ),
                    const TextNavigator(
                      kAccountNotAccessible,
                      bold: false,
                      child: NamedGuest.forgotPassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(child: const Text(kSignInBtn), onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
