import 'package:midterm_app/util/quizmodel.dart';

Map<String, dynamic> materials = {
  "IT4": {
    "overview":
        "The ITE4 Software Engineering course provides students with a comprehensive understanding of software development methodologies, principles, and practices, focusing on the design, implementation, testing, and maintenance of software systems",
    "lessons": [
      {
        "title": "What is Software Engineering",
        "content": "lib/data/html/IT4lesson1.html",
        "quiz": [
          Question(
              text:
                  'Concerned with theories, methods and tools for professional softwaredevelopment',
              options: [
                const Option(text: 'Software Engineering', isCorrect: true),
                const Option(text: 'Software Cost'),
                const Option(text: 'Software Process'),
                const Option(text: 'Software Quality')
              ]),
          Question(
              text:
                  'Specification, development and validation are interleaved. May beplan- driven or agile',
              options: [
                const Option(text: 'The Waterfall Model'),
                const Option(text: 'Incremental Development', isCorrect: true),
                const Option(text: 'Integration and Configuration'),
                const Option(text: 'Agile Development')
              ]),
          Question(
              text:
                  'A structured set of activities required to develop a software system',
              options: [
                const Option(text: 'Software Engineering'),
                const Option(text: 'Software Cost'),
                const Option(text: 'Software Process', isCorrect: true),
                const Option(text: 'Software Quality')
              ]),
          Question(
              text:
                  'It is often dominate computer system costs. The costs of software onaPCare often greater than the hardware cost',
              options: [
                const Option(text: 'Software Engineering'),
                const Option(text: 'Software Cost', isCorrect: true),
                const Option(text: 'Software Process'),
                const Option(text: 'Software Quality')
              ]),
          Question(
              text:
                  'Stand-alone systems that are marketed and sold to any customer whowishes to buy them',
              options: [
                const Option(text: 'Customized Products'),
                const Option(text: 'Generic Products', isCorrect: true),
                const Option(text: 'Integration and Configuration'),
                const Option(text: 'Proper Products')
              ]),
          Question(
              text:
                  'The Waterfall Model plan-driven model. Separate and distinct phases of specification and development',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Customized Products is a stand-alone systems that are marketed andsoldto any customer who wishes to buy them',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text: 'Validation would def what the system should do',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Evolution is changing the system in response to changing customer needs',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Software Process is a structured set of activities required to developasoftware system',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ])
        ]
      },
      {
        "title": "Agile Software Development",
        "content": "lib/data/html/IT4lesson2.html",
        "quiz": [
          Question(
              text:
                  'Involves programmers working in pairs, developing code together',
              options: [
                const Option(text: 'Pair Programming', isCorrect: true),
                const Option(text: 'Customer Involvement'),
                const Option(text: 'Solo Programming'),
                const Option(text: 'Refactoring')
              ]),
          Question(
              text:
                  'Testing is central to XP and XP has developed an approach wheretheprogram is tested after ever change has been made',
              options: [
                const Option(text: 'Quality Assurcance Testing'),
                const Option(text: 'XP Testing'),
                const Option(text: 'Test-First Development', isCorrect: true),
                const Option(text: 'Customer Involvement')
              ]),
          Question(
              text:
                  'Conventional wisdom in software engineering is to design for change',
              options: [
                const Option(text: 'Extreme Programming'),
                const Option(text: 'Plan Development'),
                const Option(text: 'Refactoring', isCorrect: true),
                const Option(text: 'Agile Development')
              ]),
          Question(
              text:
                  'The system is developed as a series of versions or increments withstakeholders involved in version specification and evaluation',
              options: [
                const Option(text: 'Agile Methods'),
                const Option(text: 'Agile Development', isCorrect: true),
                const Option(text: 'Rapid Software Development'),
                const Option(text: 'Test-First Development')
              ]),
          Question(
              text:
                  'A very influential agile method, developed in the late 1990s, that introduceda range of agile development techniques',
              options: [
                const Option(text: 'Pair Programming'),
                const Option(text: 'Extreme Programming', isCorrect: true),
                const Option(text: 'Pair Developing'),
                const Option(text: 'Extreme Developing')
              ]),
          Question(
              text:
                  'Extreme Programming is a very influential agile method, developedinthelate 1990s, that introduced a range of agile development techniques',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Refactoring is a customized conventional wisdom in software engineeringisto design for change',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text: 'Agile Methods the system is developed as a series of versionsor increments with stakeholders involved in version specification and evaluation',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Extreme Programming is a very influential agile method, developedinthelate 1990s, that introduced a range of agile development techniques',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Rapid Software Development and delivery is now often the most important requirement for software systems',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ])
        ]
      },
      {
        "title": "Architectural Design and Modelling",
        "content": "This is content",
      }
    ],
  },
  "ITE7": {
    "overview":
        "The ITE7 Application Development and Emerging Technology course is designed to immerse students in the dynamic intersection of software development and emerging technologies, offering a comprehensive exploration of modern application development paradigms and cutting-edge technologies",
    "lessons": [
      {
        "title": "Emerging Technology and Its Characteristics",
        "content": "lib/data/html/IT7lesson1.html",
        "quiz": [
          Question(
              text:
                  'What is the primary characteristic of emerging technologies?',
              options: [
                const Option(text: 'Slow Growth'),
                const Option(text: 'Familiarity with Existing Technologies'),
                const Option(text: 'Radical Novelty', isCorrect: true),
                const Option(text: 'Predictable Impact')
              ]),
          Question(
              text:
                  'Which technology holds promise for treating genetic disorders by correcting or replacing faulty genes?',
              options: [
                const Option(text: 'Nanotechnology'),
                const Option(text: 'Gene Therapy', isCorrect: true),
                const Option(text: '3D Printing'),
                const Option(text: 'Artificial Intelligence')
              ]),
          Question(
              text:
                  'What does 3D printing enable?',
              options: [
                const Option(text: 'Customized manufacturing'),
                const Option(text: 'Rapid prototyping'),
                const Option(text: 'Both A and B', isCorrect: true),
                const Option(text: 'None of the above')
              ]),
          Question(
              text:
                  'What field involves manipulating materials at the atomic or molecular scale?',
              options: [
                const Option(text: 'Nanotechnology', isCorrect: true),
                const Option(text: 'AI'),
                const Option(text: 'Gene Therapy'),
                const Option(text: 'Telemedicine')
              ]),
          Question(
              text:
                  'Which technology aims to combat cancer through immunotherapy approaches?',
              options: [
                const Option(text: 'In-Vitro Meat'),
                const Option(text: 'Cancer Vaccines', isCorrect: true),
                const Option(text: '3D Printing'),
                const Option(text: 'Nanotechnology')
              ]),
          Question(
              text:
                  'What is the purpose of in-vitro meat?',
              options: [
                const Option(text: 'To reduce greenhouse gas emissions'),
                const Option(text: 'To provide an alternative livestock farming', isCorrect: true),
                const Option(text: 'To enhance taste and texture'),
                const Option(text: 'To promote vegetarianism')
              ]),
          Question(
              text:
                  'Which advancement allows remote medical consultations and diagnoses?',
              options: [
                const Option(text: 'Wearable Health Devices'),
                const Option(text: 'Telemedicine', isCorrect: true),
                const Option(text: 'Gene Therapy'),
                const Option(text: 'Nanotechnology')
              ]),
          Question(
              text:
                  'What is personalized medicine based on?',
              options: [
                const Option(text: 'Generic Treatment Protocols'),
                const Option(text: 'Individual Genetic Makeup', isCorrect: true),
                const Option(text: 'Population Averages'),
                const Option(text: 'Randomized Trials')
              ]),
          Question(
              text:
                  'What is the primary challenge associated with emerging technologies?',
              options: [
                const Option(text: 'Lack of Funding'),
                const Option(text: 'Predictable Outcomes'),
                const Option(text: 'Uncertainty and Ambiguity', isCorrect: true),
                const Option(text: 'Slow Adoption')
              ]),
          Question(
              text:
                  'Which technology has the potential to transform industries and create new markets?',
              options: [
                const Option(text: 'Established Technologies'),
                const Option(text: 'Emerging Technologies', isCorrect: true),
                const Option(text: 'Obsolete Technologies'),
                const Option(text: 'None of the above')
              ]),
          
        ]
      },
      {
        "title": "Emerging Technology Areas",
        "content": "lib/data/html/IT7lesson2.html",
        "quiz": [
          Question(
              text:
                  'What does LSTM stand for in the context of AI?',
              options: [
                const Option(text: 'Long Short Term Memory', isCorrect: true),
                const Option(text: 'Lasting Simple Task Memory'),
                const Option(text: 'Limited Storage Transfer Model'),
                const Option(text: 'Linear Sequential Task Module')
              ]),
          Question(
              text:
                  'Which of the following is not a type of AI?',
              options: [
                const Option(text: 'Theory of Mind'),
                const Option(text: 'Self-awareness'),
                const Option(text: 'Emotional Intelligence', isCorrect: true),
                const Option(text: 'Reactive Machines')
              ]),
          Question(
              text:
                  'What is the primary goal of Narrow AI?',
              options: [
                const Option(text: 'To perform multiple tasks simultaneously'),
                const Option(text: 'To operate within a limited context', isCorrect: true),
                const Option(text: 'To possess self-awareness and consciousness'),
                const Option(text: 'To replace human intelligence completely')
              ]),
          Question(
              text:
                  'Which of the following is not a cyber security threat?',
              options: [
                const Option(text: 'Phishing'),
                const Option(text: 'Spamming', isCorrect: true),
                const Option(text: 'Rapid Software Development'),
                const Option(text: 'Test-First Development')
              ]),
          Question(
              text:
                  'What is the main purpose of IoT in smart cities?',
              options: [
                const Option(text: 'To provide internet access to all citizens'),
                const Option(text: 'To control traffic lights and public transportation '),
                const Option(text: 'To develop and deploy ICT for sustainable urban life'),
                const Option(text: 'To monitor and control devices and equipment via the internet', isCorrect: true)
              ]),
          Question(
              text:
                  'IoT devices can only be controlled via the internet, not read or recognized.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Smart cities utilize ICT to promote sustainable development and address urbanization.',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text: 'AI is exclusively concerned with mimicking human intelligence.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Reactive Machines and Limited Memory are two types of AI that can improve their actions based on past experiences.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Cybersecurity is only about protecting systems from unauthorized access, not about maintaining integrity or availability of data.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ])
        ]
      },
      {
        "title": "Flutter Development",
        "content": "This is content",
      }
    ],
  },
  "IT7": {
    "overview":
        "The IT7 (IT Fundamentals) course serves as a foundational gateway into the realm of Information Technology, providing students with a fundamental comprehension of core concepts, methodologies, and practices essential for navigating the dynamic IT landscape.",
    "lessons": [
      {
        "title": "Decision Making and Problem Solving",
        "content": "This is content",
        "quiz": [
          Question(
              text:
                  'What is the primary purpose of a Management Information System (MIS)',
              options: [
                const Option(text: 'To generate profits'),
                const Option(text: 'To provide insight into regular operations', isCorrect: true),
                const Option(text: 'To develop custom reports'),
                const Option(text: 'To solve unstructured business problems')
              ]),
          Question(
              text:
                  'Which decision-making approach aims to find the best solution to a problem?',
              options: [
                const Option(text: 'Satisficing'),
                const Option(text: 'Optimization', isCorrect: true),
                const Option(text: 'Heuristic'),
                const Option(text: 'Non-programmed')
              ]),
          Question(
              text:
                  'Which type of knowledge is objective and can be measured and documented?',
              options: [
                const Option(text: 'Explicit Knowledge', isCorrect: true),
                const Option(text: 'Tacit Knowledge'),
                const Option(text: 'Exceptional Knowledge'),
                const Option(text: 'Structured Knowledge')
              ]),
          Question(
              text:
                  'What is the main characteristic of a Group Support System (GSS)?',
              options: [
                const Option(text: 'Provides support only to individual decision-making'),
                const Option(text: 'Generates profits and lowers costs'),
                const Option(text: 'Reduces negative group behavior', isCorrect: true),
                const Option(text: 'Requires user requests for reports')
              ]),
          Question(
              text:
                  'Which system assists senior-level executives within the organization?',
              options: [
                const Option(text: 'Group Support System (GSS)'),
                const Option(text: 'Decision Support System (DSS)'),
                const Option(text: 'Management Information System (MIS)'),
                const Option(text: 'Executive Support System (ESS)', isCorrect: true)
              ]),
          Question(
              text:
                  'Decision Support Systems (DSS) focus primarily on solving structured business problems.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Group Support Systems (GSS) provide support in group decision-making settings but do not assist with communication or scheduling.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text: 'Management Information Systems (MIS) are primarily concerned with providing insight into the regular operations of an organization.  ',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Explicit knowledge is hard to measure and document, typically not objective or formalized.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Executive Support Systems (ESS) support strategic control and crisis management among other capabilities.',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ])
        ]
      },
      {
        "title": "Machine Learning",
        "content": "This is content",
        "quiz": [
          Question(
              text:
                  'Which type of machine learning learns from labeled data?',
              options: [
                const Option(text: 'Unsupervised Learning'),
                const Option(text: 'Reinforcement Learning'),
                const Option(text: 'Supervised Learning', isCorrect: true),
                const Option(text: 'Genetic Algorithm')
              ]),
          Question(
              text:
                  'Which algorithm is commonly used in supervised learning for classification tasks?',
              options: [
                const Option(text: 'K-means Clustering'),
                const Option(text: 'Decision Trees', isCorrect: true),
                const Option(text: 'Autoencoders'),
                const Option(text: 'Principal Component Analysis (PCA)')
              ]),
          Question(
              text:
                  'Reinforcement Learning aims to:',
              options: [
                const Option(text: 'Discover hidden patterns in data'),
                const Option(text: 'Maximize a cumulative reward signal over time', isCorrect: true),
                const Option(text: 'Learn from labeled data'),
                const Option(text: 'Mimic natural selection and evolution')
              ]),
          Question(
              text:
                  'Genetic Algorithm is inspired by:',
              options: [
                const Option(text: 'Boolean Logic'),
                const Option(text: 'Human decision-making methodology'),
                const Option(text: 'Fuzzy Sets'),
                const Option(text: 'Natural selection and evolution', isCorrect: true)
              ]),
          Question(
              text:
                  'Fuzzy Logic deals with:',
              options: [
                const Option(text: 'Precise information'),
                const Option(text: 'True/False statements'),
                const Option(text: 'Vague and imprecise information', isCorrect: true),
                const Option(text: 'Numeric optimization')
              ]),
          Question(
              text:
                  'Supervised Learning algorithms require labeled data for training.',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Unsupervised Learning aims to maximize a cumulative reward signal over time.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text: 'Genetic Algorithm mimics the process of natural selection and evolution.',
              options: [
                const Option(text: 'True', isCorrect: true),
                const Option(text: 'False'),
              ]),
          Question(
              text:
                  'Fuzzy Logic is based on precise true/false statements similar to Boolean logic.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ]),
          Question(
              text:
                  'Support Vector Machine (SVM) is used only for regression tasks in machine learning.',
              options: [
                const Option(text: 'True'),
                const Option(text: 'False', isCorrect: true),
              ])
        ]
      },
      {
        "title": "Database Warehousing",
        "content": "This is content",
      }
    ],
  }
};

// materials['ITE4']['lesson1']['title]
