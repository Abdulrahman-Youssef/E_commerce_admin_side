class AppLinks {
  //this to be used in image path
  static const String localeHost = "http://10.0.2.2";
  static const String localeServerPhysicalDevice = "http://192.168.1.2/ecommerce_w";


  static const String _serverEmulator = "http://10.0.2.2/ecommerce_w";
  static const String _serverPhysicalDevice = "http://192.168.1.2/ecommerce_w";
  static const String _server = _serverPhysicalDevice;

  // admins side folder
  static const String _adminSideFolder = "$_serverPhysicalDevice/admin_side";

  // auth folder
  static const String _authFolder = "$_adminSideFolder/auth";
  static const String login = "$_authFolder/login.php";

  //manage items folder
  static const String _manageUsersFolder = "$_adminSideFolder/manageItems";
  static const String getAllItems = "$_manageUsersFolder/getAllItems.php";
  static const String deleteItem = "$_manageUsersFolder/deleteItem.php";
  // add item
  static const String _addItemFolder = "$_manageUsersFolder/add_edit_item";
  static const String addItem = "$_addItemFolder/addItem.php";
  static const String addItemWithImage = "$_addItemFolder/addItemWithImage.php";
  //edite item
  static const String editItemWithImage = "$_manageUsersFolder/editItem.php";


}
