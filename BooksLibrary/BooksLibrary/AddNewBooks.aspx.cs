using System;
using MongoDB.Bson;
using MongoDB.Driver;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Admin
{
    public partial class AddNewBooks : System.Web.UI.Page
    {
        Book book;

        protected void Page_Load(object sender, EventArgs e)
        {
            book = new Book();            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {                       
            book.InsertBook(txtISBN.Text, txtTitle.Text, txtPublisher.Text, txtAuthor.Text, txtDescription.Text);
            Clear();
        }

        private void Clear()
        {
            txtAuthor.Text = "";
            txtDescription.Text = "";
            txtISBN.Text = "";            
            txtPublisher.Text = "";
            txtTitle.Text = "";
        }        
    }
}