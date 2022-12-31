// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WasteRequestResponse _$WasteRequestResponseFromJson(
        Map<String, dynamic> json) =>
    WasteRequestResponse(
      totalCount: json['totalCount'] as int,
      pageCount: json['pageCount'] as int,
      data: json['data'] as List<dynamic>,
      succeeded: json['succeeded'] as bool,
    );

Map<String, dynamic> _$WasteRequestResponseToJson(
        WasteRequestResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'data': instance.data,
      'succeeded': instance.succeeded,
    };

WasteRequest _$WasteRequestFromJson(Map<String, dynamic> json) => WasteRequest(
      dropoffContainers: json['dropoffContainers'],
      pickupContainers: json['pickupContainers'],
      id: json['id'] as int?,
      buildingId: json['buildingId'] as int?,
      buildingName: json['buildingName'] as String?,
      departmentId: json['departmentId'] as int?,
      departmentName: json['departmentName'] as String?,
      pickupConfirmed: json['pickupConfirmed'] as bool?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      roomNumber: json['roomNumber'] as String?,
      managerName: json['managerName'] as String?,
      contactType: json['contactType'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      costCenter: json['costCenter'] as String?,
      comments: json['comments'] as String?,
      pickup: json['pickup'] as bool?,
      dropoff: json['dropoff'] as bool?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      createdByName: json['createdByName'] as String?,
      completedTime: json['completedTime'] == null
          ? null
          : DateTime.parse(json['completedTime'] as String),
      completedByName: json['completedByName'] == null
          ? null
          : DateTime.parse(json['completedByName'] as String),
      status: json['status'] as int?,
      recurrence: json['recurrence'] as int?,
      frequency: json['frequency'] as int?,
      startOn: json['startOn'] == null
          ? null
          : DateTime.parse(json['startOn'] as String),
      endBy: json['endBy'] == null
          ? null
          : DateTime.parse(json['endBy'] as String),
      nextScheduledDate: json['nextScheduledDate'] == null
          ? null
          : DateTime.parse(json['nextScheduledDate'] as String),
      canceledUntil: json['canceledUntil'] == null
          ? null
          : DateTime.parse(json['canceledUntil'] as String),
    );

Map<String, dynamic> _$WasteRequestToJson(WasteRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buildingId': instance.buildingId,
      'buildingName': instance.buildingName,
      'departmentId': instance.departmentId,
      'departmentName': instance.departmentName,
      'pickupConfirmed': instance.pickupConfirmed,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'roomNumber': instance.roomNumber,
      'managerName': instance.managerName,
      'contactType': instance.contactType,
      'phoneNumber': instance.phoneNumber,
      'costCenter': instance.costCenter,
      'comments': instance.comments,
      'pickup': instance.pickup,
      'dropoff': instance.dropoff,
      'createdTime': instance.createdTime?.toIso8601String(),
      'createdByName': instance.createdByName,
      'completedTime': instance.completedTime?.toIso8601String(),
      'completedByName': instance.completedByName?.toIso8601String(),
      'status': instance.status,
      'recurrence': instance.recurrence,
      'frequency': instance.frequency,
      'startOn': instance.startOn?.toIso8601String(),
      'endBy': instance.endBy?.toIso8601String(),
      'nextScheduledDate': instance.nextScheduledDate?.toIso8601String(),
      'canceledUntil': instance.canceledUntil?.toIso8601String(),
      'dropoffContainers': instance.dropoffContainers,
      'pickupContainers': instance.pickupContainers,
    };

Containers _$ContainersFromJson(Map<String, dynamic> json) => Containers(
      total25GalContainers: json['total25GalContainers'] as int?,
      total50GalContainers: json['total50GalContainers'] as int?,
      totalVialsContainers: json['totalVialsContainers'] as int?,
      cocktailName: json['cocktailName'] as String?,
      solids: json['solids'] as List<dynamic>,
    );

Map<String, dynamic> _$ContainersToJson(Containers instance) =>
    <String, dynamic>{
      'total25GalContainers': instance.total25GalContainers,
      'total50GalContainers': instance.total50GalContainers,
      'totalVialsContainers': instance.totalVialsContainers,
      'cocktailName': instance.cocktailName,
      'solids': instance.solids,
    };

Solid _$SolidFromJson(Map<String, dynamic> json) => Solid(
      isotopeId: json['isotopeId'] as int?,
      isotope: json['isotope'] as String?,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$SolidToJson(Solid instance) => <String, dynamic>{
      'isotopeId': instance.isotopeId,
      'isotope': instance.isotope,
      'qty': instance.qty,
    };
