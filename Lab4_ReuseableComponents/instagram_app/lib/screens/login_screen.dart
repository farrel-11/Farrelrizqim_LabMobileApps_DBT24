import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IgGlyph extends StatelessWidget {
  const IgGlyph({super.key, this.size = 86});

  final double size;

  static const _igOutlineSvg = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none">
  <rect x="3.2" y="3.2" width="17.6" height="17.6" rx="5.2"
        stroke="currentColor" stroke-width="2.2" />
  <circle cx="12" cy="12" r="4.1"
          stroke="currentColor" stroke-width="2.2" />
  <circle cx="17.3" cy="6.7" r="1.2" fill="currentColor" />
</svg>
''';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFDD074),
              Color(0xFFF77F34),
              Color(0xFFDD326E),
              Color(0xFFD82B7E),
              Color(0xFFA432B1),
            ],
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: SvgPicture.string(
          _igOutlineSvg,
          width: size,
          height: size,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(child: IgGlyph(size: 86)),
                    ),

            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username, email or mobile number',
                filled: true,
                fillColor: const Color(0xFF121212),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: const Color(0xFF121212),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
               style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Log in', style: TextStyle(color: Colors.white)),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {}, 
              child: const Text("Don't have an account? Sign up", style: TextStyle(color: Colors.blue))
            )
          ],
        ),
      ),
    );
  }
}