import 'package:flutter/material.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

bool _isClicked = false;

class ItemCategoriaWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final title;
  final iconsText;

  ItemCategoriaWidget(
      {Key key, @required this.title, @required this.iconsText, this.onChanged})
      : super(key: key);

  @override
  _ItemCategoriaWidgetState createState() => _ItemCategoriaWidgetState();
}

class _ItemCategoriaWidgetState extends State<ItemCategoriaWidget> {
  bool initial = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    if (initial == true){
      _isClicked = false;
    }
    print(_isClicked);
    print(widget.onChanged);
    return Row(
      children: [Expanded(
          child: InkWell(onTap: () {
            setState(() {
              initial = false;
              _isClicked = !_isClicked;
              widget.onChanged(_isClicked);
              print("HERE");
              print(_isClicked);
              print(widget.title);
              print(widget.onChanged);
          });
            
            }, child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: _isClicked ? Border.all(color: Colors.green, width: 5) : Border.all(color: Colors.grey[600], width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: scale*14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ImageIcon(
                    AssetImage(widget.iconsText)
                  )
                ],
              )
              )
              )
      )]
    ); 
  }
}
