# 🌐 Website Checker

Welcome to the **Website Checker** repository! This Bash script is designed to perform various checks on websites, including SSL certificate validation, HTTP headers analysis, and ping tests. It's a handy tool for quick website diagnostics.

## 🚀 Features

- 🔒 Checks SSL certificate validity of a website.
- 🌐 Analyzes HTTP headers for security and configuration.
- 📡 Performs a ping test to check website accessibility.
- 🎨 Color-coded output for better readability.
- 🔧 Flexible command options for targeted checks.

## 📋 Prerequisites

To use **Website Checker**, you will need:

- A Unix-like operating system (Linux, MacOS).
- Bash shell environment.
- curl and openssl installed on your system.

## ⚙️ Installation

No installation required! Simply clone the repository:

```bash
git clone https://github.com/DeadGolden0/WebsiteChecker.git
cd WebsiteChecker
```

## 🖥️ Usage
> [!NOTE]
> To run this script, navigate to the repository directory and execute:

```bash
./WebsiteChecker.sh [OPTIONS] [URL]
```

- ``-A`` : Perform all checks (SSL, HTTP headers, ping)
- ``-c`` : Check the SSL certificate only
- ``-h`` : Check the HTTP headers only
- ``-p`` : Perform a ping test only
- ``-help`` : Display help and exit

Example:
```bash
./WebsiteChecker.sh -A https://www.example.com
```
<br><br>
> [!TIP]
> You can run the Website Checker script with `sudo` if it requires access to restricted files or elevated privileges. Just prepend `sudo` to the command like this:
 ```bash
sudo ./website_checker.sh [OPTIONS] [URL]
```

## 🤝 Contributing

Your contributions make the open source community a fantastic place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ✉️ Contact

For any questions or suggestions, please feel free to contact me:

[![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/w92W7XR9Yg)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:deadgolden9122@gmail.com)
[![Steam](https://img.shields.io/badge/steam-%23000000.svg?style=for-the-badge&logo=steam&logoColor=white)](https://steamcommunity.com/id/DeAdGoLdEn/)

## 💖 Support Me

If you find this project helpful and would like to support my work, you can contribute through PayPal. Any support is greatly appreciated and helps me continue developing and maintaining the project.

[![PayPal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/DeadGolden0)
