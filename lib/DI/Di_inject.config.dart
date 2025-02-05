// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Apis/api%20manager.dart' as _i227;
import '../category/Newsbuilder/News_viewmodel_bloc.dart' as _i763;
import '../category/Newsbuilder/sources_viewmodel_bloc.dart' as _i695;
import '../Repositry/News/Data_Sources/News_Offline_DataSurces.dart' as _i767;
import '../Repositry/News/Data_Sources/News_offline_DataSurces_Impl.dart'
    as _i121;
import '../Repositry/News/Data_Sources/News_remote_DataSurces.dart' as _i704;
import '../Repositry/News/Data_Sources/News_remote_DataSurces_Impl.dart'
    as _i147;
import '../Repositry/News/News_repositry/News%20_Repositry.dart' as _i778;
import '../Repositry/News/News_repositry/NewsRepositry%20impl.dart' as _i242;
import '../Repositry/Sources/dataSources/Source-remoteb_dataSource.dart'
    as _i627;
import '../Repositry/Sources/dataSources/Source_offline_datasource.dart'
    as _i660;
import '../Repositry/Sources/dataSources/Source_offline_datasource_impl.dart'
    as _i671;
import '../Repositry/Sources/dataSources/SourceRemoteDataSource%20impl.dart'
    as _i859;
import '../Repositry/Sources/Repositry/SourcesRepositry.dart' as _i116;
import '../Repositry/Sources/Repositry/SourcesRepositry_impl.dart' as _i8;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i227.ApiManeger>(() => _i227.ApiManeger());
    gh.factory<_i767.NewsOfflineDatasurcesDataSources>(
        () => _i121.News_Offline_DataSurces_Impl());
    gh.factory<_i660.Source_offline_DataSource>(
        () => _i671.Source_offline_datasource_impl());
    gh.factory<_i704.NewsRemoteDataSources>(() =>
        _i147.News_remote_DataSurces_Impl(apiManeger: gh<_i227.ApiManeger>()));
    gh.factory<_i627.SourceRemoteDataSource>(() =>
        _i859.SourceRemoteDataSourceImpl(apiManeger: gh<_i227.ApiManeger>()));
    gh.factory<_i778.NewsRepositry>(() => _i242.NewsRepositryImpl(
          newsRemoteDataSources: gh<_i704.NewsRemoteDataSources>(),
          newsOfflineDataSource: gh<_i767.NewsOfflineDatasurcesDataSources>(),
        ));
    gh.factory<_i116.Sources_Respositry>(() => _i8.Sources_Respositry_impl(
          sourceRemoteDataSource: gh<_i627.SourceRemoteDataSource>(),
          sourceOfflineDataSource: gh<_i660.Source_offline_DataSource>(),
        ));
    gh.factory<_i763.News_ViewModel_Bloc>(() =>
        _i763.News_ViewModel_Bloc(newsRepositry: gh<_i778.NewsRepositry>()));
    gh.factory<_i695.Sources_bloc_viewModel>(() => _i695.Sources_bloc_viewModel(
        sources_respositry: gh<_i116.Sources_Respositry>()));
    return this;
  }
}
