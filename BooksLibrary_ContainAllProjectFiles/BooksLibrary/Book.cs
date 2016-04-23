using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Core;

using System.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace BooksLibrary
{
    public class Book
    {

        private ObjectId id;
        private string isbn;
        private string title;
        private string author;
        private string publisher;
        private string description;

        public void InsertBook(string isbn, string title, string publisher, string author, string description)
        {
            try
            {
                IMongoDatabase _database = MongoDBConnectionManager.ConnectToMongoDB();
                var collection = _database.GetCollection<Book>("Book");

                this.isbn = isbn;
                this.title = title;
                this.publisher = publisher;
                this.author = author;
                this.description = description;

                collection.InsertOne(this);
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        public void DeleteBook(ObjectId id)
        {
            try
            {
                IMongoDatabase _database = MongoDBConnectionManager.ConnectToMongoDB();
                var collection = _database.GetCollection<Book>("Book");

                var filter = Builders<Book>.Filter.Eq("_id", id);
                var result = collection.DeleteOne(filter);
            }

            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        public void UpdateBook(ObjectId id, string isbn, string title, string publisher, string description)
        {
            try
            {
                IMongoDatabase _database = MongoDBConnectionManager.ConnectToMongoDB();

                var collection = _database.GetCollection<Book>("Book");
                var filter = Builders<Book>.Filter.Eq("_id", id);

                var update = Builders<Book>.Update
                    .Set("Isbn", isbn)
                    .Set("Title", title)
                    .Set("Publisher", publisher)
                    .Set("Description", description);

                var result = collection.UpdateOne(filter, update);
            }
            catch(Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        public void SearchBook(GridView GridView1, Dictionary<string, string> queryString)
        {
            SearchResult searchResult = new SearchResult();
            Book book = new Book();
            DataTable dt = new DataTable();

            try
            {
                IMongoDatabase mdb = MongoDBConnectionManager.ConnectToMongoDB();

                BsonDocument query = new BsonDocument();

                if (queryString.ContainsKey("Title"))
                {
                    query.Add("Title", queryString["Title"]);
                }

                if (queryString.ContainsKey("ISBN"))
                {
                    query.Add("Isbn", queryString["ISBN"]);
                }

                if (queryString.ContainsKey("Author"))
                {
                    query.Add("Author", queryString["Author"]);
                }

                if (queryString.ContainsKey("Publisher"))
                {
                    query.Add("Publisher", queryString["Publisher"]);                   
                }

                var collection = mdb.GetCollection<Book>("Book");

                var sort = Builders<Book>.Sort.Ascending("Title");

                if (query.ElementCount > 0)
                {
                    var list = collection.Find(query).Sort(sort).ToList();
                    dt = ConvertToDataTable(list);
                }
                else
                {
                    var list = collection.Find(Builders<Book>.Filter.Empty).Sort(sort).ToList();
                    dt = ConvertToDataTable(list);
                }

                // Bind Book List to GridView
                GridView1.DataSource = dt;

                GridView1.DataBind();
            }
            catch(Exception error)
            {
                throw new Exception(error.Message);
            }

        }

        public DataTable ConvertToDataTable(List<Book> list)
        {
            DataTable dt = new DataTable();

            try
            {

                dt.Columns.Add("_id", typeof(string));
                dt.Columns.Add("Isbn", typeof(string));
                dt.Columns.Add("Title", typeof(string));
                dt.Columns.Add("Author", typeof(string));
                dt.Columns.Add("Publisher", typeof(string));
                dt.Columns.Add("Description", typeof(string));


                foreach (var item in list)
                {
                    DataRow dr = dt.NewRow();

                    dr["_id"] = item.Id.ToString();
                    dr["Isbn"] = item.Isbn;
                    dr["Title"] = item.Title;
                    dr["Author"] = item.Author;
                    dr["Publisher"] = item.Publisher;
                    dr["Description"] = item.Description;

                    dt.Rows.Add(dr);
                }

                return dt;
            }

            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        #region // ---------------------------- Properties ------------------------------------       

        public string Isbn
        {
            get
            {
                return isbn;
            }

            set
            {
                isbn = value;
            }
        }

        public string Title
        {
            get
            {
                return title;
            }

            set
            {
                title = value;
            }
        }

        public string Publisher
        {
            get
            {
                return publisher;
            }

            set
            {
                publisher = value;
            }
        }

        public string Author
        {
            get
            {
                return author;
            }

            set
            {
                author = value;
            }
        }

        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }

        public ObjectId Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        #endregion
    }
}

