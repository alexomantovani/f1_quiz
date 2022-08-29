import 'dart:async';

import '/services/http_package_client.dart';

import '/models/barrichellos_carreer_model.dart';
import '/models/massas_races_for_ferrari_model.dart';
import '/models/raikkonen_carreer_model.dart';
import '/models/two_thousand_eight_rounds_model.dart';
import '/models/vettels_age_first_title_model.dart';

import '/models/champions_model.dart';
import '/models/finishing_1976_status_model.dart';
import '/models/senna_monaco_victories_model.dart';
import '/models/canadian_gp_1992result_model.dart';
import '/models/prost_titles_model.dart';
import '/services/http_client_interface.dart';

class JsonPlaceholderService {
  final IHttpClient client = HttpPackageClient();

  Future<List<CanadianGp1992ResultModel>> get1992CanadianGpResult() async {
    var canadianGpResultUrl =
        'http://ergast.com/api/f1/1992/circuits/villeneuve/results.json';
    final response = await client.get(canadianGpResultUrl);

    final body = response["MRData"]["RaceTable"]["Races"][0]["Results"] as List;

    final List<CanadianGp1992ResultModel> raceResults =
        body.map((map) => CanadianGp1992ResultModel.fromJson(map)).toList();

    return raceResults;
  }

  Future<List<ProstTitlesModel>> getProstFirstTitle() async {
    var prostTitlesResultUrl =
        'http://ergast.com/api/f1/drivers/prost/driverStandings/1.json';
    final response = await client.get(prostTitlesResultUrl);

    final body = response["MRData"]["StandingsTable"]["StandingsLists"] as List;

    final List<ProstTitlesModel> prostTitlesResults =
        body.map((e) => ProstTitlesModel.fromJson(e)).toList();

    return prostTitlesResults;
  }

  Future<List<SennaMonacoVictoriesModel>> getSennaMonacoVictories() async {
    var sennaMonacoVictoriesUrl =
        'http://ergast.com/api/f1/drivers/senna/circuits/monaco/results/1.json';

    final response = await client.get(sennaMonacoVictoriesUrl);

    final body = response["MRData"]["RaceTable"]["Races"] as List;

    final List<SennaMonacoVictoriesModel> sennaMonacoVictoriesResult =
        body.map((e) => SennaMonacoVictoriesModel.fromJson(e)).toList();

    return sennaMonacoVictoriesResult;
  }

  Future<List<ChampionsModel>> getAllChampions() async {
    var allChampionsUrl =
        'http://ergast.com/api/f1/driverStandings/1.json?limit=300';

    final response = await client.get(allChampionsUrl);

    final body = response["MRData"]["StandingsTable"]["StandingsLists"] as List;

    final List<ChampionsModel> championsResults =
        body.map((e) => ChampionsModel.fromJson(e)).toList();

    return championsResults;
  }

  Future<List<Finishing1976StatusModel>> getFinishingStatus() async {
    var finishing1976StatusUrl =
        'http://ergast.com/api/f1/1976/drivers/lauda/results.json';

    final response = await client.get(finishing1976StatusUrl);

    final body = response["MRData"]["RaceTable"]["Races"] as List;

    final List<Finishing1976StatusModel> finishing1976StatusResults =
        body.map((e) => Finishing1976StatusModel.fromJson(e)).toList();

    return finishing1976StatusResults;
  }

  Future<List<MassasFinishedRacesForFerrariModel>>
      getAllMassasFinishedRacesForFerrari() async {
    var massasFinishedRacesForFerrariUrl =
        'http://ergast.com/api/f1/drivers/massa/constructors/ferrari/status/1/results.json?limit=300';

    final response = await client.get(massasFinishedRacesForFerrariUrl);

    final body = response["MRData"]["RaceTable"]["Races"] as List;

    final List<MassasFinishedRacesForFerrariModel>
        massasFinishedRacesForFerrariResult = body
            .map((map) => MassasFinishedRacesForFerrariModel.fromJson(map))
            .toList();

    return massasFinishedRacesForFerrariResult;
  }

  Future<List<VettelsAgeFirstTitleModel>> getVettelsFirstTitleAge() async {
    var vettelsFirstTitleAgeUrl =
        'http://ergast.com/api/f1/drivers/vettel/driverStandings.json';
    final response = await client.get(vettelsFirstTitleAgeUrl);

    final body = response["MRData"]["StandingsTable"]["StandingsLists"] as List;

    final List<VettelsAgeFirstTitleModel> vettelsFirstTitleAgeResults =
        body.map((map) => VettelsAgeFirstTitleModel.fromJson(map)).toList();

    return vettelsFirstTitleAgeResults;
  }

  Future<List<BarrichellosCarreerModel>> getBarrichellosCarreerRaces() async {
    var barrichellosCarreerUrl =
        'http://ergast.com/api/f1/drivers/barrichello/results.json?limit=360';

    final response = await client.get(barrichellosCarreerUrl);

    final body = response["MRData"]["RaceTable"]["Races"] as List;

    final List<BarrichellosCarreerModel> barrichellosCarrerResults =
        body.map((map) => BarrichellosCarreerModel.fromJson(map)).toList();

    return barrichellosCarrerResults;
  }

  Future<List<RaikkonenCarreerModel>> getraikkonensCarreerRaces() async {
    var raikkonensCarreerUrl =
        'http://ergast.com/api/f1/drivers/raikkonen/results.json?limit=360';

    final response = await client.get(raikkonensCarreerUrl);

    final body = response["MRData"]["RaceTable"]["Races"] as List;

    final List<RaikkonenCarreerModel> raikkonensCarrerResults =
        body.map((map) => RaikkonenCarreerModel.fromJson(map)).toList();

    return raikkonensCarrerResults;
  }

  Future<List<TwoThousandEightRoundsModel>> getTwoThousandEightRounds() async {
    var twoThousandEightRoundsUrl =
        'http://ergast.com/api/f1/2008/drivers/hamilton/results.json';

    final response = await client.get(twoThousandEightRoundsUrl);

    final body = response["MRData"]["RaceTable"]["Races"] as List;

    final twoThousandEightRoundsResults =
        body.map((map) => TwoThousandEightRoundsModel.fromJson(map)).toList();

    return twoThousandEightRoundsResults;
  }
}
