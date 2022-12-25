class WasteRequestFilter {
  int pageNumber;
  int pageSize;
  List<String>? costCenterArray;
  List<String>? statusArray;
  List<String>? roomArray;
  List<String>? buildingArray;
  List<String>? requestTypeArray;
  int? frequency;

  WasteRequestFilter(
      {required this.pageNumber,
      required this.pageSize,
      this.costCenterArray,
      this.statusArray,
      this.roomArray,
      this.buildingArray,
      this.requestTypeArray,
      this.frequency});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;

    if (costCenterArray != null) {
      data['costCenterArray'] = costCenterArray;
    }
    if (statusArray != null) {
      data['statusArray'] = statusArray;
    }
    if (roomArray != null) {
      data['roomArray'] = roomArray;
    }
    if (buildingArray != null) {
      data['buildingArray'] = buildingArray;
    }
    if (requestTypeArray != null) {
      data['requestTypeArray'] = requestTypeArray;
    }
    data['frequency'] = frequency;

    return data;
  }
}
