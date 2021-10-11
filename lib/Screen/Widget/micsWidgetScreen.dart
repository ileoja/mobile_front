import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';

class MiscNetworkImageWithUrl extends StatelessWidget {
  const MiscNetworkImageWithUrl(
      {Key key,
        @required this.photoKey,
        @required this.imagePath,
        this.width,
        this.height,
        this.onTap,
        this.boxfit = BoxFit.cover})
      : super(key: key);

  final double width;
  final double height;
  final Function onTap;
  final String photoKey;
  final BoxFit boxfit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath == '') {
      return GestureDetector(
          onTap: onTap,
          child: Image.asset(
            DrConfig.getImage('placeholder_image.png'),
            width: width,
            height: height,
            fit: boxfit,
          ));
    } else {
      final String fullImagePath = '$imagePath';
      final String thumbnailImagePath = '$imagePath';

      if (photoKey == '') {
        return GestureDetector(
          onTap: onTap,
          child: CachedNetworkImage(
            placeholder: (BuildContext context, String url) {
              if (DrConfig.USE_THUMBNAIL_AS_PLACEHOLDER) {
                return CachedNetworkImage(
                  width: width,
                  height: height,
                  fit: boxfit,
                  placeholder: (BuildContext context, String url) {
                    return Image.asset(
                      DrConfig.getImage('placeholder_image.png'),
                      width: width,
                      height: height,
                      fit: boxfit,
                    );
                  },
                  imageUrl: thumbnailImagePath,
                );
              } else {
                return GestureDetector(
                    onTap: onTap,
                    child: Image.asset(
                      DrConfig.getImage('placeholder_image.png'),
                      width: width,
                      height: height,
                      fit: boxfit,
                    ));
              }
            },
            width: width,
            height: height,
            fit: boxfit,
            imageUrl: fullImagePath,
            errorWidget: (BuildContext context, String url, Object error) =>
                Image.asset(
                  DrConfig.getImage('placeholder_image.png'),
                  width: width,
                  height: height,
                  fit: boxfit,
                ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: onTap,
          child: CachedNetworkImage(
            placeholder: (BuildContext context, String url) =>
                CachedNetworkImage(
                  width: width,
                  height: height,
                  fit: boxfit,
                  placeholder: (BuildContext context, String url) {
                    return Image.asset(
                      DrConfig.getImage('placeholder_image.png'),
                      width: width,
                      height: height,
                      fit: boxfit,
                    );
                  },
                  imageUrl: '$imagePath',
                ),
            width: width,
            height: height,
            fit: boxfit,
            imageUrl: '$imagePath',
            errorWidget: (BuildContext context, String url, Object error) =>
                Image.asset(DrConfig.getImage('placeholder_image.png'),
                  width: width,
                  height: height,
                  fit: boxfit,
                ),
          ),
        );
      }
    }
  }
}


class MiscNetworkCircleImage extends StatelessWidget {
  const MiscNetworkCircleImage(
      {Key key,
        @required this.photoKey,
        this.imagePath,
        this.asset,
        this.width,
        this.height,
        this.onTap,
        this.boxfit = BoxFit.cover})
      : super(key: key);

  final double width;
  final double height;
  final Function onTap;
  final String photoKey;
  final BoxFit boxfit;
  final String imagePath;
  final String asset;

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath == '') {
      if (asset == null || asset == '') {
        return GestureDetector(
            onTap: onTap,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: Image.asset(
                  DrConfig.getImage('placeholder_image.png'),
                  width: width,
                  height: height,
                  fit: boxfit,
                )));
      } else {
        print('I Key : $photoKey$asset');
        print('');
        return GestureDetector(
            onTap: onTap,
            child: Hero(
              tag: '$photoKey$asset',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: Image.asset(asset,
                    width: width, height: height, fit: boxfit),
              ),
            ));
      }
    } else {
      final String fullImagePath = '$imagePath';
      final String thumbnailImagePath = '$imagePath';
      if (photoKey == '') {
        return GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10000.0),
              child: CachedNetworkImage(
                placeholder: (BuildContext context, String url) {
                  if (DrConfig.USE_THUMBNAIL_AS_PLACEHOLDER) {
                    return CachedNetworkImage(
                      width: width,
                      height: height,
                      fit: boxfit,
                      placeholder: (BuildContext context, String url) {
                        return Image.asset(
                          DrConfig.getImage('placeholder_image.png'),
                          width: width,
                          height: height,
                          fit: boxfit,
                        );
                      },
                      imageUrl: thumbnailImagePath,
                    );
                  } else {
                    return GestureDetector(
                        onTap: onTap,
                        child: Image.asset(
                          DrConfig.getImage('placeholder_image.png'),
                          width: width,
                          height: height,
                          fit: boxfit,
                        ));
                  }
                },
                width: width,
                height: height,
                fit: boxfit,
                imageUrl: fullImagePath,
                errorWidget: (BuildContext context, String url, Object error) =>
                    Image.asset(
                      DrConfig.getImage('placeholder_image.png'),
                      width: width,
                      height: height,
                      fit: boxfit,
                    ),
              ),
            ));
      } else {
        return GestureDetector(
          onTap: onTap,
          child: Hero(
              tag: '$photoKey$imagePath',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedNetworkImage(
                  placeholder: (BuildContext context, String url) =>
                      CachedNetworkImage(
                        width: width,
                        height: height,
                        fit: boxfit,
                        placeholder: (BuildContext context, String url) {
                          return Image.asset(
                            DrConfig.getImage('placeholder_image.png'),
                            width: width,
                            height: height,
                            fit: boxfit,
                          );
                        },
                        imageUrl: '$imagePath',
                      ),
                  width: width,
                  height: height,
                  fit: boxfit,
                  imageUrl: '$imagePath',
                  errorWidget:
                      (BuildContext context, String url, Object error) =>
                      Image.asset(
                        DrConfig.getImage('placeholder_image.png'),
                        width: width,
                        height: height,
                        fit: boxfit,
                      ),
                ),
              )),
        );
      }
    }
  }
}