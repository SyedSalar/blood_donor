import '../Constants/Imports.dart';

class DropDownField extends StatefulWidget {
  DropDownField(
      {Key? key, required this.title, required this.list, this.iconSize = 35})
      : super(key: key);

  String title;
  List<String> list;
  final double iconSize;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  late bool onPressed = false;
  late List<String> temp = [];

  @override
  void initState() {
    for (int i = 0; i <= widget.list.length; i++) {
      if (i == 0) {
        temp.add(widget.title);
      } else {
        temp.add(widget.list[i - 1]);
      }
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 0.06.sh,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5, color: const Color(0xFFC7C7C7)),
          borderRadius: BorderRadius.circular(12.sp)),
      child: DropdownButton<String>(
        value: widget.title,
        alignment: Alignment.centerLeft,
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.grey,
        iconSize: widget.iconSize,
        onTap: () {
          setState(() {
            onPressed = true;
          });
        },
        isExpanded: true,
        icon: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF49454F),
          ),
        ),
        hint: Text(
          widget.title,
          textAlign: TextAlign.left,
          style: TextStyle(color: AppColors.field),
        ),
        underline: Container(),
        style: TextStyle(
          color: temp[0] != widget.title ? AppColors.font : AppColors.field,
          fontSize: 13.sp,
        ),
        items: temp.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.title = newValue!;
          });
        },
        borderRadius: BorderRadius.circular(width * .01),
      ),
    );
  }
}
