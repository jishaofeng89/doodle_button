import 'package:flutter/material.dart';

// https://blog.csdn.net/hekaiyou/article/details/85699043
class DoodleButton extends StatefulWidget {

  final bool activation;

  final Function onTapCallback;

  final Color backgroundColor;

  final Color silentBackgroundColor;

  final String promptText;

  final Color mainColor;

  final Color silentMainColor;

  DoodleButton({
    this.activation: false,
    this.onTapCallback,
    this.backgroundColor: const Color(0xFFD95636),
    this.silentBackgroundColor: const Color(0xFF8A8A8A),
    this.promptText: '登陆',
    this.mainColor: const Color(0xFFFF6B47),
    this.silentMainColor: const Color(0xFFB2B2B2),
  });

  @override
  _DoodleButtonState createState() => _DoodleButtonState();
}

class _DoodleButtonState extends State<DoodleButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('doodle_button')),
      body: GestureDetector(
        onTap: widget.activation?
        (){
          setState((){
            widget.onTapCallback();
          });
        } : null,
        child: SizedBox(
          height: 48.0,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.activation? widget.backgroundColor: widget.silentBackgroundColor,
                    border: Border.all(
                      width: 2.0,
                      color: const Color(0xFF282828),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(2.0)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Center(
                    child: Text(
                      widget.promptText,
                      style: TextStyle(
                        color: const Color(0xFF282828),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: widget.activation? widget.mainColor: widget.silentMainColor,
                    border: Border.all(
                      width: 2.0,
                      color: const Color(0xFF282828),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(2.0),
                    ),
                  ),
                  height: 42.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}