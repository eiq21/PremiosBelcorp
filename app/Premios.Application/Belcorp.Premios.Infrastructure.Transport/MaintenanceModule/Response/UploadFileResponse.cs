using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response
{
    public class UploadFileResponse : BaseResponse
    {
        public ICollection<UploadFileResult> UploadFilesResult { get; set; }
        public UploadFileResponse()
        {
            UploadFilesResult = new List<UploadFileResult>();
        }

    }
}
