using AdysTech.CredentialManager;
using CredentialManagement;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Net;
using System.Web.UI;

namespace WebApplication1 {
    public partial class _Default : Page {

        protected void Page_Load (object sender, EventArgs e) {
            if (!IsPostBack) {
                //Globals.cred = CredentialManager.PromptForCredentials ("Target", ref Globals.save, "Please enter credentials", "Enter credentials");
                Globals.searcher = new DirectorySearcher (new DirectoryEntry ("LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com", "mcarter-adm", "KibethAstarael1"));
            }
        }

        public List<Users> GetAllADUsers () {
            try {
                List<Users> listADUsers = new List<Users> ();
                string DomainPath = "LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com";
                DirectoryEntry searchRoot = new DirectoryEntry (DomainPath);
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
            if (input.Contains ("CN=")) {
                Globals.searcher.Filter = $"(&(objectClass=user)(distinguishedname={input}))";
            } else {
                Globals.searcher.Filter = $"(&(objectClass=user)(samaccountname={input}))";
            }

            return Globals.searcher.FindOne ();
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
            SearchResult managerObj = GetSingleADUser ((string)input.Properties["manager"][0]);
            string managerName = (string)managerObj.Properties["displayname"][0];
            string DoH = input.Properties["description"][0].ToString ().Split (' ')[2];
            string DoT;
            try {
                DoT = input.Properties["description"][0].ToString ().Split (' ')[6];
            } catch {
                DoT = "N/A";
            }

            List<string> dirrep = new List<string> (); var listReports = input.Properties["directreports"];
            for (int i = 0; i < listReports.Count; i++) {
                dirrep.Add ((string)GetSingleADUser ((string)listReports[i]).Properties["displayname"][0]);
            }

            Users user = new Users {
                DisplayName = (string)input.Properties["displayname"][0],
                Email = (string)input.Properties["mail"][0],
                UserName = (string)input.Properties["samaccountname"][0],
                Enabled = !Convert.ToBoolean ((int)input.Properties["useraccountcontrol"][0] & 2),
                LastLogon = (input.Properties["lastlogon"] != null && input.Properties["lastlogon"].Count > 0) ? DateTime.FromFileTime ((long)input.Properties["lastlogon"][0]).ToString () : "N/A",
                EmployeeID = (string)input.Properties["employeeid"][0],
                Department = (string)input.Properties["department"][0],
                EmployeeNumber = input.Properties["employeenumber"] != null ? (string)input.Properties["employeenumber"][0] : "Restricted",
                Title = (string)input.Properties["title"][0],
                PassLastChanged = (input.Properties["pwdlastset"] != null && input.Properties["pwdlastset"].Count > 0) ? DateTime.FromFileTime ((long)input.Properties["pwdlastset"][0]).ToString () : "N/A",
                Manager = managerName,
                PassExpiration = (input.Properties["pwdlastset"] != null && Convert.ToBoolean ((int)input.Properties["useraccountcontrol"][0] & 65536)) ? "N/A" : DateTime.FromFileTime ((long)input.Properties["pwdlastset"][0]).AddDays (120).ToString (),
                FailedLogonTime = (input.Properties["badpasswordtime"] != null && input.Properties["badpasswordtime"].Count > 0) ? DateTime.FromFileTime ((long)input.Properties["badpasswordtime"][0]).ToString () : "N/A",
                NumFailedLogons = (int)input.Properties["badpwdcount"][0],
                DateOfHire = DoH,
                DateOfTermination = DoT == "" ? "N/A" : DoT,
                LastModified = (input.Properties["whenchanged"] != null && input.Properties["whenchanged"].Count > 0) ? input.Properties["whenchanged"][0].ToString() : "N/A",
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
            textUMLastLogon.Text = Globals.User.LastLogon.ToString();
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
        }

        protected void listUsers_SelectedIndexChanged (object sender, EventArgs e) {

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