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
        public Dictionary<string, string> queryString;        
        private DataTable dt;
        private Book book;
        private string hdnErrorMsg;


        protected void Page_Load(object sender, EventArgs e)
        {
            book = new Book();
            dt = new DataTable();
            queryString = new Dictionary<string, string>();

            setUpDictionary();

            if (!IsPostBack)
            {               
                book.SearchBook(GridView1, queryString);
            }                                     
        }

        public void setUpDictionary()
        {
            string query = "";

            try
            {
                if (Request.QueryString.Count > 0)
                {
                    query = Request.QueryString.ToString();

                    query = query.Replace("+", " ");
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

            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        #region //------------------------------------------- Events ----------------------------------------

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                book.SearchBook(GridView1, queryString);
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                ObjectId id = ObjectId.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

                string isbn = (GridView1.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
                string title = (GridView1.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
                string author = (GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
                string publisher = (GridView1.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
                string description = (GridView1.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
                
                book.UpdateBook(id, isbn, title, publisher, description);

                GridView1.EditIndex = -1;

                book.SearchBook(GridView1, queryString);

                if (GridView1.Rows.Count <= 1)
                {
                    Response.Redirect("default.aspx", false);
                }
            }

            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }       

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;
                book.SearchBook(GridView1, queryString);
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                ObjectId id = ObjectId.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
                GridViewRow row = GridView1.Rows[e.RowIndex];                

                book.DeleteBook(id);

                book.SearchBook(GridView1, queryString);
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = -1;
                book.SearchBook(GridView1, queryString);
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }
       
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        #endregion


        #region //------------------------------------------- Properties ----------------------------------------

        public string HdnErrorMsg
        {
            get
            {
                return hdnErrorMsg;
            }

            set
            {
                hdnErrorMsg = value;
            }
        }

        #endregion
    }
}