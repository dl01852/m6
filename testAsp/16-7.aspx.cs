using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace testAsp
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string[] bannedEmails;
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //http://jupaol.blogspot.mx/2012/09/enabling-unobtrusive-validation-from.html

            // parse the bannedEmails on the server and put them in the array.
            var document = XDocument.Load(Server.MapPath("xmlFiles\\bannedemails.xml"));
            bannedEmails = document.Descendants("email").Select(x => x.Value).ToArray();
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            if (txtName.Text == "")
                RequiredFieldValidator1.Text = "Name is required";
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // server validation to make sure user doesn't enter an email that isn't aloud
            string email = txtEmail.Text;
            if (bannedEmails.All(bannedEmail => email != bannedEmail))
            {
               clearForm();
                return;
            };
            RequiredEmailField.Text = "banned email";
            RequiredEmailField.IsValid = false;
           
        }

        private void clearForm()
        {
            RequiredEmailField.Text = "*";
            txtName.Text = "";
            txtEmail.Text = "";
            lstRatings.SelectedIndex = -1;
            radBtns.SelectedIndex = -1;
        }
    }
}