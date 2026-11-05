import 'package:flutter/material.dart';

class CustomPaintPage extends StatefulWidget {
  const CustomPaintPage({super.key});

  @override
  State<CustomPaintPage> createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  double _sliderValue = 60.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Custom Painter Canvas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Demonstrating paths, shapes, arcs & gradients',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CustomPaint(
                  painter: HeartPainter(),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CustomPaint(
                  painter: ArtCustomPainter(factor: _sliderValue / 100),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Scale Factor: ${(_sliderValue).round()}%',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Slider(
              value: _sliderValue,
              min: 20,
              max: 100,
              onChanged: (val) {
                setState(() {
                  _sliderValue = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ArtCustomPainter extends CustomPainter {
  final double factor;

  ArtCustomPainter({required this.factor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // 1. Background radial gradient
     final bgPaint = Paint()
        ..shader = const RadialGradient(
         colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
       ).createShader(Rect.fromCircle(center: center, radius: size.width / 2));
       canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // // 2. Concentric decorative circles
    // final ringPaint = Paint()
    //   ..color = Colors.deepPurple.withValues(alpha: 0.25)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;

    // final baseRadius = (size.width * 0.38) * factor;
    // canvas.drawCircle(center, baseRadius, ringPaint);
    // canvas.drawCircle(
    //   center,
    //   baseRadius * 0.7,
    //   ringPaint..color = Colors.indigo.withValues(alpha: 0.3),
    // );

    // 3. Sun / glowing orb with gradient
    final sunCenter = Offset(center.dx, center.dy - (45 * factor));
    final sunPaint = Paint()
      ..shader = const RadialGradient(
        colors: [Colors.amberAccent, Colors.deepOrange],
      ).createShader(
        Rect.fromCircle(center: sunCenter, radius: 28 * factor),
      );
    canvas.drawCircle(sunCenter, 28 * factor, sunPaint);

    // 4. Wave path with linear gradient
    final wavePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.deepPurple, Colors.indigoAccent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.65);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * (0.55 - (0.12 * factor)),
      size.width * 0.5,
      size.height * 0.65,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (0.75 + (0.12 * factor)),
      size.width,
      size.height * 0.65,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, wavePaint);

    // 5. Star cross accent lines
    final starPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5;

    canvas.drawLine(
      Offset(sunCenter.dx - 12, sunCenter.dy),
      Offset(sunCenter.dx + 12, sunCenter.dy),
      starPaint,
    );
    canvas.drawLine(
      Offset(sunCenter.dx, sunCenter.dy - 12),
      Offset(sunCenter.dx, sunCenter.dy + 12),
      starPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ArtCustomPainter oldDelegate) {
    return oldDelegate.factor != factor;
  }
}
class HeartPainter extends CustomPainter {
      @override
      void paint(Canvas canvas, Size size) {
        final paint = Paint()
          ..color = Colors.pinkAccent
          ..style = PaintingStyle.fill;
    
        final width = size.width;
        final height = size.height;
    
        final path = Path();
        // 1. Start at the bottom point of the heart
        path.moveTo(width / 2, height * 0.78);
    
        // 2. Left side curve up to the left lobe crest
        path.cubicTo(
          width * 0.15, height * 0.55,
          width * 0.15, height * 0.25,
          width * 0.35, height * 0.25,
        );
    
        // 3. Left lobe down into the top center notch
        path.cubicTo(
          width * 0.45, height * 0.25,
          width / 2, height * 0.34,
          width / 2, height * 0.38,
        );
    
        // 4. Top center notch up to the right lobe crest
        path.cubicTo(
          width / 2, height * 0.34,
          width * 0.55, height * 0.25,
          width * 0.65, height * 0.25,
        );
    
        // 5. Right lobe down to the bottom point
        path.cubicTo(
          width * 0.85, height * 0.25,
          width * 0.85, height * 0.55,
          width / 2, height * 0.78,
        );
    
        path.close();
    
        canvas.drawPath(path, paint);
      }
    
      @override
      bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
    }
