import 'package:pdf/widgets.dart';
import 'package:models/models.dart';

class WrapperSegment extends StatelessWidget {
  WrapperSegment({
    required this.child,
    required this.indexSegment,
    required this.formatImage,
    required this.kSegmentsWidth,
    required this.kSegmentsHeight,
  });

  final Widget child;
  final int indexSegment;
  final int kSegmentsWidth;
  final int kSegmentsHeight;
  final FormatImage formatImage;

  @override
  Widget build(Context context) {
    return Row(
      children: [
        Text(
          indexSegment.toString(),
        ),
        VerticalDivider(),
        Expanded(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: generateSizeSegment(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: generateSizeSegment(
                        isVertical: false,
                      ),
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Text> generateSizeSegment({bool isVertical = true}) {
    return List.generate(
        (formatImage == FormatImage.a4
            ? isVertical
                ? kSegmentsHeight
                : kSegmentsWidth
            : isVertical
                ? kSegmentsHeight
                : kSegmentsWidth),
        (index) => Text((index + 1).toString())).toList();
  }
}
