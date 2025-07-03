class OfflineChatBot {
  static final List<Map<String, dynamic>> _qaPairs = [
    {
      'keywords': ['breakfast', 'healthy'],
      'response':
          'Try oatmeal with fruits or Greek yogurt with honey and nuts.',
    },
    {
      'keywords': ['meal', 'plan'],
      'response':
          'You can follow a 5-meal plan: breakfast, snack, lunch, snack, dinner.',
    },
    {
      'keywords': ['workout', 'plan'],
      'response':
          'Start with 3 days per week: push day, pull day, and legs day.',
    },
    {
      'keywords': ['gain', 'muscle'],
      'response':
          'Train progressively with weights and eat high-protein meals.',
    },
    {
      'keywords': ['lose', 'weight'],
      'response':
          'Combine cardio with a calorie deficit and reduce sugar intake.',
    },
    {
      'keywords': ['snack', 'healthy'],
      'response':
          'Try almonds, boiled eggs, or fruit smoothies as healthy snacks.',
    },
    {
      'keywords': ['water', 'daily'],
      'response': 'Aim for at least 2 to 3 liters of water per day.',
    },
    {
      'keywords': ['protein', 'source'],
      'response':
          'Eggs, chicken breast, lentils, and Greek yogurt are good protein sources.',
    },
    {
      'keywords': ['calories', 'burn'],
      'response':
          'You burn calories through physical activity, metabolism, and diet.',
    },
    {
      'keywords': ['fat', 'burn'],
      'response':
          'Include HIIT workouts and avoid processed food to burn fat effectively.',
    },
    {
      'keywords': ['abs', 'how'],
      'response': 'Focus on core training and a low-fat diet to reveal abs.',
    },
    {
      'keywords': ['best', 'leg', 'workout'],
      'response': 'Squats, lunges, and deadlifts are top leg exercises.',
    },
    {
      'keywords': ['stretch', 'routine'],
      'response':
          'Try full-body stretching after every workout for 10 minutes.',
    },
    {
      'keywords': ['sleep', 'muscle'],
      'response': 'Yes, sleep is essential for muscle recovery and growth.',
    },
    {
      'keywords': ['how', 'track', 'calories'],
      'response': 'Use apps like MyFitnessPal or input manually in your diary.',
    },
    {
      'keywords': ['vegan', 'protein'],
      'response':
          'Lentils, tofu, quinoa, and chickpeas are great vegan protein sources.',
    },
    {
      'keywords': ['fiber', 'food'],
      'response': 'Whole grains, fruits, and vegetables are rich in fiber.',
    },
    {
      'keywords': ['keto', 'diet'],
      'response':
          'Keto is low-carb, high-fat; helps with fat loss but needs monitoring.',
    },
    {
      'keywords': ['cardio', 'morning'],
      'response':
          'Fast cardio in the morning may help with fat burning, but not essential.',
    },
    {
      'keywords': ['cheat', 'meal'],
      'response':
          'A cheat meal once a week is fine if it fits your weekly calories.',
    },
    {
      'keywords': ['water', 'before', 'meal'],
      'response':
          'Drinking water before meals can help you feel full and eat less.',
    },
    {
      'keywords': ['pre', 'workout', 'meal'],
      'response':
          'Eat bananas, oats, or rice with protein 1 hour before your workout.',
    },
    {
      'keywords': ['post', 'workout', 'meal'],
      'response':
          'Consume protein and carbs: chicken with rice or a protein shake with banana.',
    },
    {
      'keywords': ['gym', 'beginner'],
      'response':
          'Start with full-body workouts 3x/week focusing on compound exercises.',
    },
    {
      'keywords': ['motivation', 'workout'],
      'response':
          'Set goals, track progress, and reward yourself for consistency.',
    },
    {
      'keywords': ['sugar', 'intake'],
      'response': 'Try to limit added sugar to less than 30g per day.',
    },
    {
      'keywords': ['fasting', 'intermittent'],
      'response':
          'Intermittent fasting (like 16:8) helps with fat loss and control hunger.',
    },
    {
      'keywords': ['home', 'workout'],
      'response':
          'You can do bodyweight squats, pushups, planks, and jumping jacks at home.',
    },
    {
      'keywords': ['supplement', 'needed'],
      'response': 'Supplements are optional; focus on whole food first.',
    },
    {
      'keywords': ['how', 'calculate', 'BMI'],
      'response':
          'BMI = weight (kg) / height² (m²). Example: 70kg / 1.75² = 22.9.',
    },
    {
      'keywords': ['daily', 'steps'],
      'response': 'Try to walk at least 7,000 to 10,000 steps a day.',
    },
    {
      'keywords': ['rest', 'days'],
      'response':
          'Yes, rest days are important for recovery and muscle growth.',
    },
    {
      'keywords': ['muscle', 'soreness'],
      'response':
          'It’s normal after exercise; rest, hydrate, and stretch to help.',
    },
    {
      'keywords': ['meal', 'prep'],
      'response':
          'Prepare meals in advance using containers to save time and stay consistent.',
    },
    {
      'keywords': ['carb', 'loading'],
      'response':
          'Useful before endurance events; eat complex carbs 2–3 days before.',
    },
    {
      'keywords': ['hydration', 'important'],
      'response':
          'Staying hydrated helps with energy, focus, and muscle performance.',
    },
    {
      'keywords': ['stretch', 'before', 'exercise'],
      'response':
          'Dynamic stretches are recommended before workouts to warm up.',
    },
    {
      'keywords': ['protein', 'shake'],
      'response':
          'A shake is a fast way to get protein, especially post-workout.',
    },
    {
      'keywords': ['junk', 'food'],
      'response': 'Limit it as much as possible; choose whole foods instead.',
    },
    {
      'keywords': ['core', 'exercises'],
      'response':
          'Try planks, leg raises, mountain climbers, and Russian twists.',
    },
    {
      'keywords': ['low', 'energy'],
      'response': 'Make sure you eat enough, sleep well, and stay hydrated.',
    },
    {
      'keywords': ['back', 'pain', 'gym'],
      'response':
          'Focus on proper form; avoid heavy deadlifts until technique is solid.',
    },
    {
      'keywords': ['healthy', 'fats'],
      'response':
          'Avocados, nuts, olive oil, and fatty fish provide good fats.',
    },
    {
      'keywords': ['meal', 'timing'],
      'response':
          'Try eating every 3-4 hours to maintain energy and metabolism.',
    },
    {
      'keywords': ['creatine', 'safe'],
      'response':
          'Yes, creatine is widely researched and safe for most people.',
    },
    {
      'keywords': ['reps', 'sets'],
      'response': 'Try 3–4 sets of 8–12 reps for hypertrophy (muscle growth).',
    },
    {
      'keywords': ['gym', 'fear'],
      'response':
          'Everyone starts somewhere — focus on yourself and your progress.',
    },
    {
      'keywords': ['walk', 'after', 'meal'],
      'response':
          'Yes, a 10-minute walk after meals can help digestion and blood sugar.',
    },
    {
      'keywords': ['meal plan', 'diet plan', 'suggest meal'],
      'response':
          'A healthy meal plan includes balanced proteins, carbs, and fats. Do you want a vegetarian option?',
    },
    {
      'keywords': ['exercise', 'workout', 'training'],
      'response':
          'You can start with 30 minutes of cardio and strength training. Would you like a sample workout?',
    },
    {
      'keywords': ['calories', 'calorie intake', 'daily calories'],
      'response':
          'Average daily calorie needs vary, but 2000 kcal is common. Would you like help calculating yours?',
    },
    {
      'keywords': ['protein intake', 'how much protein', 'daily protein'],
      'response':
          'Protein needs depend on activity level. Usually 1.6–2.2g/kg of body weight.',
    },
    {
      'keywords': ['lose weight', 'fat loss', 'burn fat'],
      'response':
          'To lose weight, focus on a calorie deficit and regular workouts. Shall I recommend a routine?',
    },
    {
      'keywords': ['gain muscle', 'muscle building', 'bulk'],
      'response':
          'Muscle gain requires resistance training and a protein-rich diet. Want a muscle plan?',
    },
    {
      'keywords': ['hydration', 'drink water', 'how much water'],
      'response':
          'Aim for 2–3 liters of water daily. Adjust based on activity level.',
    },
    {
      'keywords': ['snacks', 'healthy snacks', 'light food'],
      'response': 'Try nuts, Greek yogurt, or fruit. Want a full snack list?',
    },
    {
      'keywords': ['vegetarian', 'plant-based', 'no meat'],
      'response':
          'Vegetarian plans can be rich in legumes, tofu, and grains. Want meal ideas?',
    },
    {
      'keywords': ['breakfast', 'healthy breakfast', 'morning meal'],
      'response': 'How about oatmeal with banana and nuts? Want more ideas?',
    },
    {
      'keywords': ['lunch', 'midday meal'],
      'response':
          'Try grilled chicken with quinoa and veggies. Shall I suggest alternatives?',
    },
    {
      'keywords': ['dinner', 'evening meal'],
      'response':
          'A light dinner can include soup, salad, or steamed vegetables.',
    },
    {
      'keywords': ['carbs', 'carbohydrates', 'low carb'],
      'response':
          'Carbs are essential for energy. Choose whole grains and fruits.',
    },
    {
      'keywords': ['fat', 'healthy fats', 'omega 3'],
      'response': 'Include fats like avocado, olive oil, and nuts.',
    },
    {
      'keywords': ['rest', 'recovery', 'sleep'],
      'response':
          'Rest is crucial for muscle recovery. Aim for 7–9 hours of sleep.',
    },
    {
      'keywords': ['stretching', 'warm up', 'cool down'],
      'response': 'Stretch before and after workouts to prevent injury.',
    },
    {
      'keywords': ['fitness goal', 'set goal', 'health goal'],
      'response':
          'Start with SMART goals—Specific, Measurable, Achievable, Relevant, Time-bound.',
    },
    {
      'keywords': ['steps per day', 'walking', 'daily activity'],
      'response':
          'Try to reach at least 8,000–10,000 steps daily for good activity levels.',
    },
    {
      'keywords': ['BMI', 'body mass index'],
      'response':
          'BMI is a simple height-to-weight ratio. Would you like to calculate yours?',
    },
    {
      'keywords': ['body fat', 'fat percentage'],
      'response':
          'Body fat % varies by age and gender. Ideal range is 18–24% for most.',
    },
    {
      'keywords': ['motivation', 'stay on track', 'keep going'],
      'response':
          'Set goals, track progress, and stay consistent. You got this 💪',
    },
    {
      'keywords': ['home workout', 'no equipment'],
      'response': 'Try bodyweight squats, pushups, and planks. Want a routine?',
    },
    {
      'keywords': ['gym beginner', 'first time gym'],
      'response': 'Start with machines and light weights. Focus on form.',
    },
    {
      'keywords': ['protein shake', 'supplements'],
      'response':
          'Protein shakes can help. Choose whey, plant, or casein types.',
    },
    {
      'keywords': ['cheat meal', 'junk food', 'pizza'],
      'response': 'A weekly cheat meal is fine. Just don’t overdo it.',
    },
    {
      'keywords': ['sugar', 'sweet', 'cut sugar'],
      'response': 'Reduce added sugars and avoid sugary drinks.',
    },
    {
      'keywords': ['cardio', 'run', 'jog'],
      'response': 'Try jogging, cycling, or HIIT 3–4 times a week.',
    },
    {
      'keywords': ['strength training', 'lifting', 'weights'],
      'response': 'Train major muscle groups 2–3x/week for strength.',
    },
    {
      'keywords': ['meal prep', 'cook ahead', 'prep meals'],
      'response': 'Prep meals on weekends. Use containers to stay organized.',
    },
    {
      'keywords': ['metabolism', 'boost metabolism'],
      'response': 'Eat enough protein, move regularly, and sleep well.',
    },
    {
      'keywords': ['tracking progress', 'progress', 'track workout'],
      'response': 'Use a fitness journal or app to log workouts and meals.',
    },
    {
      'keywords': ['water after workout', 'drink after training'],
      'response': 'Yes! Rehydrate and consider electrolytes if intense.',
    },
    {
      'keywords': ['stress', 'mental health', 'anxiety'],
      'response': 'Exercise and good sleep help manage stress effectively.',
    },
    {
      'keywords': ['yoga', 'meditation'],
      'response': 'Yoga boosts flexibility and calm. Want a 5-min guide?',
    },
    {
      'keywords': ['healthy habits', 'lifestyle change'],
      'response': 'Start small. Sleep, move, hydrate, eat mindfully.',
    },
    {
      'keywords': ['vegetables', 'greens', 'salads'],
      'response': 'Include leafy greens, colorful veggies, and legumes daily.',
    },
    {
      'keywords': ['meal timing', 'when to eat'],
      'response': 'Eat regularly every 3–4 hours to fuel your body.',
    },
    {
      'keywords': ['intermittent fasting', 'fasting hours'],
      'response': 'Fasting may help some. Common windows: 16:8 or 18:6.',
    },
    {
      'keywords': ['post workout meal', 'after gym food'],
      'response': 'Have protein + carbs within 45 mins post workout.',
    },
    {
      'keywords': ['pre workout', 'before training'],
      'response': 'Eat light carbs and protein 1–2 hours before training.',
    },
    {
      'keywords': ['cravings', 'sugar cravings'],
      'response': 'Try fruit, drink water, or distract with activity.',
    },
    {
      'keywords': ['fitness myths', 'common myths'],
      'response': 'Lifting doesn’t make women bulky. Carbs aren’t evil.',
    },
    {
      'keywords': ['fat vs muscle', 'what weighs more'],
      'response': 'Muscle is denser than fat and takes less space.',
    },
    {
      'keywords': ['scale not moving', 'stuck weight'],
      'response': 'Check inches, not just weight. Maybe building muscle!',
    },
    {
      'keywords': ['how to start', 'begin fitness'],
      'response': 'Set a small goal and start with 15-min routines.',
    },
    {
      'keywords': ['fiber', 'digestive health'],
      'response': 'Oats, veggies, fruits are rich in fiber. Stay hydrated.',
    },
    {
      'keywords': ['cholesterol', 'heart health'],
      'response': 'Eat oats, avocados, and avoid fried foods.',
    },
    {
      'keywords': ['low energy', 'tired'],
      'response': 'Sleep well, hydrate, and eat balanced meals.',
    },
  ];

  static String getResponse(String userMessage) {
    final msg = userMessage.toLowerCase();

    for (final qa in _qaPairs) {
      final keywords = qa['keywords'] as List<String>;
      final matched = keywords.every((word) => msg.contains(word));
      if (matched) return qa['response'];
    }

    return "Sorry, I didn't understand that. Try asking about food, workouts, or fitness tips.";
  }
}
