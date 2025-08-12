import 'package:app/shared/bloc/state_carousel.dart';
import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppCarouselBuilder extends StatelessWidget {
  const AppCarouselBuilder({
    required this.bannerCount,
    required this.builder,
    super.key,
    this.initialIndex = 0,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 200),
    this.height = 200,
    this.needsPadding = true,
    this.pauseWidth = 4.5,
    this.marginBottomIndicator = 1.25,
    this.activeDotWidth = 7.5,
    this.activeDotHeight = 1.15,
    this.dotWidth = 2.75,
    this.onTap,
  });

  final int bannerCount;
  final int initialIndex;
  final Duration autoPlayDuration;
  final Duration autoPlayAnimationDuration;
  final double height;
  final bool needsPadding;
  final Widget Function({required int index, required bool isPlaying}) builder;

  final double pauseWidth;
  final double marginBottomIndicator;
  final double activeDotHeight;
  final double activeDotWidth;
  final double dotWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselCubit(
        bannerCount: bannerCount,
        initialIndex: initialIndex,
        autoPlayDuration: autoPlayDuration,
      ),
      child: _CarouselContent(
        builder: builder,
        bannerCount: bannerCount,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        height: height,
        pauseWidth: pauseWidth,
        marginBottomIndicator: marginBottomIndicator,
        activeDotHeight: activeDotHeight,
        activeDotWidth: activeDotWidth,
        dotWidth: dotWidth,
      ),
    );
  }
}

class _CarouselContent extends StatefulWidget {
  const _CarouselContent({
    required this.builder,
    required this.bannerCount,
    required this.autoPlayAnimationDuration,
    required this.height,
    required this.pauseWidth,
    required this.marginBottomIndicator,
    required this.activeDotHeight,
    required this.activeDotWidth,
    required this.dotWidth,
  });

  final Widget Function({required int index, required bool isPlaying}) builder;
  final int bannerCount;
  final Duration autoPlayAnimationDuration;
  final double height;

  final double pauseWidth;
  final double marginBottomIndicator;
  final double activeDotHeight;
  final double activeDotWidth;
  final double dotWidth;

  @override
  State<_CarouselContent> createState() => _CarouselContentState();
}

class _CarouselContentState extends State<_CarouselContent> {
  final _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.bannerCount <= 0) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CarouselSlider.builder(
                itemCount: widget.bannerCount,
                options: CarouselOptions(
                  height: widget.height,
                  initialPage: _currentIndex,
                  autoPlay: state.isPlaying,
                  onPageChanged: (index, reason) {
                    _currentIndex = index;
                    setState(() {});
                  },
                  autoPlayInterval: context.read<CarouselCubit>().autoPlayDuration,
                  autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
                  viewportFraction: 1,
                  enableInfiniteScroll: widget.bannerCount > 1,
                ),
                carouselController: _carouselController,
                itemBuilder: (context, index, realIndex) {
                  return widget.builder(
                    index: index,
                    isPlaying: state.isPlaying,
                  );
                },
              ),
            ),
            if (widget.bannerCount > 1)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: child,
                      );
                    },
                    child: Container(
                      height: 3.5.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      margin: EdgeInsets.only(
                        bottom: widget.marginBottomIndicator.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => context.read<CarouselCubit>().togglePlay(),
                            child: AppAdaptiveImage(
                              state.isPlaying ? AppImages.pause : AppImages.play,
                              width: widget.pauseWidth.w,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF414651),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          AnimatedSmoothIndicator(
                            activeIndex: _currentIndex,
                            count: widget.bannerCount,
                            effect: CustomizableEffect(
                              activeColorOverride: (_) => const Color(0xFF414651),
                              inActiveColorOverride: (_) => const Color(0xFFE0E0E5),
                              activeDotDecoration: DotDecoration(
                                width: widget.activeDotWidth.w,
                                height: widget.activeDotHeight.h,
                                color: const Color(0xFF414651),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              dotDecoration: DotDecoration(
                                width: widget.dotWidth.w,
                                height: widget.dotWidth.w,
                                color: const Color(0xFFE0E0E5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              spacing: 6,
                            ),
                            onDotClicked: (index) {
                              _currentIndex = index;
                              setState(() {});
                              _carouselController.animateToPage(
                                index,
                                duration: widget.autoPlayAnimationDuration,
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
