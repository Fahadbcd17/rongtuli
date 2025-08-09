import 'package:rong_tuli/consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Title".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.teal)),
            Row(
              children: [
                Expanded(child: TextFormField()),
                IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: redColor)),
              ],
            ).box.height(60).padding(const EdgeInsets.all(12)).make()
          ],
        ),
      ),

    );
  }
}