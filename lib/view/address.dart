import 'package:dd_grab/viewmodels/address_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressFormProvider = StateProvider<Map<String, String>>(
  (ref) => {
    'first_name': '',
    'last_name': '',
    'address_1': '',
    'address_2': '',
    'city': '',
    'state': '',
    'zip': '',
    'country': '',
  },
);

class AddressPage extends ConsumerWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addressViewModelProvider);
    ref.read(addressViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Addresses'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  final formKey = GlobalKey<FormState>();
                  final formData = ref.watch(addressFormProvider);

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 16,
                      right: 16,
                      top: 16,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...formData.keys.map(
                              (key) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText:
                                        key.replaceAll('_', ' ').toUpperCase(),
                                    border: const OutlineInputBorder(),
                                  ),
                                  initialValue: formData[key],
                                  onChanged: (value) {
                                    final newData = {...formData, key: value};
                                    ref
                                        .read(addressFormProvider.notifier)
                                        .state = newData;
                                  },
                                  validator:
                                      (value) =>
                                          value == null || value.isEmpty
                                              ? 'Required'
                                              : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await ref
                                      .read(addressViewModelProvider.notifier)
                                      .addAddress(formData);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Save Address'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.error.isNotEmpty
                    ? Center(child: Text(state.error))
                    : ListView.separated(
                      itemCount: state.addresses.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final addr = state.addresses[index];
                        return ListTile(
                          leading: Icon(
                            addr['isDefault'] ? Icons.home : Icons.location_on,
                            color:
                                addr['isDefault'] ? Colors.green : Colors.grey,
                          ),
                          title: Text(
                            '${addr['first_name']} ${addr['last_name']}',
                          ),
                          subtitle: Text(
                            '${addr['address_1']}, ${addr['address_2']},\n${addr['city']}, ${addr['state']} ${addr['zip']}, ${addr['country']}',
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              // Navigate to Edit Address with prefilled data
                            },
                            child: const Text('Edit'),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
