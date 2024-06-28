import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chapter_list_controller.dart';
import 'sliding_button.dart';
import 'subtopics.dart';

class SubjectPage extends StatelessWidget {
  final String subject;
  final List<String> chapters;
  final List<List<String>> subtopics;

  const SubjectPage({
    Key? key,
    required this.subject,
    required this.chapters,
    required this.subtopics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          subject,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ChapterListController>(
        builder: (_) => Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (BuildContext context, int index) {
              bool allOn = _.areAllSwitchesOn(index);
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ExpansionTile(
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.white),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Text(
                            chapters[index].toUpperCase(),
                            style: TextStyle(
                              color: allOn ? Colors.green : Colors.white,
                              fontSize: 14,
                              decoration: allOn
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.green,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow("Lectures", index, 0),
                            SizedBox(height: 20.0),
                            _buildRow("Notes", index, 1),
                            SizedBox(height: 20.0),
                            _buildRow("Questions", index, 2),
                            SizedBox(height: 20.0),
                            _buildRow("Text", index, 3),
                            SizedBox(height: 25.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubtopicsPage(
                                        chapterName: chapters[index],
                                        subtopics: subtopics[index],
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 70.0, vertical: 15.0),
                                ),
                                child: Text(
                                  'Check Subtopics',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, int chapterIndex, int rowIndex) {
    return GetBuilder<ChapterListController>(
      builder: (_) => Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          SlidingButton(
            isOn: _.switchStates[chapterIndex][rowIndex].value,
            onToggle: () {
              _.toggleSwitch(chapterIndex, rowIndex);
            },
          ),
        ],
      ),
    );
  }
}

// Mathematics data
final List<String> mathematicsChapters = [
  'Sets',
  'Relations and Functions',
  'Trigonometric Functions',
  'Principle of Mathematical Induction',
  'Complex Numbers and Quadratic Equations',
  'Linear Inequalities',
  'Permutations and Combinations',
  'Binomial Theorem',
  'Sequences and Series',
  'Straight Lines',
  'Conic Sections',
  'Introduction to Three Dimensional Geometry',
  'Limits and Derivatives',
  'Mathematical Reasoning',
  'Statistics',
  'Probability',
];

final List<List<String>> mathematicsSubtopics = [
  [
    'Introduction to Sets',
    'Types of Sets',
    'Operations on Sets',
    'Venn Diagrams'
  ],
  [
    'Types of Relations',
    'Functions and Their Types',
    'Composition of Functions',
    'Invertible Functions'
  ],
  [
    'Introduction to Trigonometry',
    'Trigonometric Ratios',
    'Trigonometric Identities',
    'Graphs of Trigonometric Functions'
  ],
  [
    'Understanding Induction',
    'Steps in Induction',
    'Examples of Induction',
    'Strong Induction'
  ],
  [
    'Introduction to Complex Numbers',
    'Operations on Complex Numbers',
    'Quadratic Equations and Roots',
    'Complex Plane and Geometry'
  ],
  [
    'Graphing Linear Inequalities',
    'Solving Linear Inequalities',
    'Systems of Linear Inequalities',
    'Applications of Linear Inequalities'
  ],
  [
    'Permutations',
    'Combinations',
    'Factorial Notation',
    'Applications in Probability'
  ],
  [
    'Expansion of Binomials',
    'Binomial Coefficients',
    'Applications in Probability',
    'Pascal\'s Triangle'
  ],
  [
    'Arithmetic Sequences',
    'Geometric Sequences',
    'Summation of Series',
    'Infinite Series'
  ],
  [
    'Equation of a Line',
    'Slope and Intercept Form',
    'Distance and Midpoint Formula',
    'Parallel and Perpendicular Lines'
  ],
  ['Circle', 'Parabola', 'Ellipse', 'Hyperbola'],
  [
    'Coordinates in 3D',
    'Distance between Points',
    'Equation of a Plane',
    'Intersection of Planes'
  ],
  [
    'Understanding Limits',
    'Properties of Limits',
    'Derivatives and Rules',
    'Applications of Derivatives'
  ],
  [
    'Statements and Connectives',
    'Logical Equivalence',
    'Arguments and Validity',
    'Methods of Proof'
  ],
  [
    'Measures of Central Tendency',
    'Measures of Dispersion',
    'Probability Distributions',
    'Statistical Sampling'
  ],
  [
    'Fundamentals of Probability',
    'Conditional Probability',
    'Probability Distributions',
    'Random Variables'
  ],
];

// Chemistry data
final List<String> chemistryChapters = [
  'Atomic Structure',
  'Chemical Bonding',
  'States of Matter',
  'Chemical Thermodynamics',
  'Electrochemistry',
  'Chemical Kinetics',
  'Surface Chemistry',
  'Coordination Compounds',
  'Organic Chemistry',
  'Polymers',
  'Biomolecules',
  'Chemistry in Everyday Life',
  'Environmental Chemistry',
  'Analytical Chemistry',
];

final List<List<String>> chemistrySubtopics = [
  [
    'Discovery of Electron',
    'Models of Atom',
    'Quantum Numbers',
    'Electronic Configuration'
  ],
  [
    'Types of Chemical Bonds',
    'Bond Parameters',
    'Molecular Orbital Theory',
    'Hybridization'
  ],
  ['Gaseous State', 'Liquid State', 'Solid State', 'Phase Diagrams'],
  [
    'Laws of Thermodynamics',
    'Enthalpy and Entropy',
    'Spontaneity and Gibbs Free Energy',
    'Thermochemical Equations'
  ],
  [
    'Electrochemical Cells',
    'Electrolytic Conductance',
    'Nernst Equation',
    'Applications of Electrochemistry'
  ],
  [
    'Rates of Reactions',
    'Factors Affecting Rate of Reaction',
    'Order and Molecularity',
    'Integrated Rate Laws'
  ],
  [
    'Adsorption and Absorption',
    'Catalysis and Types',
    'Applications of Surface Chemistry',
    'Colloidal State'
  ],
  [
    'Werner\'s Coordination Theory',
    'Nomenclature of Coordination Compounds',
    'Isomerism in Coordination Compounds',
    'Applications of Coordination Compounds'
  ],
  [
    'Introduction to Organic Chemistry',
    'Classification of Organic Compounds',
    'Isomerism in Organic Compounds',
    'Nomenclature of Organic Compounds'
  ],
  [
    'Classification of Polymers',
    'Methods of Polymerization',
    'Properties and Applications of Polymers',
    'Biodegradable Polymers'
  ],
  ['Carbohydrates', 'Lipids', 'Proteins', 'Nucleic Acids'],
  [
    'Chemistry in Medicine',
    'Chemistry in Food',
    'Chemistry in Cosmetics',
    'Chemistry in Agriculture'
  ],
  ['Water Pollution', 'Air Pollution', 'Soil Pollution', 'Green Chemistry'],
  [
    'Qualitative Analysis',
    'Quantitative Analysis',
    'Chromatography',
    'Spectroscopy'
  ],
];

// Physics data
final List<String> physicsChapters = [
  'Mechanics',
  'Thermodynamics',
  'Electromagnetism',
  'Optics',
  'Modern Physics',
  'Nuclear Physics',
];

final List<List<String>> physicsSubtopics = [
  [
    'Newton\'s Laws of Motion',
    'Work, Energy, and Power',
    'Systems of Particles',
    'Circular Motion'
  ],
  [
    'Laws of Thermodynamics',
    'Heat Transfer',
    'Thermal Properties of Matter',
    'Kinetic Theory of Gases'
  ],
  [
    'Electrostatics',
    'Electric Circuits',
    'Magnetic Effects of Current',
    'Electromagnetic Waves'
  ],
  [
    'Reflection and Refraction',
    'Interference and Diffraction',
    'Lens and Mirrors',
    'Optical Instruments'
  ],
  [
    'Photoelectric Effect',
    'Quantum Mechanics',
    'Special Relativity',
    'Semiconductor Physics'
  ],
  ['Nuclear Structure', 'Radioactivity', 'Nuclear Reactions', 'Nuclear Fusion'],
];
