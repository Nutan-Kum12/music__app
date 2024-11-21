import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

class DeleteAccountPage extends StatefulWidget {
  final Client client;

  const DeleteAccountPage({Key? key, required this.client}) : super(key: key);

  @override
  _DeleteAccountPageState createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  bool _isLoading = false;

  Future<void> _deleteAccount() async {
    setState(() {
      _isLoading = true;
    });

    final account = Account(widget.client);
    try {
      // await account.delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account deleted successfully.')),
      );

      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete account: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text('Delete Account'),
        content:  Text('Are you sure you want to delete your account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
              _deleteAccount(); 
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _showConfirmationDialog,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Delete Account'),
              ),
      ),
    );
  }
}
