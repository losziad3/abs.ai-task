import 'package:absai/features/home/cubit/cubit.dart';
import 'package:absai/features/home/cubit/states.dart';
import 'package:absai/features/home/view/widgets/note_card.dart';
import 'package:absai/features/home/view/widgets/show_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fafb),
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {

          ///THIS WILL WORK IF I APPLY SET STATE
          selectedIndex = index;
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('CollabNotes'),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Go Premium',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            if (state is NotesLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NotesLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, ABS.AI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'You have ${state.notes.length} notes in your workspace',
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search notes...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 12),

                      ///DROPDOWN BUTTON FOR FILTRATION MAYBE I WILL DO THIS SOON
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: 'All Notes',
                          underline: SizedBox(),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: ['All Notes', 'My Notes', 'Shared With Me'].map((label) => DropdownMenuItem(
                                    value: label,
                                    child: Text(label),
                                  )).toList(),

                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: state.notes
                          .map((note) => NoteCard(note: note))
                          .toList(),
                    ),
                  ),
                ],
              );
            } else if (state is NotesErrorState) {
              return Center(child: Text('Error at home screen${state.message}'));
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => showAddNoteDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  NavigationDrawer({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Logo / App Name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Text(
              'CollabNotes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  index: 0,
                  icon: Icons.dashboard_outlined,
                  label: 'Dashboard',
                ),
                _buildDrawerItem(
                  index: 1,
                  icon: Icons.notes_outlined,
                  label: 'My Notes',
                ),
                _buildDrawerItem(
                  index: 2,
                  icon: Icons.share_outlined,
                  label: 'Shared With Me',
                ),
                _buildDrawerItem(
                  index: 3,
                  icon: Icons.payment_outlined,
                  label: 'Payment',
                ),
              ],
            ),
          ),

          // Logout Button (at bottom)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // logout logic
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = index == selectedIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Material(
        color: isSelected ? Colors.blue.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          leading: Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey.shade800,
          ),
          title: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () => onDestinationSelected(index),
        ),
      ),
    );
  }
}
