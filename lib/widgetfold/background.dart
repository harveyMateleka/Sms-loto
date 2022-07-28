import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds)=>LinearGradient(
          colors: [Colors.black,Colors.black12],
          begin: Alignment.center,
          end: Alignment.center).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white12, BlendMode.darken))),),
    );
  }
}