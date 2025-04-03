import 'package:flutter/material.dart';
import 'stationlistpage.dart';
import 'seatpage.dart';
import 'styles.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;

  void _selectStation(bool isDeparture) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder:
            (context) => StationListPage(
              title: isDeparture ? '출발역' : '도착역',
              excludeStation: isDeparture ? arrivalStation : departureStation,
            ),
      ),
    );
    if (result != null) {
      setState(() {
        if (isDeparture) {
          departureStation = result;
        } else {
          arrivalStation = result;
        }
      });
    }
  }

  void _navigateToSeatPage() {
    if (departureStation != null && arrivalStation != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => SeatPage(
                departureStation: departureStation!,
                arrivalStation: arrivalStation!,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const CustomAppBar(title: '기차 예매', showBackButton: false),
        backgroundColor: AppColors.grey300,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: AppDecorations.roundedBox,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StationSelector(
                      label: '출발역',
                      station: departureStation,
                      onTap: () => _selectStation(true),
                    ),
                    Container(width: 2, height: 50, color: AppColors.grey300),
                    StationSelector(
                      label: '도착역',
                      station: arrivalStation,
                      onTap: () => _selectStation(false),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PurpleButton(
                text: '좌석 선택',
                onPressed:
                    departureStation != null && arrivalStation != null
                        ? _navigateToSeatPage
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
