using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System
{
    public partial class HomePage : System.Web.UI.Page
    {
        ConnectionDB connectionDB = new ConnectionDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProdCount();
            PendingCount();
            DelayCount();
        }

        public void ProdCount()
        {
            int count = 0;
            try
            {
                connectionDB.conn.Open();
                connectionDB.q = $"select * from product";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.reader = connectionDB.cmd.ExecuteReader();

                while (connectionDB.reader.Read())
                {
                    count++;
                }
            }
            catch { }
            finally
            {
                connectionDB.conn.Close();
            }
            Label7.Text = count.ToString();
        }

        public void PendingCount()
        {
            int count = 0;
            try
            {

                connectionDB.conn.Open();
                connectionDB.q = $"select * from orders where orderstatus = 'pending'";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.reader = connectionDB.cmd.ExecuteReader();
                while (connectionDB.reader.Read())
                {
                    count++;
                }
            }
            catch { }
            finally { connectionDB.conn.Close(); }
            Label8.Text = count.ToString();
        }

        public void DelayCount()
        {
            DateTime dt = DateTime.Now;
            int day = dt.Day - 6;
            int month = dt.Month;
            int year = dt.Year;
            int count = 0;
            try
            {
                Label9.Text = $"{year}/{month}/{day}";
                connectionDB.conn.Open();
                connectionDB.q = $"SELECT * FROM Orders WHERE OrderDate < '{year}/{month}/{day}' and OrderStatus = 'pending' ";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.reader = connectionDB.cmd.ExecuteReader();
                while (connectionDB.reader.Read())
                {
                    count++;
                }
            }
            catch { }
            finally { connectionDB.conn.Close(); }

            Label6.Text = count.ToString();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                Label l1 = (Label)row.FindControl("Label1");
                connectionDB.conn.Open();
                int pr = Convert.ToInt32(l1.Text);
                connectionDB.q = $"delete from Product where ProductID = {pr}";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.cmd.ExecuteNonQuery();
            }
            catch { }
            finally
            {
                connectionDB.conn.Close();
            }
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                TextBox t1 = (TextBox)row.FindControl("TextBox1");
                TextBox t2 = (TextBox)row.FindControl("TextBox2");
                TextBox t3 = (TextBox)row.FindControl("TextBox3");
                TextBox t4 = (TextBox)row.FindControl("TextBox4");

                Label l1 = (Label)row.FindControl("Label1");

                connectionDB.q = $"update Product set ProductName = '{t1.Text}', CategoryName = '{t2.Text}', price = {t3.Text}, StockQuantity = {t4.Text} where ProductID = {l1.Text}";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.cmd.ExecuteNonQuery();
                connectionDB.conn.Close();

                GridView1.EditIndex = -1;
            }

            catch { }

            finally
            {
                connectionDB.conn.Open();
            }

            GridView1.DataBind();
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }
        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView4.SelectedRow;

            Label l1 = (Label)row.FindControl("Label1");
            Label l2 = (Label)row.FindControl("Label4");

            try
            {
                connectionDB.conn.Open();

                if (l2.Text == "Pending")
                {
                    connectionDB.q = $"update orders set OrderStatus = 'Delivered' where orderid = {l1.Text}";
                    connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                    connectionDB.cmd.ExecuteNonQuery();
                }
                else
                {
                    connectionDB.q = $"update orders set OrderStatus = 'Pending' where orderid = {l1.Text}";
                    connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                    connectionDB.cmd.ExecuteNonQuery();
                }
            }
            catch { }
            finally { connectionDB.conn.Close(); }

            GridView4.EditIndex = -1;

            GridView4.DataBind();
        }

        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = Calendar1.SelectedDate;
            string dt = $"{date.Year}-{date.Month}-{date.Day - 5}";
            connectionDB.conn.Open();
            try
            {
                connectionDB.q = $"select orderid as 'Order ID', customername as 'Customer Name', OrderDate as 'Order Date' from orders where OrderStatus = 'pending' and orderdate = '{dt}'";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.adapter = new SqlDataAdapter(connectionDB.q, connectionDB.conn);
                DataTable dataTable = new DataTable();
                connectionDB.adapter.Fill(dataTable);
                GridView5.DataSource = dataTable;
                GridView5.DataBind();
            }
            catch { }
            finally { connectionDB.conn.Close(); }
        }
        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //string orderstatus = e.Row.Cells[3].Text;
                    if (e.Row.Cells[3].Text.Equals("Pending"))
                    {
                        e.Row.CssClass += "table-danger";
                    }
                    else
                    {
                        e.Row.CssClass += "table-success";
                    }
                }
            }
            catch { }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int pid = Convert.ToInt32(TextBox5.Text);
                string pname = TextBox6.Text;
                string cname = DropDownList1.SelectedItem.ToString();
                double price = Convert.ToDouble(TextBox8.Text);
                int quantity = Convert.ToInt32(TextBox7.Text);

                connectionDB.conn.Open();
                connectionDB.q = $"insert into product values ({pid}, '{pname}','{cname}', {price}, {quantity})";
                connectionDB.cmd = new SqlCommand(connectionDB.q, connectionDB.conn);
                connectionDB.cmd.ExecuteNonQuery();

                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                Label15.Text = "Inserted Successfully.";
                GridView1.DataBind();
            }
            catch { Label15.Text = "Invalid inputs."; }
            finally { connectionDB.conn.Close(); }
        }
    }
}