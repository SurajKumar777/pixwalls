import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixwalls/presentation/widgets/custom_text.dart';

class PreviewScreen extends StatelessWidget {
  String url;
  PreviewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: url,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
