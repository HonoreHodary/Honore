using System;
using MongoDB.Bson;
using MongoDB.Driver;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;

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
            string title = txtTitle.Text.Trim();
            string isbn = txtISBN.Text.Trim();
            string author = txtAuthor.Text.Trim();
            string publisher = txtPublisher.Text.Trim();
            string description = txtDescription.Text.Trim();

            if (!ValidateInputs(title, isbn, author, publisher, description))
            {
                return;
            }

            List<Book> list = ValidateISBN(isbn);

            if (list.Count > 0)
            {
                labelMessage.Text = "The ISBN number already exist in the database!";
                return;
            }

            book.InsertBook(isbn, title, publisher, author, description);
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

        private bool ValidateInputs(string title, string isbn, string author, string publisher, string description)
        {
            int number = 0;
            bool result = false;
            labelMessage.Text = "";

            try
            {                
                result = Int32.TryParse(isbn, out number);

                if (string.IsNullOrEmpty(title))
                {
                    labelMessage.Text = "The title of the book is required!";
                    return false;
                }

                if (!result)
                {
                    labelMessage.Text = "Invalid ISBN number";
                    return false;
                }

                if (string.IsNullOrEmpty(author))
                {
                    labelMessage.Text = "The name of the author is required!";
                    return false;
                }

                if (string.IsNullOrEmpty(publisher))
                {
                    labelMessage.Text = "The name of the publisher is required!";
                    return false;
                }

                if (string.IsNullOrEmpty(description))
                {
                    labelMessage.Text = "The descrption of the book is required!";
                    return false;
                }
            }
            catch (FormatException error)
            {
                labelMessage.Text = error.Message;
                return false;
            }
            catch (Exception error)
            {
                labelMessage.Text = error.Message;
                return false;
            }

            return true;
        }

        public List<Book> ValidateISBN(string isbn)
        {
            Book book = new Book();

            try
            {
                IMongoDatabase mdb = MongoDBConnectionManager.ConnectToMongoDB();

                var collection = mdb.GetCollection<Book>("Book");

                var builder = Builders<Book>.Filter;
                var filter = Builders<Book>.Filter.Eq("Isbn", isbn);

                var result = collection.Find(filter).ToList();

                return result;
            }

            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        protected void inputText_TextChanged(object sender, EventArgs e)
        {
            labelMessage.Text = "";
        }
    }
}