// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/location_animation.gif
  AssetGenImage get locationAnimation =>
      const AssetGenImage('assets/animations/location_animation.gif');

  /// List of all assets
  List<AssetGenImage> get values => [locationAnimation];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner_image.jpg
  AssetGenImage get bannerImage =>
      const AssetGenImage('assets/images/banner_image.jpg');

  /// File path: assets/images/bodhi_retreat_spa.png
  AssetGenImage get bodhiRetreatSpa =>
      const AssetGenImage('assets/images/bodhi_retreat_spa.png');

  /// File path: assets/images/eternal_bliss_ayurvedic_spa.png
  AssetGenImage get eternalBlissAyurvedicSpa =>
      const AssetGenImage('assets/images/eternal_bliss_ayurvedic_spa.png');

  /// File path: assets/images/mystical_mantra_spa.png
  AssetGenImage get mysticalMantraSpa =>
      const AssetGenImage('assets/images/mystical_mantra_spa.png');

  /// File path: assets/images/renew_day_spa.png
  AssetGenImage get renewDaySpa =>
      const AssetGenImage('assets/images/renew_day_spa.png');

  /// File path: assets/images/spa_details_main_image.png
  AssetGenImage get spaDetailsMainImage =>
      const AssetGenImage('assets/images/spa_details_main_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    bannerImage,
    bodhiRetreatSpa,
    eternalBlissAyurvedicSpa,
    mysticalMantraSpa,
    renewDaySpa,
    spaDetailsMainImage,
  ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/mock_spa_details.json
  String get mockSpaDetails => 'assets/json/mock_spa_details.json';

  /// File path: assets/json/mock_spa_list.json
  String get mockSpaList => 'assets/json/mock_spa_list.json';

  /// List of all assets
  List<String> get values => [mockSpaDetails, mockSpaList];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
