import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixwalls/data/images.dart';
import 'package:pixwalls/presentation/widgets/choice_bottom_sheet.dart';
import 'package:pixwalls/presentation/widgets/custom_text.dart';
import 'package:pixwalls/presentation/widgets/set_wall_popup.dart';
import 'package:pixwalls/utils/halper_functions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  bool shadowColor = false;

  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    final List<int> items = List<int>.generate(51, (int index) => index);

    // void setWallpaperHandler(context, url, location) async {
    //   try {
    //     var file = await DefaultCacheManager().getSingleFile(url); //image file

    //     await AsyncWallpaper.setWallpaperFromFile(
    //       filePath: file.path,
    //       wallpaperLocation: location,
    //       goToHome: false,
    //       toastDetails: ToastDetails.success(),
    //       errorToastDetails: ToastDetails.error(),
    //     );
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Pixwalls",
          isBold: true,
          size: 40,
        ),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: GridView.builder(
        itemCount: images.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SetWallPopup(
                      url: images[index],
                      onSetWallHandler: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ChoiceBottomSheet(
                                onHome: () async {
                                  await setWallpaperHandler(
                                    context,
                                    images[index],
                                    AsyncWallpaper.HOME_SCREEN,
                                  ).then(
                                    (_) => Navigator.pop(context),
                                  );
                                },
                                onLock: () async {
                                  await setWallpaperHandler(
                                    context,
                                    images[index],
                                    AsyncWallpaper.LOCK_SCREEN,
                                  ).then(
                                    (_) => Navigator.pop(context),
                                  );
                                },
                                onBoth: () async {
                                  await setWallpaperHandler(
                                    context,
                                    images[index],
                                    AsyncWallpaper.BOTH_SCREENS,
                                  ).then(
                                    (_) => Navigator.pop(context),
                                  );
                                },
                              );
                            });
                      },
                    );
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: images[index],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // Image.network(
              //   images[index],
              //   fit: BoxFit.fill,
              // ),
            ),
          );
        },
      ),
    );
  }
}
