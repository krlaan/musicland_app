import 'package:musicland_app/views/components/animations/lottie_animation_view.dart';
import 'package:musicland_app/views/components/animations/models/lottie_animation.dart';

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({super.key})
      : super(
    animation: LottieAnimation.smallError,
  );
}
