import 'package:flutter/material.dart';
class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('BmiCalculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: RepeatContainerCode(
                      colors: Color(0xFF1D1E33),

                    ),
                  ),
                  Expanded(
                    child: RepeatContainerCode(
                      colors: Color(0xFF1D1E33),
                    ),
                  ),
                ],
            ),),
            Expanded(child:RepeatContainerCode(  colors: Color(0xFF1D1E33),),
            ),
            Expanded(child:Row(
            children: <Widget>[
            Expanded(child: RepeatContainerCode(
              colors: Color(0xFF1D1E33),
            ),
            ),
            Expanded(child:RepeatContainerCode(  colors: Color(0xFF1D1E33),),
            ),
          ],
        ),),
          ],
        )
    );
  }
}

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({@required this.colors.});
 final Color colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
    );
  }
}
