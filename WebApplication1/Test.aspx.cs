using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1 {
    public partial class WebForm1 : System.Web.UI.Page {
        protected void Page_Load (object sender, EventArgs e) {
            listTESTUsers.Items.Clear ();
            PrincipalSearcher searcher = new PrincipalSearcher {
                QueryFilter = new UserPrincipal (Globals.principalContext) {
                    SamAccountName = "*m*"
                }
        };
            PrincipalSearchResult<Principal> users = searcher.FindAll ();

            List<string> display = users.Select (user => $"{user.DisplayName} - {user.SamAccountName}").ToList ();
            display.Sort ();
            listTESTUsers.DataSource = display;
            listTESTUsers.DataBind ();
        }
    }
}