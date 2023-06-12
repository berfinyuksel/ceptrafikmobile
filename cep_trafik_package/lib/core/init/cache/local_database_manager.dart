import 'package:cep_trafik_package/core/constants/enums/local_database_constants.dart';
import 'package:cep_trafik_package/core/init/cache/local_database_service.dart';

import '../../../feature/sample/model/sample_model.dart';

class LocalDatabaseManager {
static LocalDatabaseManager? _instance;
static LocalDatabaseManager get instance {
return _instance ??= LocalDatabaseManager.init();
}
 
LocalDatabaseManager.init();
 
  late LocalDatabaseService<SampleModel>? sampleMananager = LocalDatabaseService(storeName: LocalDatabaseConstants.sample.name);
  late LocalDatabaseService<SampleModel>? isparkManager = LocalDatabaseService(storeName: LocalDatabaseConstants.ispark.name);
}