import 'package:crud_flutter_api/app/modules/start/controllers/start_controller.dart';
import 'package:get/get.dart';

import './components/care_view.dart';
import './components/center_next_button.dart';
import './components/mood_diary_vew.dart';
import './components/relax_view.dart';
import './components/splash_view.dart';
import './components/top_back_skip_view.dart';
import './components/welcome_view.dart';
import 'package:flutter/material.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xffF7EBE1),
        body: ClipRect(
          child: Stack(
            children: [
              SplashView(
                animationController: controller.animationController!,
              ),
              RelaxView(
                animationController: controller.animationController!,
              ),
              CareView(
                animationController: controller.animationController!,
              ),
              MoodDiaryVew(
                animationController: controller.animationController!,
              ),
              WelcomeView(
                animationController: controller.animationController!,
              ),
              TopBackSkipView(
                onBackClick: _onBackClick,
                onSkipClick: _onSkipClick,
                animationController: controller.animationController!,
              ),
              CenterNextButton(
                animationController: controller.animationController!,
                onNextClick: _onNextClick,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSkipClick() {
    controller.animationController
        ?.animateTo(0.8, duration: const Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (controller.animationController!.value >= 0 &&
        controller.animationController!.value <= 0.2) {
      controller.animationController?.animateTo(0.0);
    } else if (controller.animationController!.value > 0.2 &&
        controller.animationController!.value <= 0.4) {
      controller.animationController?.animateTo(0.2);
    } else if (controller.animationController!.value > 0.4 &&
        controller.animationController!.value <= 0.6) {
      controller.animationController?.animateTo(0.4);
    } else if (controller.animationController!.value > 0.6 &&
        controller.animationController!.value <= 0.8) {
      controller.animationController?.animateTo(0.6);
    } else if (controller.animationController!.value > 0.8 &&
        controller.animationController!.value <= 1.0) {
      controller.animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (controller.animationController!.value >= 0 &&
        controller.animationController!.value <= 0.2) {
      controller.animationController?.animateTo(0.4);
    } else if (controller.animationController!.value > 0.2 &&
        controller.animationController!.value <= 0.4) {
      controller.animationController?.animateTo(0.6);
    } else if (controller.animationController!.value > 0.4 &&
        controller.animationController!.value <= 0.6) {
      controller.animationController?.animateTo(0.8);
    } else if (controller.animationController!.value > 0.6 &&
        controller.animationController!.value <= 0.8) {}
  }
}
