import '../Constants/Imports.dart';

class InputField extends StatefulWidget {
  InputField(
      {Key? key,
      required this.text,
      required this.controller,
      this.obscure = false,
      this.suffix = const SizedBox(
        width: 0,
        height: 0,
      ),
      this.borderRadius = 0,
      this.selectedColor = const Color(0xFFDF0028),
      this.hint = "",
      this.onTap = defaultFunction,
      this.enable = true,
      this.fontSize = 18,
      this.width = 0,
      this.height = 0})
      : super(key: key);

  final String text;

  final TextEditingController controller;
  final bool obscure;
  final Color selectedColor;
  final String hint;
  final VoidCallback onTap;
  static defaultFunction() {}
  final bool enable;
  final Widget suffix;
  final double fontSize;
  final double borderRadius;
  final double width;
  final double height;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final width = MediaQuery.of(context).size.width;
  late final height = MediaQuery.of(context).size.height;
  bool ontap = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.05),
      child: SizedBox(
        height: widget.height == 0 ? height * 0.07 : widget.height,
        width: widget.width == 0 ? width : widget.width,
        child: TextFormField(
          enabled: widget.enable,
          onTap: widget.onTap,
          controller: widget.controller,
          cursorColor: Colors.black,
          style: TextStyle(fontSize: widget.fontSize),
          obscureText: widget.obscure ? ontap : false,
          decoration: InputDecoration(
            suffixIcon: widget.obscure
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                        onTap: () => setState(() {
                              ontap = !ontap;
                            }),
                        child: Icon(
                          ontap ? Icons.panorama_fish_eye : Icons.circle,
                          color: const Color(0xFF1C1B1F),
                        )),
                  )
                : widget.suffix,
            border: InputBorder.none,
            labelText: widget.text,
            contentPadding: const EdgeInsets.all(20.0),
            hintText: widget.hint,
            hintStyle: const TextStyle(fontSize: 18),
            floatingLabelStyle:
                TextStyle(fontSize: 20, color: widget.selectedColor),
            labelStyle: TextStyle(color: AppColors.field),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1.5, color: Color(0xFFC7C7C7)),
                borderRadius: BorderRadius.circular(widget.borderRadius == 0
                    ? width * 0.01
                    : widget.borderRadius)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: widget.selectedColor),
                borderRadius: BorderRadius.circular(widget.borderRadius == 0
                    ? width * 0.01
                    : widget.borderRadius)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1.5, color: Color(0xFFC7C7C7)),
                borderRadius: BorderRadius.circular(widget.borderRadius == 0
                    ? width * 0.01
                    : widget.borderRadius)),
          ),
        ),
      ),
    );
  }
}
