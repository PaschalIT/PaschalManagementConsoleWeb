using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI;

namespace WebApplication1 {
    public partial class _Default : Page
    {
        protected void Page_Load (object sender, EventArgs e) {
            
        }

        public List<Users> GetAllADUsers () {
            try {
                List<Users> listADUsers = new List<Users>();
                string DomainPath = "LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com";
                DirectoryEntry searchRoot = new DirectoryEntry (DomainPath);
                DirectorySearcher searcher = new DirectorySearcher (searchRoot) {
                    Filter = "(objectClass=user)"
                };
                searcher.PropertiesToLoad.Add("mail");
                searcher.PropertiesToLoad.Add ("displayname");
                searcher.PropertiesToLoad.Add ("samaccountname");
                SearchResult result;
                SearchResultCollection results = searcher.FindAll ();

                if (results != null) {
                    for (int i = 0; i < results.Count; i++) {
                        result = results[i];
                        Users temp = new Users ();
                        temp.DisplayName = (string)result.Properties["displayname"][0];
                        temp.UserName = (string)result.Properties["samaccountname"][0];
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
            GetSingleADUser (listUsers.Text);
        }

        protected void listUsers_Load (object sender, EventArgs e) {
            Update_listUsers ();
        }

        public SearchResult GetSingleADUser (string input) {
            string DomainPath = "LDAP://OU=Users, OU=Springdale, DC=US, DC=PaschalCorp, DC=com";
            DirectoryEntry searchRoot = new DirectoryEntry (DomainPath);
            DirectorySearcher searcher = new DirectorySearcher (searchRoot) {
                Filter = "(&(objectClass=user)(samaccountname='" + input.Split (' ')[0] + "')"
            };

            return searcher.FindOne ();
        }

        public void Update_listUsers () {
            List<Users> UserList = GetAllADUsers ();

            foreach (var item in UserList) {
                listUsers.Items.Add (item.UserName + " - " + item.DisplayName);
            }
        }
    }

    public class Users {
        public string Email { get; set; }
        public string UserName { get; set; }
        public string DisplayName { get; set; }
        public bool IsMapped { get; set; }
    }
}