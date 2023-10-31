import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pixwalls/data/images.dart';
import 'package:pixwalls/presentation/screens/preview.dart';
import 'package:pixwalls/presentation/widgets/custom_button.dart';
import 'package:pixwalls/presentation/widgets/custom_text.dart';
import 'package:pixwalls/utils/colors.dart';

class SetWallPopup extends StatefulWidget {
  String url;
  VoidCallback onSetWallHandler;
  SetWallPopup({
    super.key,
    required this.url,
    required this.onSetWallHandler,
  });

  @override
  State<SetWallPopup> createState() => _SetWallPopupState();
}

class _SetWallPopupState extends State<SetWallPopup> {
  bool isFav = false;

  void favHandler() async {
    if (favImages.contains(widget.url)) {
      setState(() {
        favImages.remove(widget.url);
        isFav = false;
      });
    } else {
      setState(() {
        favImages.add(widget.url);
        isFav = true;
      });
    }
    GetStorage().write("fav_data", favImages);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: widget.url,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PreviewScreen(
                                url: widget.url,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomText(
                        text: "Preview",
                        align: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: kColor.PrimaryColor,
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.download,
                        color: Colors.white,
                      )),
                ),
                CircleAvatar(
                  backgroundColor: kColor.PrimaryColor,
                  child: IconButton(
                      onPressed: favHandler,
                      icon: Icon(
                        favImages.contains(widget.url)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      )),
                ),
                GestureDetector(
                  onTap: widget.onSetWallHandler,
                  child: CustomButton(
                    text: "Set wallpaper",
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
