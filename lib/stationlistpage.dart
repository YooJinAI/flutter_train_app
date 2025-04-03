import 'package:flutter/material.dart';
import 'styles.dart';
import 'widgets.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? excludeStation;

  const StationListPage({super.key, required this.title, this.excludeStation});

  static const _allStations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context) {
    final stations =
        excludeStation != null
            ? _allStations
                .where((station) => station != excludeStation)
                .toList()
            : _allStations;

    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return _StationListTile(
            station: stations[index],
            onTap: () => Navigator.pop(context, stations[index]),
          );
        },
      ),
    );
  }
}

class _StationListTile extends StatelessWidget {
  final String station;
  final VoidCallback onTap;

  const _StationListTile({required this.station, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.grey300!)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              station,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
