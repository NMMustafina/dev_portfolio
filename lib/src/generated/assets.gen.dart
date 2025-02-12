/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsCoffeeShopGen {
  const $AssetsCoffeeShopGen();

  /// Directory path: assets/coffee_shop/icons
  $AssetsCoffeeShopIconsGen get icons => const $AssetsCoffeeShopIconsGen();

  /// Directory path: assets/coffee_shop/images
  $AssetsCoffeeShopImagesGen get images => const $AssetsCoffeeShopImagesGen();
}

class $AssetsCoffeeShopIconsGen {
  const $AssetsCoffeeShopIconsGen();

  /// File path: assets/coffee_shop/icons/bag.svg
  SvgGenImage get bag => const SvgGenImage('assets/coffee_shop/icons/bag.svg');

  /// File path: assets/coffee_shop/icons/heart.svg
  SvgGenImage get heart =>
      const SvgGenImage('assets/coffee_shop/icons/heart.svg');

  /// File path: assets/coffee_shop/icons/home.svg
  SvgGenImage get home =>
      const SvgGenImage('assets/coffee_shop/icons/home.svg');

  /// File path: assets/coffee_shop/icons/more.svg
  SvgGenImage get more =>
      const SvgGenImage('assets/coffee_shop/icons/more.svg');

  /// File path: assets/coffee_shop/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/coffee_shop/icons/notification.svg');

  /// File path: assets/coffee_shop/icons/search.svg
  SvgGenImage get search =>
      const SvgGenImage('assets/coffee_shop/icons/search.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [bag, heart, home, more, notification, search];
}

class $AssetsCoffeeShopImagesGen {
  const $AssetsCoffeeShopImagesGen();

  /// File path: assets/coffee_shop/images/coffee_1.png
  AssetGenImage get coffee1 =>
      const AssetGenImage('assets/coffee_shop/images/coffee_1.png');

  /// File path: assets/coffee_shop/images/coffee_2.png
  AssetGenImage get coffee2 =>
      const AssetGenImage('assets/coffee_shop/images/coffee_2.png');

  /// File path: assets/coffee_shop/images/coffee_3.png
  AssetGenImage get coffee3 =>
      const AssetGenImage('assets/coffee_shop/images/coffee_3.png');

  /// File path: assets/coffee_shop/images/coffee_4.png
  AssetGenImage get coffee4 =>
      const AssetGenImage('assets/coffee_shop/images/coffee_4.png');

  /// File path: assets/coffee_shop/images/coffee_5.png
  AssetGenImage get coffee5 =>
      const AssetGenImage('assets/coffee_shop/images/coffee_5.png');

  /// File path: assets/coffee_shop/images/onboarding_bg.png
  AssetGenImage get onboardingBg =>
      const AssetGenImage('assets/coffee_shop/images/onboarding_bg.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [coffee1, coffee2, coffee3, coffee4, coffee5, onboardingBg];
}

class Assets {
  const Assets._();

  static const $AssetsCoffeeShopGen coffeeShop = $AssetsCoffeeShopGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
