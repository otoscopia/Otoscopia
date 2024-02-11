import 'package:flutter/services.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final _form = SignUpFormEntity();

  final roles = accountRole
      .map((item) => ComboBoxItem(value: item, child: Text(item)))
      .toList();

  @override
  Widget build(BuildContext context) {
    final schools = ref.read(schoolsProvider);

    final items = schools
        .map((item) => AutoSuggestBoxItem(value: item, label: item.name))
        .toList();

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
                const Text(kSignUp).fontSize(24),
                const Gap(12),
                EmailTextInput(emailController: _form.emailController),
                const Gap(16),
                PasswordFormBox(
                  controller: _form.passwordController,
                  placeholder: kPassword,
                  onEditingComplete: onClick,
                ),
                const Gap(16),
                TextFormBox(
                  placeholder: kFullName,
                  controller: _form.nameController,
                ),
                const Gap(16),
                TextFormBox(
                  placeholder: kPhoneNumber,
                  controller: _form.phoneController,
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(kCountryCode),
                  ),
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\+]'))
                  ],
                ),
                const Gap(16),
                TextFormBox(
                  placeholder: kWorkAddress,
                  controller: _form.addressController,
                ),
                const Gap(16),
                ComboBox(
                  isExpanded: true,
                  placeholder: const Text(kRole).opacity(.8),
                  items: roles,
                  value: _form.role,
                  onChanged: (value) => setState(() {
                    _form.role = value!;
                  }),
                ),
                const Gap(16),
                AutoSuggestBox(
                  placeholder: kSchool,
                  items: items,
                  onSelected: (value) {
                    setState(
                        () => _form.schoolController.text = value.value!.id);
                  },
                ),
                const Gap(16),
                const TextNavigator(kAlreadyHaveAnAccount, pop: true),
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
          if (_form.isValid) {
            await onClick();
          } else {
            popUpInfoBar(kInvalidForm, kFillAllFields, context);
          }
        });
  }

  Future<void> onClick() async {
    setState(() => isLoading = true);
    if (formKey.currentState!.validate()) {
      try {
        final response =
            await ref.read(authenticationProvider.notifier).signUp(_form);

        if (response) {
          // ignore: use_build_context_synchronously
          popUpInfoBar(
            kAccountCreated,
            kCheckEmail,
            context,
            barSeverity: InfoBarSeverity.success,
          );
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
}
