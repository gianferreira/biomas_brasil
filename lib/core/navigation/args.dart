import 'package:biomas_brasil/features/biome/list/domain/entities/biome_entity.dart';
import 'package:biomas_brasil/features/user/signup/domain/entities/user_entity.dart';

abstract class Args {}

class UserArgs extends Args {
  final UserEntity user;

  UserArgs({
    required this.user,
  });
}

class BiomeArgs extends Args {
  final BiomeEntity biome;
  final UserEntity user;

  BiomeArgs({
    required this.biome,
    required this.user,
  });
}
