import '/models/barrichellos_carreer_model.dart';
import '/models/champions_model.dart';
import '/models/finishing_1976_status_model.dart';
import '/models/massas_races_for_ferrari_model.dart';
import '/models/prost_titles_model.dart';
import '/models/raikkonen_carreer_model.dart';
import '/models/senna_monaco_victories_model.dart';
import '/models/canadian_gp_1992result_model.dart';
import '/models/two_thousand_eight_rounds_model.dart';
import '/models/vettels_age_first_title_model.dart';

import 'package:flutter/material.dart';
import '/services/json_placeholder_service.dart';

class HomeController extends ChangeNotifier {
  final _service = JsonPlaceholderService();

  var canadianGP1992Results = <CanadianGp1992ResultModel>[];
  Future<void> fetchAll1992CanadianGpResult() async {
    canadianGP1992Results = await _service.get1992CanadianGpResult();
    notifyListeners();
  }

  var prostTitlesResults = <ProstTitlesModel>[];
  Future<void> fetchAllProstTitlesResults() async {
    prostTitlesResults = await _service.getProstFirstTitle();
    notifyListeners();
  }

  var sennaMonacoVictoriesResults = <SennaMonacoVictoriesModel>[];
  Future<void> fetchAllSennaMonacoVictoriesResults() async {
    sennaMonacoVictoriesResults = await _service.getSennaMonacoVictories();
    notifyListeners();
  }

  var championsResults = <ChampionsModel>[];
  Future<void> fetchAllChampionsResults() async {
    championsResults = await _service.getAllChampions();
    notifyListeners();
  }

  var finishing1976StatusResults = <Finishing1976StatusModel>[];
  Future<void> fetchAllLaudas1976FinishingStatusResults() async {
    finishing1976StatusResults = await _service.getFinishingStatus();
    notifyListeners();
  }

  var massasFinishedRacesForFerrariResults =
      <MassasFinishedRacesForFerrariModel>[];
  Future<void> fetchAllMassasFinishedRacesForFerrariResults() async {
    massasFinishedRacesForFerrariResults =
        await _service.getAllMassasFinishedRacesForFerrari();
    notifyListeners();
  }

  var vettelsFirstTitleAgeResults = <VettelsAgeFirstTitleModel>[];
  Future<void> fetchAllVettelsDriverStandingsResults() async {
    vettelsFirstTitleAgeResults = await _service.getVettelsFirstTitleAge();
    notifyListeners();
  }

  var barrichellosCarreerResults = <BarrichellosCarreerModel>[];
  Future<void> fetchAllBarrichellosCarreerResults() async {
    barrichellosCarreerResults = await _service.getBarrichellosCarreerRaces();
    notifyListeners();
  }

  var raikkonensCarreerReasults = <RaikkonenCarreerModel>[];
  Future<void> fetchAllRaikkonensCarreerResults() async {
    raikkonensCarreerReasults = await _service.getraikkonensCarreerRaces();
    notifyListeners();
  }

  var twoThousandEightRoundsResults = <TwoThousandEightRoundsModel>[];
  Future<void> fetchAllTwoThousandEightResults() async {
    twoThousandEightRoundsResults = await _service.getTwoThousandEightRounds();
    notifyListeners();
  }
}
