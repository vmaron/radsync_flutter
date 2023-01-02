import 'package:json_annotation/json_annotation.dart';
part 'request.g.dart';

@JsonSerializable()
class WasteRequestResponse {
  WasteRequestResponse({
    required this.totalCount,
    required this.pageCount,
    required this.data,
    required this.succeeded,
  });

  int totalCount;
  int pageCount;
  List<WasteRequest> data = <WasteRequest>[];
  bool succeeded;

  factory WasteRequestResponse.fromJson(Map<String, dynamic> json) => _$WasteRequestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WasteRequestResponseToJson(this);
}

@JsonSerializable()
class WasteRequest {
  WasteRequest({
    required this.dropoffContainers,
    required this.pickupContainers,
    this.id,
    this.buildingId,
    this.buildingName,
    this.departmentId,
    this.departmentName,
    this.pickupConfirmed,
    this.firstName,
    this.lastName,
    this.roomNumber,
    this.managerName,
    this.contactType,
    this.phoneNumber,
    this.costCenter,
    this.comments,
    this.pickup,
    this.dropoff,
    this.createdTime,
    this.createdByName,
    this.completedTime,
    this.completedByName,
    this.status,
    this.recurrence,
    this.frequency,
    this.startOn,
    this.endBy,
    this.nextScheduledDate,
    this.canceledUntil,
  });

  int? id;
  int? buildingId;
  String? buildingName;
  int? departmentId;
  String? departmentName;
  bool? pickupConfirmed;
  String? firstName;
  String? lastName;
  String? roomNumber;
  String? managerName;
  int? contactType;
  String? phoneNumber;
  String? costCenter;
  String? comments;
  bool? pickup;
  bool? dropoff;
  DateTime? createdTime;
  String? createdByName;
  DateTime? completedTime;
  String? completedByName;
  int? status;
  int? recurrence;
  int? frequency;
  DateTime? startOn;
  DateTime? endBy;
  DateTime? nextScheduledDate;
  DateTime? canceledUntil;

  Containers dropoffContainers = Containers(solids: []);
  Containers pickupContainers = Containers(solids: []);

  factory WasteRequest.fromJson(Map<String, dynamic> json) => _$WasteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$WasteRequestToJson(this);
}

@JsonSerializable()
class Containers {
  Containers({
    this.total25GalContainers,
    this.total50GalContainers,
    this.totalVialsContainers,
    this.cocktailName,
    required this.solids,
  });

  int? total25GalContainers;
  int? total50GalContainers;
  int? totalVialsContainers;
  String? cocktailName;
  List<Solid> solids = <Solid>[];

  factory Containers.fromJson(Map<String, dynamic> json) => _$ContainersFromJson(json);
  Map<String, dynamic> toJson() => _$ContainersToJson(this);
}

@JsonSerializable()
class Solid {
  Solid({
    this.isotopeId,
    this.isotope,
    this.qty,
  });

  int? isotopeId;
  String? isotope;
  int? qty;

  factory Solid.fromJson(Map<String, dynamic> json) => _$SolidFromJson(json);
  Map<String, dynamic> toJson() => _$SolidToJson(this);
}
