using System;
using Microsoft.AspNetCore.Hosting;

namespace Conduit
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var port = Environment.GetEnvironmentVariable("PORT");
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseUrls($"http://+:{port}")
                .UseStartup<Startup>()
                .Build();

            host.Run();
        }
    }
}
