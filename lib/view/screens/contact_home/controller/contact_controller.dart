import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qunova/core/global/api_response_model.dart';
import 'package:qunova/view/screens/contact_home/model/contact_model.dart';
import 'package:qunova/view/screens/contact_home/repo/contact_repo.dart';

class ContactController extends GetxController {
  final ContactRepo contactRepo;

  ContactController({required this.contactRepo});

  bool isLoading = false;

  final List<Category> categoryList = [];
  final List<Contact> contactList = [];

  final RefreshController refreshController = RefreshController();

  String selectedCategoryId = "all";
  void setCategory(String id) {
    selectedCategoryId = id;
    update();
  }

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  String searchQuery = "";
  void filterSearch(String query) {
    searchQuery = query.toLowerCase();
    update();
  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchController.clear();
      searchQuery = "";
    }
    update();
  }

  List<Contact> get filteredContacts {
    List<Contact> tempContacts = contactList;

    if (selectedCategoryId != "all") {
      tempContacts = tempContacts.where((contact) => contact.categoryId == selectedCategoryId).toList();
    }
    if (searchQuery.isNotEmpty) {
      tempContacts = tempContacts.where((contact) =>
      (contact.name?.toLowerCase().contains(searchQuery) ?? false) || (contact.phone?.contains(searchQuery) ?? false)).toList();
    }

    return tempContacts;
  }

  Future<void> getContactList({bool isRefresh = false}) async {
    try {
      isLoading = true;
      update();

      ApiResponseModel responseModel =
      await contactRepo.getContactList();

      debugPrint("Status Code: ${responseModel.statusCode}");

      if (responseModel.statusCode == 200) {
        ContactModel contactModel =
        ContactModel.fromJson(jsonDecode(responseModel.responseJson));

        if (contactModel.status == "success") {

          categoryList.clear();
          contactList.clear();

          categoryList.addAll(contactModel.data!.categories);
          contactList.addAll(contactModel.data!.contacts);
        }
      }

      if (isRefresh) {
        refreshController.refreshCompleted();
      }

    } catch (e) {
      debugPrint("Contact Error: $e");

      if (isRefresh) {
        refreshController.refreshFailed();
      }

    } finally {
      isLoading = false;
      update();
    }
  }

  void onRefresh() {
    getContactList(isRefresh: true);
  }
}