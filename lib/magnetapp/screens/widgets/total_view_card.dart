import 'package:flutter/material.dart';

class TotalViewCard extends StatelessWidget {
  final int totalViews;
  final String growth;
  final List<double> chartData;

  const TotalViewCard({
    super.key,
    required this.totalViews,
    required this.growth,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF9A8BD3), Color(0xFF7F6FBF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          _buildVisitorsLabel(),
          const SizedBox(width: 14),
          Expanded(flex: 5, child: _buildInfo()),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: CustomPaint(
                size: const Size(double.infinity, 70),
                painter: SparklinePainter(chartData),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitorsLabel() {
    return Container(
      width: 30,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'Visitors',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Total View',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(height: 2),
        Text(
          '$totalViews',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.arrow_drop_up, color: Colors.white, size: 18),
            Text(
              growth,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'From last week',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class SparklinePainter extends CustomPainter {
  final List<double> data;

  SparklinePainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;
    final dx = size.width / (data.length - 1);
    final pts = [
      for (var i = 0; i < data.length; i++)
        Offset(i * dx, size.height - data[i] * size.height),
    ];

    final line = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 0; i < pts.length - 1; i++) {
      final mid = (pts[i].dx + pts[i + 1].dx) / 2;
      line.cubicTo(
          mid, pts[i].dy, mid, pts[i + 1].dy, pts[i + 1].dx, pts[i + 1].dy);
    }

    final fill = Path.from(line)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.25),
            Colors.white.withValues(alpha: 0.0),
          ],
        ).createShader(Offset.zero & size),
    );

    canvas.drawPath(
      line,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant SparklinePainter old) => old.data != data;
}
