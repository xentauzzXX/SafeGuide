import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safeguide/models/content_data.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final List<ContentData> bookmarkedItems = []; // Daftar item bookmark

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        backgroundColor: const Color(0xff111111),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Gap(24),
          buildGridContentData(),
        ],
      ),
    );
  }

  Widget buildGridContentData() {
    return GridView.builder(
      itemCount: listGridContentData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 238,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        ContentData contentData = listGridContentData[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: contentData);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        contentData.image,
                        height: 128,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  contentData.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff242424),
                  ),
                ),
                const Gap(4),
                Text(
                  contentData.type,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xffA2A2A2),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGridBookmarkedContent() {
    if (bookmarkedItems.isEmpty) {
      return const Center(
        child: Text(
          'No bookmarks yet!',
          style: TextStyle(fontSize: 16, color: Color(0xffA2A2A2)),
        ),
      );
    }

    return GridView.builder(
      itemCount: bookmarkedItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 238,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 16),
      itemBuilder: (context, index) {
        ContentData contentData = bookmarkedItems[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: contentData);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    contentData.image,
                    height: 128,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(8),
                Text(
                  contentData.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff242424),
                  ),
                ),
                const Gap(4),
                Text(
                  contentData.type,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xffA2A2A2),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xffC67C4E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.bookmark_remove,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
