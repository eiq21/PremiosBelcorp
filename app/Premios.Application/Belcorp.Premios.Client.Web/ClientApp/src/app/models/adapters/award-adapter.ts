import { Injectable } from "@angular/core";
import { Tiles, CampaignUrl } from "../dtos/index";
import { TileViewModel, BannerViewModel } from "../../modules/awards/viewmodels/index";

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

}
