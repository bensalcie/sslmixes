# SSL Pinning Mixes

Fluttercon Implementation for SSL Pinning on Flutter app.

## Getting Started

<img width="348" alt="Screenshot 2024-10-21 at 01 36 12" src="https://github.com/user-attachments/assets/18c6b8db-73d4-4053-9009-6e609b8496db">
<img width="348" alt="Screenshot 2024-10-21 at 01 36 32" src="https://github.com/user-attachments/assets/2d72b054-62be-41aa-b80e-c016adced0ca">

### Here is some context about SSL Pinning.

## How SSL Pinning Works
      When a mobile app communicates with a server over HTTPS, SSL/TLS encryption ensures that the data transmitted between them is secure. However, the trust in this connection is based on a Certificate Authority (CA) that issues the server's SSL certificate. If an attacker can trick the app into accepting a fake CA (e.g., through a compromised CA or rogue Wi-Fi networks), they could intercept and decrypt the communication.
      SSL Pinning mitigates this risk by "pinning" the app to a specific server certificate or public key, meaning:
      The mobile app is pre-configured to accept only one or a few specific certificates or public keys from the server.
      When a connection is initiated, the app compares the certificate it receives from the server against the "pinned" certificate(s).
      If the certificate matches the pinned one, the connection is trusted. If not, the app rejects the connection, even if the server presents a valid certificate signed by a trusted CA.
      This project is a starting point for a Flutter application.


# DISCLAIMER!! 🌴
THIS PROJECT USES PURE CLEAN ARCHITECTURE - FAMILIARIZE YOURSELF WITH THIS ARCHITECTURE BEFORE WORKING ON IT.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

