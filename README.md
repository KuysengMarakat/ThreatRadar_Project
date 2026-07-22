#  ThreatRadar (Real-Time Website Threat Monitoring)

**ThreatRadar** is a Blue Team defensive mobile security application built with Flutter. The application monitors multiple websites in real-time to detect and alert administrators about login-based cyber attacks.

The app uses **Firebase Realtime Database** for centralized log storage and streaming, allowing security teams to monitor threats across multiple websites from a single mobile dashboard. When suspicious patterns are detected (such as brute force attacks, credential stuffing, or DDoS attempts), the app creates real-time alerts that admins can respond to immediately.

ThreatRadar is developed as an educational cybersecurity mobile project that demonstrates Flutter concepts such as stateful widgets, navigation, forms, authentication flow, HTTP CRUD operations, real-time streams, repository architecture, and secure handling of security event data.

---

##  Project Direction

**Blue Team — Defensive Application**

ThreatRadar focuses on **detecting and monitoring** login-based attacks on websites. It is not an offensive security tool. The application helps administrators identify threats in real-time so they can respond before damage is done.

---

##  Key Features

###  Firebase Authentication
Administrators register and log in securely using Firebase Authentication with email and password.

###  Biometric Login
Users can enable fingerprint or face recognition for faster and more secure app access.

###  Multi-Website Monitoring
The app supports monitoring multiple websites simultaneously with isolated data per site.

###  Real-Time Threat Detection
Six intelligent detection rules analyze incoming logs to identify attack patterns.

###  Live Dashboard
View all active threats, alert statistics, and monitored websites in one place.

###  Alert Status Tracking
Track alerts through their lifecycle: **New → In Progress → Resolved**.

###  Real-Time Streams
Firebase streams push new logs and alerts to the app instantly (no manual refresh needed).

###  Idempotent Alert Creation
HTTP PUT with custom IDs prevents duplicate alerts from same attack pattern.

### Layered Architecture
Follows clean architecture with `models/`, `data/`, `repositories/`, `services/`, `ui/screens/`, and `ui/widgets/`.

---

##  Detection Rules

The app implements six intelligent detection rules to identify various attack patterns:

| # | Rule Name | Condition | Risk Level |
|---|-----------|-----------|------------|
| 1 | **Brute Force** | Same email → 5+ failed logins within 5 minutes |  HIGH |
| 2 | **Credential Stuffing** | Same IP → 3+ different emails within 10 minutes |  HIGH |
| 3 | **DDoS Attack** | 5+ different IPs targeting same email within 1 minute |  CRITICAL |
| 4 | **Unusual Time Login** | Successful login between 2:00 AM - 5:00 AM |  MEDIUM |
| 5 | **New Device Login** | Login from previously unrecognized device |  MEDIUM |
| 6 | **New Location Login** | Login from previously unrecognized IP address | MEDIUM |

---

##  System Architecture

### 1. Add Website Flow (Super Admin)

![Add Website Flow](Doc/SuperAdmin.jpg)

When Super Admin adds a website:
1. Super Admin enters website URL
2. App sends HTTP GET to verify website is alive
3. If website responds → Save to Firebase (Connected )
4. If no response → Show error (Not Connected )

### 2. Complete System Architecture


![System Architecture](Doc/Complete.jpg)

The complete threat detection flow:
1. Users interact with monitored websites (sending HTTP headers with IP, time, browser)
2. Websites POST login events to Firebase
3. App fetches logs via Firebase streams
4. Detection engine analyzes patterns
5. If rule matches, alert created with HTTP PUT
6. Alert streams back to admin dashboard

### 3. Brute Force Detection Logic

![Brute Force Detection](Doc/Brute.jpg)

The brute force detection algorithm:

1. Fetch all logs from Firebase
2. Store in Log list
3. Filter only `login_failed` events
4. Create unique email list
5. Loop through each email
6. Count failures within 5-minute time window
7. If count ≥ 5, trigger brute force alert
8. PUT alert back to Firebase

---

##  Main Technologies

| Technology | Purpose |
|------------|---------|
| **Flutter** | Mobile application framework |
| **Dart** | Programming language |
| **Firebase Realtime Database** | Cloud storage and real-time streaming |
| **Firebase Authentication** | Email/password login |
| **local_auth** | Biometric authentication |
| **http** | REST API communication |
| **Node.js + Express** | Website logger middleware |
| **Stateful Widgets** | State management |
| **Repository Pattern** | Clean data access layer |

---

##  App Screens

### 1. Login Screen
Allows administrators to sign in using email and password.

### 2. Dashboard Screen
Displays overview of active threats, monitored websites, and recent activity.

### 3. Alerts Screen
Shows all threat alerts with severity filters (All, High, Medium, Low).

### 4. Alert Detail Screen
Displays complete threat information including attack type, source IP, affected user, and action buttons.

### 5. Websites Screen
Lists all monitored websites with connection status.

### 6. Add Website Screen
Registers a new website with automatic connection verification.

### 7. Settings Screen
Manages user preferences, biometric settings, and logout.

---

