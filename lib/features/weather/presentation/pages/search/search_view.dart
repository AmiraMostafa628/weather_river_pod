import 'package:flutter/material.dart';
import 'package:weather_app/core/components/custom_text_form_field.dart';
import 'package:weather_app/features/weather/presentation/pages/home/home_view.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: CustomTextFormField(
              suffixIcon: Icons.search,
              onSubmit: (city) {

                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => HomeView(isSearch: true,cityName: city,)));
              },
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => HomeView(isSearch: true,cityName: searchController.text,)));
              },
              text: 'search',
              textEditingController: searchController),
        ),
      ),
    );
  }
}
