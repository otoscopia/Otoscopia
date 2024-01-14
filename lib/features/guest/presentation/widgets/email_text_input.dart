import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/core/core.dart';

class EmailTextInput extends StatelessWidget {
  const EmailTextInput({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormBox(
      controller: emailController,
      placeholder: kEmailAddress,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: (value) {
        if (value!.isEmpty) {
          return "Email can't be empty";
        }
        return null;
      },
    );
  }
}
