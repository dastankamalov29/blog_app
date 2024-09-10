import 'package:flutter/material.dart';
import 'package:blog_app/models/blog_post_models.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          myIconButton(Icons.bookmark_outline),
          myIconButton(Icons.favorite_outline),
          myIconButton(Icons.share_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 15,
          top: 30,
          left: 15,
        ),
        child: ListView(
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?t=st=1725903618~exp=1725907218~hmac=e0a349083cfc9d1253292ec63638077c7165701cb12bc2dbec839e8502250e26&w=2000",
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  post.author,
                ),
                const SizedBox(width: 5),
                Text(
                  post.date,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                likeShareButton(Icons.remove_red_eye, "${post.views} Views"),
                likeShareButton(Icons.favorite, "${post.likes} Likes"),
                likeShareButton(Icons.bookmark, "${post.saves} Saves"),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                post.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                  text: "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                  children: [
                    TextSpan(
                      text: post.description,
                      style: const TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                        height: 1.5,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Wrap likeShareButton(icon, title) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.black54,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
        ),
      ],
    );
  }

  Padding myIconButton(icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.grey[200],
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
