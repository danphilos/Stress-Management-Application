import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/navigation.dart';

class SongCard extends StatefulWidget {
  final String source;
  final String name;
  const SongCard(this.source, this.name, {super.key});

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        moveToPlaySong(widget.source, widget.name);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 16, left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.white30),
        ),
        child: Row(
          children: [
            const Icon(Icons.play_circle, color: Colors.white,),
            const SizedBox(width: 12,),
            Text(
            widget.name,
            style: const TextStyle(color: Colors.white, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}