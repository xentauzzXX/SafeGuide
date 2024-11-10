import 'package:safeguide/models/content_data.dart';
// import 'package:safeguide/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.contentData});
  final ContentData contentData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Tambahkan variabel untuk melacak status bookmark
  bool isBookmarked = false;

  // Fungsi untuk toggle status bookmark
  void _toggleBookmark(BuildContext context) {
    setState(() {
      isBookmarked = !isBookmarked;
    });

    // Menampilkan Snackbar dengan pesan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isBookmarked
              ? 'Telah ditambahkan ke bookmark'
              : 'Telah dihapus dari bookmark',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const Gap(68),
          buildHeader(),
          const Gap(24),
          buildImage(),
          const Gap(20),
          buildMainInfo(),
          const Gap(20),
          buildDescription(),
          const Gap(30),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const ImageIcon(
            AssetImage('assets/ic_arrow_left.png'),
          ),
        ),
        const Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff242424),
          ),
        ),
        IconButton(
          onPressed: () => _toggleBookmark(context),
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_add,
            color: isBookmarked ? const Color(0xffC67C4E) : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        widget.contentData.image,
        width: double.infinity,
        height: 202,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMainInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.contentData.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff242424),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(4),
                Text(
                  widget.contentData.type,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xffA2A2A2),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Gap(16),
        const Divider(
          indent: 16,
          endIndent: 16,
          color: Color(0xffE3E3E3),
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff242424),
          ),
        ),
        const Gap(8),
        ReadMoreText(
          widget.contentData.description,
          trimLength: 110,
          trimMode: TrimMode.Length,
          trimCollapsedText: ' Read More',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Color(0xffA2A2A2),
          ),
          moreStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffC67C4E),
          ),
          lessStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffC67C4E),
          ),
        ),
      ],
    );
  }
}
