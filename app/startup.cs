/ enable local 'App_Data' folder to access local documents
AppDomain.CurrentDomain.SetData("DataDirectory", System.IO.Path.Combine(env.ContentRootPath, "App_Data"));

// serve static linked files (JavaScript and CSS for the editor)
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new Microsoft.Extensions.FileProviders.PhysicalFileProvider(
       System.IO.Path.Combine(System.IO.Path.GetDirectoryName(
           System.Reflection.Assembly.GetEntryAssembly().Location),
           "TXTextControl.Web")),
    RequestPath = "/TXTextControl.Web"
});

// enable Web Sockets
app.UseWebSockets();

// attach the Text Control WebSocketHandler middleware
app.UseMiddleware<TXTextControl.Web.WebSocketMiddleware>();
