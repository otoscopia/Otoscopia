import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class EarImages extends ConsumerStatefulWidget {
  const EarImages(
    this._name,
    this._earPath, {
    super.key,
    this.isNetwork = false,
  });

  final String _name;
  final List<String> _earPath;
  final bool isNetwork;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EarImagesState();
}

class _EarImagesState extends ConsumerState<EarImages> {
  @override
  Widget build(BuildContext context) {
    List images = [];
    final earPosition = widget._name.split(" ").first.toLowerCase();

    if (widget.isNetwork) {
      images = widget._earPath
          .where((element) => element.contains(earPosition))
          .toList();
    } else {
      images = widget._earPath.where((element) {
        return element.split("\\").last.contains(earPosition);
      }).toList();
    }

    final future = widget.isNetwork
        ? ref
            .read(fetchDataProvider.notifier)
            .getImages(earPosition, widget._earPath)
        : null;

    return CardOpacity(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(widget._name, style: 1),
          const Gap(8),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }

              if (widget.isNetwork) {
                images = snapshot.data as List<Uint8List>;
              }

              return GridView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                padding: const EdgeInsets.only(bottom: 8),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 256,
                  maxCrossAxisExtent: 350,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: widget.isNetwork
                        ? Image.memory(
                            images[index],
                            fit: BoxFit.cover,
                            width: 350,
                          )
                        : LocalImage(images, index: index),
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
