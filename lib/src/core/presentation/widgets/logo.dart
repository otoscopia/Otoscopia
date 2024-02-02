import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:otoscopia/src/core/core.dart';

class Logo extends ConsumerWidget {
  const Logo({super.key, this.url = kLogo, this.height = 25, this.width});
  final String? url;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SvgPicture.asset(
      url!,
      height: height,
      width: width,
    );
  }
}
