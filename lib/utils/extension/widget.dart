import 'package:flutter_diablo2_exchange/index.dart';

extension WidgetExtension on Widget {

  ///불러오는 화면으로 부터 데이터를 받는 경우 사용
  Future<dynamic>? getData() {
    return Get.to(this);
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadius? radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}

extension ContainerExtension on Container {
  Container showOutLine(Color color) {
    return Container(
      decoration: BoxDecoration(
       border: Border.all( 
         width: 1,
         color: Colors.black, 
      ),
    ),
      child: this,
    );
  }
}

extension InkWellExtension on InkWell {
  InkWell isEffectOff() {
    return InkWell(
      autofocus: this.autofocus,
      borderRadius: this.borderRadius,
      canRequestFocus: this.canRequestFocus,
      child: this.child,
      customBorder: this.customBorder,
      enableFeedback: this.enableFeedback,
      excludeFromSemantics: this.excludeFromSemantics,
      focusColor: this.focusColor,
      focusNode: this.focusNode,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      key: this.key,
      mouseCursor: this.mouseCursor,
      onDoubleTap: this.onDoubleTap,
      onFocusChange: this.onFocusChange,
      onHighlightChanged: this.onHighlightChanged,
      onHover: this.onHover,
      onLongPress: this.onLongPress,
      onTap: this.onTap,
      onTapCancel: this.onTapCancel,
      onTapDown: this.onTapDown,
      overlayColor: this.overlayColor,
      radius: this.radius,
      splashColor: Colors.transparent,
      splashFactory: this.splashFactory,
    );
  }
}
