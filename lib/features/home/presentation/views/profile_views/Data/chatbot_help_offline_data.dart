// ملف: chatbot_help_offline_data.dart

class HelpOfflineBot {
  static final List<Map<String, dynamic>> _responses = [
    {
      'keywords': [
        'problem',
        'issue',
        'error',
        'bug',
        'not working',
        'stuck',
        'crash'
      ],
      'response':
          'Sorry you\'re facing issues. Please try restarting the app. If the issue continues, you can reach us at support@hls-app.com'
    },
    {
      'keywords': ['contact', 'email', 'help', 'support', 'assist', 'team'],
      'response':
          'You can contact our support team at any time via email: support@hls-app.com'
    },
    {
      'keywords': ['slow', 'lag', 'delay', 'performance'],
      'response':
          'Performance issues can be fixed by clearing cache or restarting the app. Need more help? Email support@hls-app.com'
    },
    {
      'keywords': ['account', 'delete', 'remove', 'deactivate'],
      'response':
          'To delete your account, please go to Settings > Account > Delete. Still need help? Contact us.'
    },
    {
      'keywords': ['subscription', 'payment', 'money', 'billing'],
      'response':
          'For billing or subscription inquiries, please visit your app store\'s subscriptions section or email: billing@hls-app.com'
    },
    {
      'keywords': ['reset', 'password', 'forgot'],
      'response':
          'To reset your password, click on "Forgot Password" on the login screen.'
    },
    {
      'keywords': ['feedback', 'suggestion', 'idea', 'improve'],
      'response':
          'We appreciate your feedback! Please send your suggestions to feedback@hls-app.com'
    },
    {
      'keywords': ['login', 'sign in', 'can\'t access', 'unable to login'],
      'response':
          'If you can\'t login, make sure your credentials are correct. If you forgot your password, use the "Forgot Password" option.'
    },
    {
      'keywords': ['language', 'change language', 'arabic', 'english'],
      'response': 'To change language, go to Settings > Language.'
    },
    {
      'keywords': ['app crash', 'freeze', 'close', 'suddenly'],
      'response':
          'If the app crashes, please reinstall it or contact support@hls-app.com for help.'
    },
    {
      'keywords': ['plan', 'upgrade', 'pro', 'premium'],
      'response':
          'To upgrade your plan, check the Subscription section in Settings or contact support.'
    },
    // Add more cases as needed
  ];

  static String getResponse(String message) {
    final lowerMessage = message.toLowerCase();

    for (var data in _responses) {
      for (var keyword in data['keywords']) {
        if (lowerMessage.contains(keyword)) {
          return data['response'];
        }
      }
    }

    return 'Sorry, I couldn\'t understand that. If your issue is urgent, please contact us at ${"support@hls-app.com"}';
  }
}
