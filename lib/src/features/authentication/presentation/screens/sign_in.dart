import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _form = SignInFormEntity();

  @override
  Widget build(BuildContext context) {
    return ApplicationContainer(
        child: FutureBuilder(
      future: getSchools(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }

        return CenterCard(
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
                  EmailTextInput(emailController: _form.emailController),
                  const Gap(16),
                  PasswordFormBox(
                    controller: _form.passwordController,
                    placeholder: kPassword,
                    onEditingComplete: onClick,
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
        );
      },
    ));
  }

  Button signInBtn() {
    return Button(
        child: const Text(kSignInBtn),
        onPressed: () async {
          if (_form.isValid) await onClick();
        });
  }

  Future<void> onClick() async {
    setState(() => isLoading = true);
    if (formKey.currentState!.validate()) {
      try {
        final response =
            await ref.read(authenticationProvider.notifier).login(_form);

        if (response.id.isNotEmpty) {
          await ref.read(fetchDataProvider.notifier).fetch(response);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          });
        }
      } on Exception catch (error) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => popUpInfoBar(
            kErrorTitle,
            error.toString(),
            context,
          ),
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  Future<bool> getSchools(WidgetRef ref) async {
    try {
      ref.read(fetchDataProvider.notifier).getSchools();
      return true;
    } catch (e) {
      return false;
    }
  }
}
