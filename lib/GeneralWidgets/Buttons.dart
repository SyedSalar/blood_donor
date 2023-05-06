import '../Constants/Imports.dart';

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.width = 0,
      this.height = 0,
      this.borderRadius = 0,
      this.color = Colors.white,
      this.fontColor = Colors.black,
      this.fontWeight = FontWeight.w400,
      this.suffixIcon = const SizedBox(
        width: 0,
        height: 0,
      ),
      this.prefixIcon = const SizedBox(
        width: 0,
        height: 0,
      ),
      this.shadow = const BoxShadow(color: Colors.transparent)})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final Color fontColor;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final double borderRadius;
  final BoxShadow shadow;
  final FontWeight fontWeight;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late final width = MediaQuery.of(context).size.width;
  late final height = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.03),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: widget.height != 0 ? widget.height : width * 0.13,
          width: widget.width != 0 ? widget.width : width * 0.9,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(
                  widget.borderRadius != 0 ? widget.borderRadius : 500),
              boxShadow: widget.shadow.color != Colors.transparent
                  ? [widget.shadow]
                  : [],
              border: Border.all(
                  color: widget.color == Colors.white
                      ? const Color(0xFFBBBBBB)
                      : Colors.transparent)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.prefixIcon,
                Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: widget.fontColor,
                      fontWeight: widget.fontWeight),
                ),
                widget.suffixIcon
              ],
            ),
          ),
        ),
      ),
    );
  }
}
