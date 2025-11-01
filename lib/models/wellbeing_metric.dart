class WellbeingMetric {
  // 1. Properties
  final String metricType;
  final DateTime timestamp;
  Map<String, dynamic> data;

  // 2. Constructor
  WellbeingMetric({
    required this.metricType,
    required this.timestamp,
    required this.data,
  });

  // 3. Convert object to Map (for storage, e.g., Firestore or local DB)
  Map<String, dynamic> toJson() {
    return {
      'metricType': metricType,
      'timestamp':
          timestamp.toIso8601String(), // store as string for JSON safety
      'data': data,
    };
  }

  // 4. Create object from Map (e.g., when reading from database)
  factory WellbeingMetric.fromJson(Map<String, dynamic> json) {
    return WellbeingMetric(
      metricType: json['metricType'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: Map<String, dynamic>.from(json['data'] as Map),
    );
  }
}
