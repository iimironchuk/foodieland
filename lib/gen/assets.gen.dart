/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/drawer.svg
  String get drawer => 'assets/icons/drawer.svg';

  /// File path: assets/icons/duration.svg
  String get duration => 'assets/icons/duration.svg';

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/favorite.svg
  String get favorite => 'assets/icons/favorite.svg';

  /// File path: assets/icons/instagarm.svg
  String get instagarm => 'assets/icons/instagarm.svg';

  /// File path: assets/icons/print.svg
  String get print => 'assets/icons/print.svg';

  /// File path: assets/icons/recipe_category.svg
  String get recipeCategory => 'assets/icons/recipe_category.svg';

  /// File path: assets/icons/share.svg
  String get share => 'assets/icons/share.svg';

  /// File path: assets/icons/twitter.svg
  String get twitter => 'assets/icons/twitter.svg';

  /// File path: assets/icons/whatsapp.svg
  String get whatsapp => 'assets/icons/whatsapp.svg';

  /// List of all assets
  List<String> get values => [
    drawer,
    duration,
    facebook,
    favorite,
    instagarm,
    print,
    recipeCategory,
    share,
    twitter,
    whatsapp,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/advertisment.png
  AssetGenImage get advertisment =>
      const AssetGenImage('assets/images/advertisment.png');

  /// File path: assets/images/badge.png
  AssetGenImage get badge => const AssetGenImage('assets/images/badge.png');

  /// File path: assets/images/chef.png
  AssetGenImage get chef => const AssetGenImage('assets/images/chef.png');

  /// File path: assets/images/contact_page_cook.png
  AssetGenImage get contactPageCook =>
      const AssetGenImage('assets/images/contact_page_cook.png');

  /// File path: assets/images/hot_recipe.png
  AssetGenImage get hotRecipe =>
      const AssetGenImage('assets/images/hot_recipe.png');

  /// File path: assets/images/instagram_post_1.png
  AssetGenImage get instagramPost1 =>
      const AssetGenImage('assets/images/instagram_post_1.png');

  /// File path: assets/images/instagram_post_2.png
  AssetGenImage get instagramPost2 =>
      const AssetGenImage('assets/images/instagram_post_2.png');

  /// File path: assets/images/instagram_post_3.png
  AssetGenImage get instagramPost3 =>
      const AssetGenImage('assets/images/instagram_post_3.png');

  /// File path: assets/images/instagram_post_4.png
  AssetGenImage get instagramPost4 =>
      const AssetGenImage('assets/images/instagram_post_4.png');

  /// File path: assets/images/salad1.png
  AssetGenImage get salad1 => const AssetGenImage('assets/images/salad1.png');

  /// File path: assets/images/salad2.png
  AssetGenImage get salad2 => const AssetGenImage('assets/images/salad2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    advertisment,
    badge,
    chef,
    contactPageCook,
    hotRecipe,
    instagramPost1,
    instagramPost2,
    instagramPost3,
    instagramPost4,
    salad1,
    salad2,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
