import 'dart:io';
import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class EarImages extends ConsumerWidget {
  const EarImages(
    this._name,
    this._earPath, {
    super.key,
    this.isNetwork = true,
  });

  final String _name;
  final List<String> _earPath;
  final bool isNetwork;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List images = [];
    final earPosition = _name.split(" ").first.toLowerCase();

    if (!isNetwork) {
      images =
          _earPath.where((element) => element.contains(earPosition)).toList();
    }

    return CardOpacity(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _name,
            style: FluentTheme.of(context).typography.title,
          ),
          const Gap(8),
          FutureBuilder(
            future: isNetwork
                ? ref.read(fetchDataProvider.notifier).getImages(earPosition, _earPath)
                : null,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }

              if (isNetwork) {
                images = snapshot.data as List<Uint8List>;
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: images.length,
                padding: const EdgeInsets.only(bottom: 8),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: isNetwork
                        ? Image.memory(
                            images[index],
                            fit: BoxFit.cover,
                            width: 350,
                          )
                        : Image.file(
                            File(images[index]),
                            fit: BoxFit.cover,
                            width: 350,
                          ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
