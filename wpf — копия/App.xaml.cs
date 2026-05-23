using Khrameeva3.AppWimdows;
using System.Configuration;
using System.Data;
using System.Windows;

namespace Khrameeva3
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            var loginWindom = new LoginWindow();
            loginWindom.Show();
        }
        
    }

}
