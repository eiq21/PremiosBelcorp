import { Injectable } from "@angular/core";
import { Tiles, CampaignUrl, Detail, Votation, Suggestion } from "../dtos/index";
import { TileViewModel, BannerViewModel, DetailViewModel } from "../../modules/awards/viewmodels/index";
import { VotationViewModel } from "../../modules/awards/viewmodels/votation-view-model";
import { SuggestionsViewModel } from "../../modules/awards/viewmodels/suggestions-view-model";

@Injectable()
export class AwardAdapter {

  constructor() {
  }

  TilesToTilesViewModel(tiles: Tiles[]): TileViewModel[] {

    let tilesVM: TileViewModel[] = new Array<TileViewModel>();

    tiles.forEach(function (t) {
      let tile: TileViewModel = new TileViewModel();
      tile.TeamId = t.TeamId,
        tile.TeamUrlId = t.TeamUrlId,
        tile.TypeUrlId = t.TypeUrlId,
        tile.Description = t.Description,
        tile.Name = t.Name,
        tile.ImageValueUrl = t.ImageValueUrl,
        tile.VideoPreviewValueUrl = t.VideoPreviewValueUrl

      tilesVM.push(tile);
    });

    return tilesVM;
  }

  BannersToBannersViewModel(banners: CampaignUrl[]): BannerViewModel[] {

    let bannerVM: BannerViewModel[] = new Array<BannerViewModel>();

    banners.forEach(function (p) { 
      let banner: BannerViewModel = new BannerViewModel();
      banner.CampaignId = p.CampaignId,
        banner.TypeUrlId = p.TypeUrlId,
        banner.ValueUrl = p.ValueUrl,
        banner.Description = p.Description

      bannerVM.push(banner);
    });

    return bannerVM;
  }

  DetailToDetailViewModel(detail: Detail[]): DetailViewModel[] {

    let detailVM: DetailViewModel[] = new Array<DetailViewModel>();

    detail.forEach(function (d) {
      let det: DetailViewModel = new DetailViewModel();
        det.TeamId = d.TeamId;
        det.Synopsis = d.Synopsis;
        det.Protagonists = d.Protagonists;
        det.ValueUrl = d.ValueUrl;
        det.Name = d.Name;
        det.Vote = d.Vote;
        det.VotationId = d.VotationId;
      detailVM.push(det);
    });

    return detailVM;
  }

  VotationToVotationViewModel(votation: Votation): VotationViewModel[] {

    let votationVM: VotationViewModel[] = new Array<VotationViewModel>();
    let vot: VotationViewModel = new VotationViewModel();
    let objVote: Votation;

    objVote = votation;

    vot.TeamId = objVote.TeamId;
    vot.VotationId = objVote.VotationId;
    vot.Value = objVote.Value;
    vot.UserCode = objVote.UserCode;

    votationVM.push(vot); 

    return votationVM;
  }

  SuggestionsToSuggestionsViewModel(suggestions: Suggestion[]): SuggestionsViewModel[] {

    let suggestionsVM: SuggestionsViewModel[] = new Array<SuggestionsViewModel>();

    suggestions.forEach(function (s) {

      let suggest: SuggestionsViewModel = new SuggestionsViewModel();

        suggest.TeamId = s.TeamId,
        suggest.Description = s.Description,
        suggest.Name = s.Name,
        suggest.ValueUrl = s.ValueUrl

        suggestionsVM.push(suggest);
    });

    return suggestionsVM;
  }


}
