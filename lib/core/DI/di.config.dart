// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source_contract/product_data_source.dart' as _i4;
import '../../data/data_source_impl/product_data_source_impl.dart' as _i5;
import '../../data/repository_impl/products_repository_impl.dart' as _i7;
import '../../domain/repository_contract/products_repository.dart' as _i6;
import '../../domain/use_cases/products_use_case.dart' as _i8;
import '../../layouts/products/view_models/products_view_model_cubit.dart'
    as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductDataSource>(
        () => _i5.ProductDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductsRepository>(
        () => _i7.ProductsRepositoryImpl(gh<_i4.ProductDataSource>()));
    gh.factory<_i8.ProductsUseCase>(
        () => _i8.ProductsUseCase(gh<_i6.ProductsRepository>()));
    gh.factory<_i9.ProductsViewModelCubit>(
        () => _i9.ProductsViewModelCubit(gh<_i8.ProductsUseCase>()));
    return this;
  }
}
