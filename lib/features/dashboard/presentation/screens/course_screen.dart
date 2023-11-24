import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  final String img;

  const CourseScreen(this.img, {super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Color(0xFF674AEF),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF5F3FF),
                  image: DecorationImage(
                    image: AssetImage('assets/images/app_ui/${widget.img}.png'),
                  )),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFF674AEF),
                    size: 45,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Text('${widget.img} Complete Course',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            const SizedBox(height: 5,),
            Text('Created by Dear Programmer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.7)),),
            const SizedBox(height: 5,),
            Text('55 Videos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),),
            const SizedBox(height: 20,),
            Container(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  color: const Color(0xFF674AEF),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                      child: const Text('Videos', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                Material(
                  color: const Color(0xFF674AEF),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: const Text('Descripton', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                  ),
                )
              ],
            ),),

          ],
        ),
      ),
    );
  }
}
