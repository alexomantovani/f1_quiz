enum QuizMode {
  challengeClassics,
  challenge2000s,
}

class QuestionsModel {
  final Map<String, List<String>> questionnaire = {
    QuizMode.challengeClassics.name: [
      'Qual piloto venceu o GP do Canadá em 1992?',
      'Por qual equipe Alain Prost ganhou seu primeiro título mundial?',
      'Quantas vitórias no GP de Mônaco Senna teve?',
      'Qual piloto está empatado com Lewis Hamilton em títulos mundiais?',
      'Em qual circuito Niki Lauda sofreu um grave acidente?',
    ],
    QuizMode.challenge2000s.name: [
      'Quantas corridas Felipe Massa terminou pela Scuderia Ferrari?',
      'Com quantos anos o tetracampeão Sebastian Vettel conquistou seu primeiro título?',
      'Quantas corridas Rubens Barrichelo fez em sua carreira?',
      'Qual é o recorde de número de corridas completas por um piloto e qual seu nome?',
      'Qual GP Lewis Hamilton sagrou-se campeão mundial pela primeira vez?',
    ],
  };
}
