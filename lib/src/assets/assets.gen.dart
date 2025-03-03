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

class $AssetsCoffeeAppGen {
  const $AssetsCoffeeAppGen();

  /// Directory path: assets/coffee_app/icons
  $AssetsCoffeeAppIconsGen get icons => const $AssetsCoffeeAppIconsGen();

  /// Directory path: assets/coffee_app/images
  $AssetsCoffeeAppImagesGen get images => const $AssetsCoffeeAppImagesGen();
}

class $AssetsCoffeeAppIconsGen {
  const $AssetsCoffeeAppIconsGen();

  /// File path: assets/coffee_app/icons/bag.svg
  SvgGenImage get bag => const SvgGenImage('assets/coffee_app/icons/bag.svg');

  /// File path: assets/coffee_app/icons/bean.png
  AssetGenImage get bean =>
      const AssetGenImage('assets/coffee_app/icons/bean.png');

  /// File path: assets/coffee_app/icons/bike.png
  AssetGenImage get bike =>
      const AssetGenImage('assets/coffee_app/icons/bike.png');

  /// File path: assets/coffee_app/icons/calling.svg
  SvgGenImage get calling =>
      const SvgGenImage('assets/coffee_app/icons/calling.svg');

  /// File path: assets/coffee_app/icons/discount.svg
  SvgGenImage get discount =>
      const SvgGenImage('assets/coffee_app/icons/discount.svg');

  /// File path: assets/coffee_app/icons/filter.svg
  SvgGenImage get filter =>
      const SvgGenImage('assets/coffee_app/icons/filter.svg');

  /// File path: assets/coffee_app/icons/heart.svg
  SvgGenImage get heart =>
      const SvgGenImage('assets/coffee_app/icons/heart.svg');

  /// File path: assets/coffee_app/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/coffee_app/icons/home.svg');

  /// File path: assets/coffee_app/icons/milk.png
  AssetGenImage get milk =>
      const AssetGenImage('assets/coffee_app/icons/milk.png');

  /// File path: assets/coffee_app/icons/more.svg
  SvgGenImage get more => const SvgGenImage('assets/coffee_app/icons/more.svg');

  /// File path: assets/coffee_app/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/coffee_app/icons/notification.svg');

  /// File path: assets/coffee_app/icons/search.svg
  SvgGenImage get search =>
      const SvgGenImage('assets/coffee_app/icons/search.svg');

  /// File path: assets/coffee_app/icons/star.svg
  SvgGenImage get star => const SvgGenImage('assets/coffee_app/icons/star.svg');

  /// File path: assets/coffee_app/icons/wallet.svg
  SvgGenImage get wallet =>
      const SvgGenImage('assets/coffee_app/icons/wallet.svg');

  /// List of all assets
  List<dynamic> get values => [
    bag,
    bean,
    bike,
    calling,
    discount,
    filter,
    heart,
    home,
    milk,
    more,
    notification,
    search,
    star,
    wallet,
  ];
}

class $AssetsCoffeeAppImagesGen {
  const $AssetsCoffeeAppImagesGen();

  /// File path: assets/coffee_app/images/coffee_1.png
  AssetGenImage get coffee1 =>
      const AssetGenImage('assets/coffee_app/images/coffee_1.png');

  /// File path: assets/coffee_app/images/coffee_2.png
  AssetGenImage get coffee2 =>
      const AssetGenImage('assets/coffee_app/images/coffee_2.png');

  /// File path: assets/coffee_app/images/coffee_3.png
  AssetGenImage get coffee3 =>
      const AssetGenImage('assets/coffee_app/images/coffee_3.png');

  /// File path: assets/coffee_app/images/coffee_4.png
  AssetGenImage get coffee4 =>
      const AssetGenImage('assets/coffee_app/images/coffee_4.png');

  /// File path: assets/coffee_app/images/promo_banner.png
  AssetGenImage get promoBanner =>
      const AssetGenImage('assets/coffee_app/images/promo_banner.png');

  /// File path: assets/coffee_app/images/welcome_bg.png
  AssetGenImage get welcomeBg =>
      const AssetGenImage('assets/coffee_app/images/welcome_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    coffee1,
    coffee2,
    coffee3,
    coffee4,
    promoBanner,
    welcomeBg,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsCoffeeAppGen coffeeApp = $AssetsCoffeeAppGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

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
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
