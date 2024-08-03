import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixwalls/data/images.dart';
import 'package:pixwalls/presentation/widgets/choice_bottom_sheet.dart';
import 'package:pixwalls/presentation/widgets/custom_text.dart';
import 'package:pixwalls/presentation/widgets/set_wall_popup.dart';
import 'package:pixwalls/utils/halper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  bool shadowColor = false;

  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Favorites",
          isBold: true,
          size: 40,
        ),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: favImages.isEmpty
          ? Center(
              child: CustomText(
                text: "No Favorites",
                isBold: true,
                size: 30,
              ),
            )
          : GridView.builder(
              itemCount: favImages.length,
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
                            url: favImages[index],
                            onSetWallHandler: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ChoiceBottomSheet(
                                      onHome: () => setWallpaperHandler(
                                        context,
                                        favImages[index],
                                        AsyncWallpaper.HOME_SCREEN,
                                      ),
                                      onLock: () => setWallpaperHandler(
                                        context,
                                        favImages[index],
                                        AsyncWallpaper.LOCK_SCREEN,
                                      ),
                                      onBoth: () => setWallpaperHandler(
                                        context,
                                        favImages[index],
                                        AsyncWallpaper.BOTH_SCREENS,
                                      ),
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
                      imageUrl: favImages[index],
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
