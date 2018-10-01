using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace Belcorp.Premios.API._Code.ExceptionHandling
{
    public static class ApiExceptionExtension
    {

        public static IApplicationBuilder UseApiExceptionHandler(this IApplicationBuilder app)
        {
            if (app == null)
            {
                throw new ArgumentNullException(nameof(app));
            }

            return app.UseExceptionHandler(errorApp =>
                errorApp.Run(async (context) =>
                {
                    context.Response.StatusCode = 500;
                    context.Response.ContentType = "text/html";
                    await context.Response.WriteAsync("<html><body>\r\n");
                    await context.Response.WriteAsync(
                            "We're sorry, we encountered an un-expected issue with your application.<br>\r\n");

                    // Capture the exception
                    var error = context.Features.Get<IExceptionHandlerFeature>();
                    if (error != null)
                    {
                        // This error would not normally be exposed to the client
                        await
                        context.Response.WriteAsync("<br>Error: " +
                                                    HtmlEncoder.Default.Encode(error.Error.Message) +
                                                    "<br>\r\n");
                    }
                    await context.Response.WriteAsync("<br><a href=\"/\">Home</a><br>\r\n");
                    await context.Response.WriteAsync("</body></html>\r\n");
                    await context.Response.WriteAsync(new string(' ', 512)); // Padding for IE
                }));
        }
    }
}
