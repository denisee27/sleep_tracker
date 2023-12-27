import 'dart:ffi';
import 'dart:ui';

import 'package:intl/intl.dart';

class MulaiTidur {
  MulaiTidur(this.x, this.y, this.color);
  final double x;
  final double y;
  final Color color;
}

class BangunTidur {
  BangunTidur(this.x, this.y, this.color);
  final double x;
  final double y;
  final Color color;
}

class DurasiTidur {
  DurasiTidur(this.x, this.y, this.color);
  final DateTime x;
  final double y;
  final Color color;
}

class SleepSummary {
  AverageDuration? averageDuration;
  TotalDuration? totalDuration;
  AverageSleep? averageSleep;
  AverageSleep? averageWake;
  List<ChartDuration>? chartDuration;
  List<LineWake>? lineWake;
  List<LineSleep>? lineSleep;

  SleepSummary({this.averageDuration, this.totalDuration, this.averageSleep, this.averageWake, this.chartDuration, this.lineWake, this.lineSleep});

  SleepSummary.fromJson(Map<String, dynamic> json) {
    averageDuration = json['average_duration'] != null ? new AverageDuration.fromJson(json['average_duration']) : null;
    totalDuration = json['total_duration'] != null ? new TotalDuration.fromJson(json['total_duration']) : null;
    averageSleep = json['average_sleep'] != null ? new AverageSleep.fromJson(json['average_sleep']) : null;
    averageWake = json['average_wake'] != null ? new AverageSleep.fromJson(json['average_wake']) : null;
    if (json['chart_duration'] != null) {
      chartDuration = <ChartDuration>[];
      json['chart_duration'].forEach((v) {
        chartDuration!.add(new ChartDuration.fromJson(v));
      });
    }
    if (json['line_Wake'] != null) {
      lineWake = <LineWake>[];
      json['line_Wake'].forEach((v) {
        lineWake!.add(new LineWake.fromJson(v));
      });
    }
    if (json['line_sleep'] != null) {
      lineSleep = <LineSleep>[];
      json['line_sleep'].forEach((v) {
        lineSleep!.add(new LineSleep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.averageDuration != null) {
      data['average_duration'] = this.averageDuration!.toJson();
    }
    if (this.totalDuration != null) {
      data['total_duration'] = this.totalDuration!.toJson();
    }
    if (this.averageSleep != null) {
      data['average_sleep'] = this.averageSleep!.toJson();
    }
    if (this.averageWake != null) {
      data['average_wake'] = this.averageWake!.toJson();
    }
    if (this.chartDuration != null) {
      data['chart_duration'] = this.chartDuration!.map((v) => v.toJson()).toList();
    }
    if (this.lineWake != null) {
      data['line_Wake'] = this.lineWake!.map((v) => v.toJson()).toList();
    }
    if (this.lineSleep != null) {
      data['line_sleep'] = this.lineSleep!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AverageDuration {
  double? result;

  AverageDuration({this.result});

  AverageDuration.fromJson(Map<String, dynamic> json) {
    result = json['result'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    return data;
  }
}

class TotalDuration {
  double? result;

  TotalDuration({this.result});

  TotalDuration.fromJson(Map<String, dynamic> json) {
    result = json['result'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    return data;
  }
}

class AverageSleep {
  DateTime? averageTime;

  AverageSleep({this.averageTime});

  AverageSleep.fromJson(Map<String, dynamic> json) {
    final String averageTimeString = json['average_time'];
    averageTime = DateFormat("HH:mm").parse(averageTimeString);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average_time'] = DateFormat("HH:mm").format(this.averageTime!);
    return data;
  }
}

class ChartDuration {
  String? date;
  double? duration;

  ChartDuration({this.date, this.duration});

  ChartDuration.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    duration = json['duration'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['duration'] = this.duration;
    return data;
  }
}

class LineWake {
  String? wake;
  String? time;

  LineWake({this.wake, this.time});

  LineWake.fromJson(Map<String, dynamic> json) {
    wake = json['wake'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wake'] = this.wake;
    data['time'] = this.time;
    return data;
  }
}

class LineSleep {
  String? sleep;
  String? time;

  LineSleep({this.sleep, this.time});

  LineSleep.fromJson(Map<String, dynamic> json) {
    sleep = json['sleep'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sleep'] = this.sleep;
    data['time'] = this.time;
    return data;
  }
}
