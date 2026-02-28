import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qunova/core/service/api_service.dart';
import 'package:qunova/utils/color/app_color.dart';
import 'package:qunova/view/screens/contact_home/controller/contact_controller.dart';
import 'package:qunova/view/screens/contact_home/repo/contact_repo.dart';

class ContactHomeScreen extends StatefulWidget {
  const ContactHomeScreen({super.key});

  @override
  State<ContactHomeScreen> createState() => _ContactHomeScreenState();
}

class _ContactHomeScreenState extends State<ContactHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fabController;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ContactRepo(apiService: Get.find()));
    final controller =
    Get.put(ContactController(contactRepo: Get.find()));

    controller.getContactList();

    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fabAnimation = CurvedAnimation(parent: _fabController, curve: Curves.easeOutBack);
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String getCategoryImageUrl(String? id) {
      switch (id) {
        case "family":
          return "https://images.unsplash.com/photo-1511895426328-dc8714191300?w=150&q=80";
        case "friends":
          return "https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=150&q=80";
        case "work":
          return "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=150&q=80";
        case "all":
        default:
          return "https://images.unsplash.com/photo-1491438590914-bc09fcaaf77a?w=150&q=80";
      }
    }

    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white_100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: GetBuilder<ContactController>(builder: (controller) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.isSearching
                  ? _buildSearchField(controller)
                  : _buildDefaultAppBar(controller),
            );
          }),
        ),
        floatingActionButton: ScaleTransition(
          scale: _fabAnimation,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.add, color: AppColors.white_100),
          ),
        ),
        body: GetBuilder<ContactController>(
          builder: (controller) {

            if (!controller.isLoading &&
                controller.contactList.isNotEmpty) {
              _fabController.forward();
            }

            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.contactList.isEmpty) {
              return const Center(child: Text("No Contacts Found"));
            }

            return SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.onRefresh,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          final category = controller.categoryList[index];

                          final isSelected = controller.selectedCategoryId == category.id;

                          return GestureDetector(
                            onTap: () => controller.setCategory(category.id ?? "all"),
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: 1),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOut,
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(0, 20 * (1 - value)),
                                    child: child,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    // DESIGN FIX: The "Ring" around the image
                                    Container(
                                      padding: const EdgeInsets.all(3), // Space for the border
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected ? AppColors.primary : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.grey[200],
                                        backgroundImage: NetworkImage(getCategoryImageUrl(category.id)),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      category.name ?? "",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                        color: isSelected ? AppColors.primary : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                    ),
                  ),

                  const Divider(height: 1),

                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.filteredContacts.length,
                      itemBuilder: (context, index) {
                        final delay = index * 80;

                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: Duration(milliseconds: 500 + delay),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 40 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                controller.filteredContacts[index].avatarUrl ?? "",
                              ),
                            ),
                            title: Text(
                              controller.filteredContacts[index].name ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF455A64),
                              ),
                            ),
                            subtitle: Text(
                              controller.filteredContacts[index].phone ?? "",
                              style:
                              const TextStyle(color: Colors.grey),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

  }
  Widget _buildDefaultAppBar(ContactController controller) {
    return Row(
      key: const ValueKey("default_bar"),
      children: [
        const Text("Contact", style: TextStyle(color: Color(0xFF455A64), fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(width: 20),
        const Text("Recent", style: TextStyle(color: Colors.grey, fontSize: 18)),
        const Spacer(),
        IconButton(
          onPressed: () => controller.toggleSearch(),
          icon: const Icon(Icons.search, color: Color(0xFF455A64)),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Color(0xFF455A64)),
        ),
      ],
    );
  }

  Widget _buildSearchField(ContactController controller) {
    return Container(
      key: const ValueKey("search_bar"),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller.searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () => controller.toggleSearch(),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
        onChanged: (value) => controller.filterSearch(value),
      ),
    );
  }
}