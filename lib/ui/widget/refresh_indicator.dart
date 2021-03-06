import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Indicator {
  static Widget _build(final Widget spin, final String msg, final double height,
      final double top, final double bottom) {
    return Container(
        padding: EdgeInsets.only(top: top, bottom: bottom),
        height: height + top + bottom,
        child: Center(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              spin,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(msg,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          height: 1.25)))
            ])));
  }

  static Widget idle(final BuildContext context, final Color color,
      {final double height = 72,
      final double top = 0,
      final double bottom = 0}) {
    return _build(SpinKitCircle(size: 18, color: color), 'Loading', height,
        top, bottom);
  }

  static Widget can(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double top = 0,
    final double bottom = 0,
  }) {
    return _build(
        SpinKitSquareCircle(size: 18, color: color), "Let go", height, top, bottom);
  }

  static Widget ing(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double top = 0,
    final double bottom = 0,
  }) {
    return _build(
        SpinKitPumpingHeart(
            size: 18,
            itemBuilder: (_, __) {
              return ExtendedImage.asset(
                "assets/mikan.png",
                width: 32.0,
                height: 32.0,
              );
            },
            duration: const Duration(milliseconds: 800)),
        'Loading, please wait ...',
        height,
        top,
        bottom);
  }

  static Widget completed(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double top = 0,
    final double bottom = 0,
  }) {
    return _build(
        SpinKitDualRing(size: 18, color: color), 'Completed', height, top, bottom);
  }

  static Widget failed(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double top = 0,
    final double bottom = 0,
  }) {
    return _build(SpinKitPumpingHeart(size: 18, color: color), 'Failed', height,
        top, bottom);
  }

  static Widget noMore(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double top = 0,
    final double bottom = 0,
  }) {
    return _build(
        SpinKitDoubleBounce(size: 18, color: color), 'No more data', height, top, bottom);
  }

  static Widget header(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double top = 0,
  }) {
    return CustomHeader(
        height: height + top,
        builder: (context, RefreshStatus? mode) {
          switch (mode) {
            case RefreshStatus.idle:
              return idle(context, color, height: height, top: top);
            case RefreshStatus.canRefresh:
              return can(context, color, height: height, top: top);
            case RefreshStatus.refreshing:
              return ing(context, color, height: height, top: top);
            case RefreshStatus.completed:
              return completed(context, color, height: height, top: top);
            case RefreshStatus.failed:
              return failed(context, color, height: height, top: top);
            case RefreshStatus.canTwoLevel:
            case RefreshStatus.twoLevelOpening:
            case RefreshStatus.twoLeveling:
            case RefreshStatus.twoLevelClosing:
            default:
              return const SizedBox.shrink();
          }
        });
  }

  static Widget footer(
    final BuildContext context,
    final Color color, {
    final double height = 72,
    final double bottom = 0,
  }) {
    return CustomFooter(
        height: height + bottom,
        builder: (BuildContext context, LoadStatus? mode) {
          switch (mode) {
            case LoadStatus.idle:
              return idle(context, color, height: height, bottom: bottom);
            case LoadStatus.canLoading:
              return can(context, color, height: height, bottom: bottom);
            case LoadStatus.loading:
              return ing(context, color, height: height, bottom: bottom);
            case LoadStatus.noMore:
              return noMore(context, color, height: height, bottom: bottom);
            case LoadStatus.failed:
              return failed(context, color, height: height, bottom: bottom);
            default:
              return const SizedBox.shrink();
          }
        });
  }
}
