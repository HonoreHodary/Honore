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
            var client = new MongoClient(ConfigurationManager.AppSettings["connectionString"]);
            var db = client.GetDatabase("book");
            var collection = db.GetCollection<Book>("Book");

            this.isbn = isbn;
            this.title = title;         
            this.publisher = publisher;
            this.author = author;
            this.description = description;            

            collection.InsertOneAsync(this);
        }

        public async void DeleteBook(ObjectId id)
        {
            var client = new MongoClient(ConfigurationManager.AppSettings["connectionString"]);
            var _database = client.GetDatabase("book");
            var collection = _database.GetCollection<Book>("Book");

            var filter = Builders<Book>.Filter.Eq("_id", "id");
            var result = await collection.DeleteManyAsync(filter);
        }

        public async void UpdateBook(string id, string isbn, string title, string publisher, string description)
        {
            var client = new MongoClient(ConfigurationManager.AppSettings["connectionString"]);
            var _database = client.GetDatabase("book");
            var collection = _database.GetCollection<Book>("Book");

            var filter = Builders<Book>.Filter.Eq("_id", id);
            var update = Builders<Book>.Update
                .Set("isbn", isbn)
                .Set("title", title)
                .Set("publisher", publisher)
                .Set("description", description);
            var result = await collection.UpdateOneAsync(filter, update);            
        }

        public async void searchBook(string isbn, string title, string publisher, string author)
        {
            Book book = new Book();
            IMongoDatabase mdb = MongoDBConnectionManager.ConnectToMongoDB();

            var collection = mdb.GetCollection<Book>("Book");

            var builder = Builders<Book>.Filter;
            var filter = Builders<Book>.Filter.Eq("Title", title);

            //var filter = Builders<Book>.Filter.Eq("isbn", isbn) & builder.Eq("title", title) &
            //builder.Eq("author", author) & builder.Eq("publisher", publisher);

            var sort = Builders<Book>.Sort.Ascending("Title");
            //var result = await collection.Find(filter).Sort(sort).ToListAsync();

            var result = await collection.Find(filter).ToListAsync();           
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

