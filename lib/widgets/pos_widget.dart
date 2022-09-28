import 'package:flutter/material.dart';
import 'package:mirea_db_2/model/pos_model.dart';

class PosWidget extends StatelessWidget {
  const PosWidget(
      {Key? key,
      required this.pos,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);
  final Pos pos;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        color: Color.fromARGB(104, 177, 177, 177),
        elevation: 2.0,
        child: ListTile(
          textColor: Color.fromARGB(255, 255, 255, 255),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),

            child: pos.picture != null
                ? Image.memory(pos.picture!)
                : const Icon(Icons.add_a_photo),
          ),
          title: Text(pos.title),
          //d
          subtitle: Text(pos.description),
        ),
      ),
    );
  } 
}
