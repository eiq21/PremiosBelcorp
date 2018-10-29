using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.AwardModule.Service
{
    public interface IAwardAppService
    {
        ICollection<CampaignUrl> ListBannersByCampaign();
        ICollection<Tiles> ListTiles();
        ICollection<DetailByTeam> ListDetailByTeam(int teamId, string codeUser);
        Votation InsertVotation(InsertVotation insertVotation);
        Votation UpdateVotation(UpdateVotation updateVotation);
        ICollection<Suggestions> ListSuggestionsForUser(string codeUser);
    }
}
