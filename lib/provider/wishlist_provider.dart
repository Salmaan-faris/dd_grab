import 'package:dd_grab/viewmodels/whislist_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistProvider = ChangeNotifierProvider((ref) => WishlistViewModel());
