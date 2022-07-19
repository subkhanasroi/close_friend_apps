import 'package:close_friend_apps/common/color.dart';
import 'package:close_friend_apps/model/list_friend_model.dart';
import 'package:flutter/material.dart';

class DetailFriendPage extends StatefulWidget {
  final ListFriendModel model;

  DetailFriendPage({required this.model});

  @override
  State<DetailFriendPage> createState() => _DetailFriendPageState();
}

class _DetailFriendPageState extends State<DetailFriendPage> {
  late bool _addFavorite;

  @override
  void initState() {
    super.initState();
    _addFavorite = widget.model.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .7,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.model.image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .45,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _addFavorite = !_addFavorite;
                          });
                        },
                        child: !_addFavorite
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_added))),
                const Spacer(),
                Text(
                  widget.model.name,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "My Quotes is",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.model.detail,
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: hBgRed)),
                  child: Center(
                    child: Text(
                      "Say Hai to.. ${widget.model.name}",
                      style: TextStyle(color: hBgRed),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
