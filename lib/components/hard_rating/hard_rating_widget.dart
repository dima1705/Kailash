import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hard_rating_model.dart';
export 'hard_rating_model.dart';

class HardRatingWidget extends StatefulWidget {
  const HardRatingWidget({
    super.key,
    this.rate,
    this.size,
  });

  final double? rate;
  final int? size;

  @override
  State<HardRatingWidget> createState() => _HardRatingWidgetState();
}

class _HardRatingWidgetState extends State<HardRatingWidget> {
  late HardRatingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HardRatingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          safeSetState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.circle_sharp,
        color: Color(0xFFE8640C),
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??=
          widget!.rate != null ? widget!.rate! : 0.0,
      unratedColor: Color(0xFF606060),
      itemCount: 5,
      itemSize: valueOrDefault<double>(
        widget!.size?.toDouble(),
        12.0,
      ),
      glowColor: Color(0xFFE8640C),
    );
  }
}
