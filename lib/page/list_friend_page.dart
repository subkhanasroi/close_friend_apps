import 'package:close_friend_apps/common/color.dart';
import 'package:close_friend_apps/common/string.dart';
import 'package:close_friend_apps/model/list_friend_model.dart';
import 'package:close_friend_apps/page/detail_friend_page.dart';
import 'package:flutter/material.dart';

class ListFriendPage extends StatelessWidget {
  const ListFriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Friend",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: hBgColor,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<ListFriendModel> model = kSListFriend;
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: model.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailFriendPage(model: model[index]);
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(1),
              height: 200,
              width: MediaQuery.of(context).size.width * .5,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(model[index].image),
                    radius: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        });
  }
}
