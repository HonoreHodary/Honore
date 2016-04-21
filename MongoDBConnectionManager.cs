using System;
using MongoDB.Bson;
using MongoDB.Driver;

using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace BooksLibrary
{
    public class MongoDBConnectionManager
    {
        public static IMongoDatabase ConnectToMongoDB()
        {
            // Get connectionString             
            var client = new MongoClient(ConfigurationManager.AppSettings["connectionString"]);     
            
            // Connect to the database    
            var _database = client.GetDatabase("book");

            return _database;
        }
        
    }
}