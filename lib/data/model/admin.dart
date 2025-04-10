class AdminModel {
  int? adminId;
  String? adminName;
  String? adminEmail;
  String? adminPhoneNumber;
  int? adminBinaryPermissionsNumber;
  int? adminActive;
  String? adminCreatedDate;

  AdminModel(
      {this.adminId,
        this.adminName,
        this.adminEmail,
        this.adminPhoneNumber,
        this.adminBinaryPermissionsNumber,
        this.adminActive,
        this.adminCreatedDate});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'];
    adminName = json['admin_name'];
    adminEmail = json['admin_email'];
    adminPhoneNumber = json['admin_phone'];
    adminBinaryPermissionsNumber = json['admin_binary_permissions_number'];
    adminActive = json['admin_active'];
    adminCreatedDate = json['admin_created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['admin_name'] = this.adminName;
    data['admin_email'] = this.adminEmail;
    data['admin_phone'] = this.adminPhoneNumber;
    data['admin_binary_permissions_number'] = this.adminBinaryPermissionsNumber;
    data['admin_active'] = this.adminActive;
    data['admin_created_date'] = this.adminCreatedDate;
    return data;
  }
}