using System;
using MongoDB.Bson;
using MongoDB.Driver;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data;
using System.ComponentModel;

namespace BooksLibrary
{
    public partial class Default : System.Web.UI.Page
    {
        SearchResult searchResult = new SearchResult();
        Book book = new Book();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }

            if (Request["__EVENTTARGET"] == "Search")
            {
                string s = buildQuery();

                Response.Redirect("searchresult.aspx?" + s);
            }

            if (Request["__EVENTTARGET"] == "ClearForm")
            {
                ClearForm();
            }               
        }       

        private void ClearForm()
        {
            txtAuthor.Text = "";
            txtISBN.Text = "";
            txtPublisher.Text = "";
            txtTitle.Text = "";
        }

        private string buildQuery()
        {            
            string s = "";

            if (txtISBN.Text.Length > 0)
                s += "&ISBN=" + txtISBN.Text.Trim();

            if (txtAuthor.Text.Length > 0)
                s += "&Author=" + txtAuthor.Text.Trim();

            if (txtPublisher.Text.Length > 0)
                s += "&Publisher=" + txtPublisher.Text.Trim();

            if (txtTitle.Text.Length > 0)
                s += "&Title=" + txtTitle.Text.Trim();

            if(!string.IsNullOrEmpty(s))
                s = s.Substring(1);

            return s;
        }       
    }
}