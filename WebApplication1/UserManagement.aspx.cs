using AdysTech.CredentialManager;
using CredentialManagement;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Linq;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1 {
    public partial class _Default : Page {

        protected void Page_Load (object sender, EventArgs e) {
            if (!IsPostBack) {
                //Globals.cred = CredentialManager.PromptForCredentials ("Target", ref Globals.save, "Please enter credentials", "Enter credentials");
                Globals.cred = new NetworkCredential ("mcarter-adm", "KibethAstarael1");
                Globals.searcher = new DirectorySearcher (new DirectoryEntry ("LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com", Globals.cred.UserName, Globals.cred.Password));
            }
        }

        public List<Users> GetAllADUsers () {
            try {
                List<Users> listADUsers = new List<Users> ();
                string DomainPath = "LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com";
                DirectoryEntry searchRoot = new DirectoryEntry (DomainPath, Globals.cred.UserName, Globals.cred.Password);
                DirectorySearcher searcher = new DirectorySearcher (searchRoot) {
                    Filter = "(objectClass=user)"
                };
                searcher.PropertiesToLoad.Add ("mail");
                searcher.PropertiesToLoad.Add ("displayname");
                searcher.PropertiesToLoad.Add ("samaccountname");
                SearchResult result;
                SearchResultCollection results = searcher.FindAll ();

                if (results != null) {
                    for (int i = 0; i < results.Count; i++) {
                        result = results[i];
                        Users temp = new Users {
                            DisplayName = (string)result.Properties["displayname"][0],
                            UserName = (string)result.Properties["samaccountname"][0]
                        };
                        if (result.Properties["mail"].Count > 0) {
                            temp.Email = (string)result.Properties["mail"][0];
                        }
                        listADUsers.Add (temp);
                    }
                }
                return listADUsers;

                //Label1.Text = listADUsers[0].DisplayName;
            } catch {
                return null;
            }
        }

        protected void Button1_Click (object sender, EventArgs e) {
            UpdateUserInfo (GetSingleADUser (listUsers.SelectedValue));
        }

        protected void listUsers_Load (object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                UpdateListUsers ();
            }
            //listUsers.Items.
        }

        public SearchResult GetSingleADUser (string input) {
            if (input != null && input != " ") {
                Globals.searcher.Filter = input.Contains ("CN=")
                    ? $"(&(objectClass=user)(distinguishedname={input}))"
                    : $"(&(objectClass=user)(samaccountname={input}))";

                return Globals.searcher.FindOne ();
            } else {
                return null;
            }
        }

        public SearchResult GetSingleEXUser (string input) {
            if (input.Contains ("CN=")) {
                Globals.searcher.Filter = $"(&(objectClass=user)(distinguishedname={input}))";
            } else {
                Globals.searcher.Filter = $"(&(objectClass=user)(samaccountname={input}))";
            }

            Globals.searcher.SearchRoot = new DirectoryEntry ("LDAP://OU=Springdale, DC=US, DC=PaschalCorp, DC=com", Globals.cred.UserName, Globals.cred.Password);
            SearchResult res = Globals.searcher.FindOne ();
            Globals.searcher.SearchRoot = new DirectoryEntry ("LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com", Globals.cred.UserName, Globals.cred.Password);

            return res;
        }

        public void UpdateListUsers () {
            List<Users> UserList = GetAllADUsers (); List<string> UserNameList = new List<string> {
                " "
            };

            foreach (var item in UserList) {
                UserNameList.Add ((string)item.UserName);
            }

            listUsers.DataSource = UserNameList;
            listUsers.DataBind ();
        }

        public void UpdateUserInfo (SearchResult input) {
            if (input != null) {
                SearchResult managerObj;
                string managerName; string managerDisname;
                try {
                    managerObj = GetSingleADUser ((string)input.Properties["manager"][0]);
                    if (managerObj == null) {
                        managerObj = GetSingleEXUser ((string)input.Properties["manager"][0]);
                    }
                    if (managerObj != null) {
                        managerName = (string)managerObj.Properties["displayname"][0];
                        managerDisname = (string)managerObj.Properties["distinguishedname"][0];
                        if (managerDisname.Contains ("Terminated")) {
                            managerName += " - TERM - Please update";
                        }
                    } else {
                        managerName = "Not found - Please update";
                    }
                } catch {
                    managerName = "Not found - Please update";
                }

                string DoH = input.Properties["description"][0].ToString ().Split (' ')[2];
                string DoT;
                try {
                    DoT = input.Properties["description"][0].ToString ().Split (' ')[6];
                } catch {
                    DoT = "N/A";
                }

                List<string> dirrep = new List<string> (); var listReports = input.Properties["directreports"];
                if (listReports != null) {
                    for (int i = 0; i < listReports.Count; i++) {
                        SearchResult temp = GetSingleADUser ((string)listReports[i]);
                        if (temp == null) {
                            temp = GetSingleEXUser ((string)listReports[i]);
                        }
                        string name = (string)temp.Properties["displayname"][0];
                        string disname = (string)temp.Properties["distinguishedname"][0];

                        if (disname.Contains ("Contractors")) {
                            name += " - CONTR";
                        } else if (disname.Contains ("Terminated")) {
                            name += " - TERM";
                        }

                        dirrep.Add (name);
                    }
                }

                Users user = new Users {
                    DisplayName = (string)input.Properties["displayname"][0],
                    Email = (string)input.Properties["mail"][0],
                    UserName = (string)input.Properties["samaccountname"][0],
                    Enabled = !Convert.ToBoolean ((int)input.Properties["useraccountcontrol"][0] & 2),
                    LastLogon = (input.Properties["lastlogon"] != null && input.Properties["lastlogon"].Count > 0) ? DateTime.FromFileTime ((long)input.Properties["lastlogon"][0]).ToString () : "N/A",
                    EmployeeID = (string)input.Properties["employeeid"][0],
                    Department = (string)input.Properties["department"][0],
                    EmployeeNumber = input.Properties["employeenumber"].Count > 0 ? (string)input.Properties["employeenumber"][0] : "Restricted",
                    Title = (string)input.Properties["title"][0],
                    PassLastChanged = (input.Properties["pwdlastset"] != null && input.Properties["pwdlastset"].Count > 0) ? DateTime.FromFileTime ((long)input.Properties["pwdlastset"][0]).ToString () : "N/A",
                    Manager = managerName,
                    PassExpiration = (input.Properties["pwdlastset"] != null && Convert.ToBoolean ((int)input.Properties["useraccountcontrol"][0] & 65536)) ? "N/A" : DateTime.FromFileTime ((long)input.Properties["pwdlastset"][0]).AddDays (120).ToString (),
                    FailedLogonTime = (input.Properties["badpasswordtime"] != null && input.Properties["badpasswordtime"].Count > 0) ? DateTime.FromFileTime ((long)input.Properties["badpasswordtime"][0]).ToString () : "N/A",
                    NumFailedLogons = (int)input.Properties["badpwdcount"][0],
                    DateOfHire = DoH,
                    DateOfTermination = DoT == "" ? "N/A" : DoT,
                    LastModified = (input.Properties["whenchanged"] != null && input.Properties["whenchanged"].Count > 0) ? input.Properties["whenchanged"][0].ToString () : "N/A",
                    DirectReports = dirrep
                };

                //if (input.Properties["lastlogon"] != null && input.Properties["lastlogon"].Count > 0) {
                //    user.LastLogon = (DateTime.FromFileTime ((long)input.Properties["lastlogon"][0]).ToString ());
                //} else {
                //    user.LastLogon = "N/A";
                //}

                Globals.User = user;

                textUMName.Text = Globals.User.DisplayName;
                if (Globals.User.Enabled) {
                    textUMEnabled.Text = "True";
                } else {
                    textUMEnabled.Text = "False";
                }
                textUMUsername.Text = Globals.User.UserName;
                textUMLastLogon.Text = Globals.User.LastLogon.ToString ();
                textUMEmail.Text = Globals.User.Email;
                textUMEmployeeID.Text = Globals.User.EmployeeID;
                textUMDepartment.Text = Globals.User.Department;
                textUMEmployeeNumber.Text = Globals.User.EmployeeNumber;
                textUMTitle.Text = Globals.User.Title;
                textUMPassLastChanged.Text = Globals.User.PassLastChanged;
                textUMManager.Text = Globals.User.Manager;
                textUMPassExpiration.Text = Globals.User.PassExpiration;
                textUMNumFailedLogons.Text = Globals.User.NumFailedLogons.ToString ();
                textUMFailedLogons.Text = Globals.User.FailedLogonTime;
                textUMDateOfHire.Text = Globals.User.DateOfHire;
                textUMDateOfTermination.Text = Globals.User.DateOfTermination;
                textUMLastModified.Text = Globals.User.LastModified;
                listUMDirectReports.DataSource = Globals.User.DirectReports;
                listUMDirectReports.DataBind ();
            } else {
                ClearUserProperties ();
            }
        }

        protected void listUsers_SelectedIndexChanged (object sender, EventArgs e) {
            UpdateUserInfo (GetSingleADUser (listUsers.SelectedValue));
        }

        public void ClearUserProperties () {
            var textBoxes = GetChildControls<TextBox> (Panel1);
            foreach (var box in textBoxes) {
                box.Text = "";
            }
            listUMDirectReports.Items.Clear ();
        }

        public static IEnumerable<TControl> GetChildControls<TControl> (Control control) where TControl : Control {
            var children = (control.Controls != null) ? control.Controls.OfType<TControl> () : Enumerable.Empty<TControl> ();
            return children.SelectMany (c => GetChildControls<TControl> (c)).Concat (children);
        }
    }

    public class Users {
        public string Email { get; set; }
        public string UserName { get; set; }
        public string DisplayName { get; set; }
        public bool Enabled { get; set; }
        public bool IsMapped { get; set; }
        public string LastLogon { get; set; }
        public string EmployeeID { get; set; }
        public string Department { get; set; }
        public string EmployeeNumber { get; set; }
        public string Title { get; set; }
        public string PassLastChanged { get; set; }
        public string Manager { get; set; }
        public string PassExpiration { get; set; }
        public string FailedLogonTime { get; set; }
        public int NumFailedLogons { get; set; }
        public string DateOfHire { get; set; }
        public string DateOfTermination { get; set; }
        public string LastModified { get; set; }
        public List<string> DirectReports { get; set; }
    }

    static class Globals {
        public static Users User;
        public static NetworkCredential cred;
        public static DirectorySearcher searcher;
        public static bool save = true;
    }
}