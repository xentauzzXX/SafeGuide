import 'package:safeguide/models/content_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String categorySelected = 'All contentData';
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            buildBackground(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Gap(68),
                  buildHeader(),
                  const Gap(30),
                  buildSearch(),
                  const Gap(24),
                  buildBanner(),
                ],
              ),
            ),
          ],
        ),
        const Gap(24),
        buildCategories(),
        const Gap(16),
        buildGridContentData(),
        const Gap(30),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      height: 280,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff111111),
            Color(0xff313131),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Welcome!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff2A2A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              children: [
                ImageIcon(
                  AssetImage('assets/ic_search.png'),
                  color: Colors.white,
                ),
                Gap(8),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Cari Kata Kunci',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xffA2A2A2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/banner.png',
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCategories() {
    final categories = [
      'Semua Kategori',
      'Medis',
      'Bencana',
    ];
    return SizedBox(
      height: 29,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String category = categories[index];
          bool isActive = categorySelected == category;
          return GestureDetector(
            onTap: () {
              categorySelected = category;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 24 : 8,
                right: index == categories.length - 1 ? 24 : 8,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xffC67C4E)
                    : const Color(0xffEDEDED).withOpacity(0.35),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 14,
                  color: isActive ? Colors.white : const Color(0xff313131),
                ),
              ),
            ),
          );
        },
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
                        Icons.bookmark_add,
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
