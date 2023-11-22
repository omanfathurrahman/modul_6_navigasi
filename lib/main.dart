import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HalamanBeranda();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'jelajah',
          builder: (BuildContext context, GoRouterState state) {
            return HalamanJelajah();
          },
        ),
        GoRoute(
          path: 'akun',
          builder: (BuildContext context, GoRouterState state) {
            return HalamanAkun();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Praktikum Navigasi',
      routerConfig: _router,
    );
  }
}

class HalamanBeranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Navigasi'),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Penting: Hilangkan semua padding dari ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Image.network(
                "https://telkomuniversity.ac.id/wp-content/uploads/2019/03/Logo-Telkom-University-png-3430x1174.png",
              ),
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Lihat Koleksi'),
              onTap: () => context.go('/jelajah'),
            ),
            ListTile(
              leading: const Icon(Icons.man_3),
              title: const Text('Akun'),
              onTap: () => context.go('/akun'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Ini adalah tampilan Halaman Beranda'),
      ),
    );
  }
}

class HalamanJelajah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Koleksi')),
      body: const Center(
        child: Text('Ini adalah tampilan Halaman Lihat Koleksi'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Formal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Kasual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Vintage',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Akun'),
      ),
      body: const Center(
        child: Text('Ini adalah tampilan Halaman Akun'),
      ),
    );
  }
}
