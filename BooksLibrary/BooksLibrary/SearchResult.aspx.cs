using System;
using MongoDB.Bson;
using MongoDB.Driver;

using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Runtime.Remoting.Contexts;
using System.Threading.Tasks;
using System.Web.UI;
using System.Collections.Generic;

namespace BooksLibrary
{
    public partial class SearchResult : System.Web.UI.Page
    {
        public Dictionary<string, string> queryString = new Dictionary<string, string>();
        private bool noArgsSearch = new bool();
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
           
            setUpDictionary();

            if (!IsPostBack)
            {               
                searchBook();
            }                                     
        }

        public void BindGridView(DataTable table)
        {
            foreach (DataColumn col in table.Columns)
            {
                //Declare the bound field and allocate memory for the bound field.
                BoundField bfield = new BoundField();

                //Initalize the DataField value.
                bfield.DataField = col.ColumnName;

                //Initialize the HeaderText field value.
                bfield.HeaderText = col.ColumnName;

                //Add the newly created bound field to the GridView.
                GridView1.Columns.Add(bfield);
            }
            // Bind Book List to GridView
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        public DataTable ConvertToDataTable(List<Book> list)
        {
            DataTable dt = new DataTable();

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

        public async void searchBook()
        {            
            Book book = new Book();
            
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

            if(query.ElementCount > 0)
            {
                var list = await collection.Find(query).Sort(sort).ToListAsync();
                dt = ConvertToDataTable(list);               
            }
            else
            {
                var list = await collection.Find(Builders<Book>.Filter.Empty).Sort(sort).ToListAsync();
                dt = ConvertToDataTable(list);              
            }

            // Bind Book List to GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        public void setUpDictionary()
        {
            string query = "";

            if (Request.QueryString.Count == 0)
            {
                noArgsSearch = true;
            }

            else
            {
                query = Request.QueryString.ToString();

                query = query.Replace("+", " ");

                noArgsSearch = false;
            }

            if (query.Length > 0)
            {
                string[] tmp = query.Split('&');

                foreach (string s in tmp)
                {
                    if (s.Contains("=") == true)
                    {
                        string[] tmp1 = s.Split('=');
                        queryString.Add(tmp1[0], tmp1[1]);
                    }
                }
            }
        }        

        #region //------------------------------------------- Properties ----------------------------------------

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            searchBook();
        }

        protected async void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {           
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            ObjectId id = ObjectId.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string isbn = (GridView1.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string title = (GridView1.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string author = (GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string publisher = (GridView1.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            string description = (GridView1.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;            

            IMongoDatabase mdb = MongoDBConnectionManager.ConnectToMongoDB();

            var collection = mdb.GetCollection<Book>("Book");

            var builder = Builders<Book>.Filter;            

            var filter = Builders<Book>.Filter.Eq("_id", id);            

            var update = Builders<Book>.Update
               .Set("Title", title)
               .Set("Isbn", isbn)
               .Set("Author", author)
               .Set("Publisher", publisher)
               .Set("Description", description);

            var result = await collection.UpdateOneAsync(filter, update);           

            GridView1.EditIndex = -1;

            searchBook();           
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            searchBook();
        }

        protected async void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ObjectId id = ObjectId.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = GridView1.Rows[e.RowIndex];

            IMongoDatabase mdb = MongoDBConnectionManager.ConnectToMongoDB();

            var collection = mdb.GetCollection<Book>("Book");

            var builder = Builders<Book>.Filter;

            var filter = Builders<Book>.Filter.Eq("_id", id);

            var result = await collection.DeleteManyAsync(filter);

            searchBook();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            searchBook();
        }
       
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        #endregion
    }
}