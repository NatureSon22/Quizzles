import 'package:midterm_app/util/quizmodel.dart';

Map<String, dynamic> materials = {
  "ITE4": {
    "overview":
        "The IT4 Software Engineering course provides students with a comprehensive understanding of software development methodologies, principles, and practices, focusing on the design, implementation, testing, and maintenance of software systems",
    "lessons": [
      {
        "title": "What is Software Engineering",
        "content": "This is content",
        "quiz": [
          Question(
              text:
                  'Concerned with theories, methods and tools for professional softwaredevelopment',
              options: [
                const Option(text: 'Software Engineering', isCorrect: true),
                const Option(text: 'Software Cost'),
                const Option(text: 'Software Process'),
                const Option(text: 'Software Engineering')
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
                const Option(text: 'Software Engineering')
              ]),
          Question(
              text:
                  'It is often dominate computer system costs. The costs of software onaPCare often greater than the hardware cost',
              options: [
                const Option(text: 'Software Engineering'),
                const Option(text: 'Software Cost', isCorrect: true),
                const Option(text: 'Software Process'),
                const Option(text: 'Software Engineering')
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
        "content": "This is content",
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
    ],
  }
};

// materials['ITE4']['lesson1']['title]
