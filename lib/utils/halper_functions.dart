import 'dart:developer';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<void> setWallpaperHandler(context, url, location) async {
  try {
    var file = await DefaultCacheManager().getSingleFile(url); //image file

    await AsyncWallpaper.setWallpaperFromFile(
      filePath: file.path,
      wallpaperLocation: location,
      goToHome: false,
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(),
    );
  } catch (e) {
    log(e.toString());
  }
}
