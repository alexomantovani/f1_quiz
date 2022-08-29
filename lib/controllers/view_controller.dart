import 'package:flutter/material.dart';

import '/models/barrichellos_carreer_model.dart';
import '/models/canadian_gp_1992result_model.dart';
import '/models/champions_model.dart';
import '/models/finishing_1976_status_model.dart';
import '/models/massas_races_for_ferrari_model.dart';
import '/models/prost_titles_model.dart';
import '/models/raikkonen_carreer_model.dart';
import '/models/senna_monaco_victories_model.dart';
import '/models/two_thousand_eight_rounds_model.dart';
import '/models/vettels_age_first_title_model.dart';

class ViewController extends ChangeNotifier {
  final List<CanadianGp1992ResultModel> canadianGP1992Results;
  final List<ProstTitlesModel> prostTitlesResults;
  final List<SennaMonacoVictoriesModel> sennaMonacoVictoriesResults;
  final List<ChampionsModel> championsResults;
  final List<Finishing1976StatusModel> finishing1976StatusResults;
  final List<MassasFinishedRacesForFerrariModel>
      massasFinishedRacesForFerrariResults;
  final List<VettelsAgeFirstTitleModel> vettelsFirstTitleAgeResults;
  final List<BarrichellosCarreerModel> barrichellosCarreerResults;
  final List<RaikkonenCarreerModel> raikkonensCarreerReasults;
  final List<TwoThousandEightRoundsModel> twoThousandEightRoundsResults;

  ViewController(
      this.canadianGP1992Results,
      this.prostTitlesResults,
      this.sennaMonacoVictoriesResults,
      this.championsResults,
      this.finishing1976StatusResults,
      this.massasFinishedRacesForFerrariResults,
      this.vettelsFirstTitleAgeResults,
      this.barrichellosCarreerResults,
      this.raikkonensCarreerReasults,
      this.twoThousandEightRoundsResults);

  String returnTitleTwoThousands(int i, int previousIndex) {
    if (previousIndex == 0) {
      if (i == 0) {
        return '120';
      } else if (i == 1) {
        return '115';
      } else if (i == 2) {
        return '142';
      } else {
        return massasFinishedRacesForFerrariResults.length.toString();
      }
    } else if (previousIndex == 1) {
      return vettelsFirstTitleAgeResults[i + 1].age.toString();
    } else if (previousIndex == 2) {
      if (i == 0) {
        return barrichellosCarreerResults.length.toString();
      } else if (i == 1) {
        return '${barrichellosCarreerResults.length - 20}';
      } else if (i == 2) {
        return '${barrichellosCarreerResults.length + 14}';
      } else {
        return '${barrichellosCarreerResults.length + 45}';
      }
    } else if (previousIndex == 3) {
      if (i == 0) {
        return raikkonensCarreerReasults.length.toString();
      } else if (i == 1) {
        return '${raikkonensCarreerReasults.length - 20}';
      } else if (i == 2) {
        return '${raikkonensCarreerReasults.length + 14}';
      } else {
        return '${raikkonensCarreerReasults.length + 45}';
      }
    } else {
      if (i == 2) {
        return twoThousandEightRoundsResults[17].circuitName;
      } else {
        return twoThousandEightRoundsResults[i].circuitName;
      }
    }
  }

  String returnTitleClassics(int i, int previousIndex) {
    if (previousIndex == 0) {
      if (i == 1) {
        return canadianGP1992Results[9].driversName;
      } else {
        return canadianGP1992Results[i].driversName;
      }
    } else if (previousIndex == 1) {
      if (i == 0) {
        return 'Ferrari';
      } else if (i == 1) {
        return 'Jordan';
      } else if (i == 2) {
        return prostTitlesResults[1].constructorName;
      } else {
        return 'Toyota';
      }
    } else if (previousIndex == 2) {
      switch (i) {
        case 0:
          return '2';
        case 1:
          return sennaMonacoVictoriesResults[i].victoriesCount;
        case 2:
          return '4';
        case 3:
          return '8';
        default:
          return sennaMonacoVictoriesResults[i].victoriesCount;
      }
    } else if (previousIndex == 3) {
      if (i == 0) {
        return championsResults[i + 33].driverName;
      } else if (i == 1) {
        return championsResults[50].driverName.replaceFirst('michael_', '');
      } else if (i == 2) {
        return championsResults[60].driverName;
      } else {
        return championsResults[55].driverName;
      }
    } else {
      if (i == 0) {
        return finishing1976StatusResults[9].circuitName;
      }
      return finishing1976StatusResults[i].circuitName;
    }
  }
}
