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

  String get email => emailController.text;
  String get password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return ApplicationContainer(
      child: CenterCard(
        child: Form(
          key: formKey,
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
                EmailTextInput(emailController: emailController),
                const Gap(16),
                PasswordFormBox(
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
                    if (!isLoading) signInBtn() else const ProgressRing(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Button signInBtn() {
    return Button(
        child: const Text(kSignInBtn),
        onPressed: () async {
          await onClick();
        });
  }

  Future<void> onClick() async {
    setState(() => isLoading = true);
    if (formKey.currentState!.validate()) {
      try {
        bool response = await ref
            .read(authenticationProvider.notifier)
            .login(email, password);

        if (response) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          });
        }
      } on Exception catch (error) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => popUpInfoBar(
            "Log in failed",
            error.toString(),
            context,
          ),
        );
      }
    }
    setState(() => isLoading = false);
  }
}
