using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationInsights.Extensibility.Implementation;

namespace CompEmpDir
{
    public partial class About : Page
    {

        private readonly SqlConnection connection =
            new SqlConnection("Data Source=(localdb)\\ProjectsV13;Initial Catalog=EmployeeDatabase;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void enter_OnClick(object sender, EventArgs e)
        {
            if (validatelog())
            {
                connection.Open();
            var logVal = "";
            int val = Convert.ToInt32(EmployeeID.Value);
            var query3 = "SELECT COUNT(*) FROM EmployeeMaster where EmployeeId=" + val;
            var command3 = new SqlCommand(query3, connection);
            var i = (int)command3.ExecuteScalar();
            if (i == 1)
            {
                    var command = new SqlCommand("employeeInOut", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    command.Parameters.AddWithValue("@DTREmployeeID", EmployeeID.Value);
                    command.Parameters.AddWithValue("@DTRDateTime", DateTime.Now);
                    logVal = login.Checked ? "IN" : "OUT";
                    command.Parameters.AddWithValue("@DTRType", logVal);
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            else
            {
                err.InnerText = "Employee does exist in database";
            }

        }

        private bool validatelog()
        {
            connection.Open();
            int val = Convert.ToInt32(EmployeeID.Value);
            bool vali = true;
            var query = "Select * from DTRMaster where DTREmployeeID=" + val+" ORDER BY DTRDateTime DESC";
            var command2 = new SqlCommand(query, connection);

            var logVal = login.Checked ? "IN" : "OUT";
            var reader = command2.ExecuteReader();
            if (reader.Read())
            {
                if (reader["DTRType"].ToString()==logVal)
                {
                    err.InnerText =" You can not "+ logVal+"two times";
                    vali = false;
                }
            }
            connection.Close();
            return vali;
        }


        protected void calhrs_OnClick(object sender, EventArgs e)
        {
            connection.Open();
            int val = Convert.ToInt32(empid.Value);
            var query = "Select * from DTRMaster where DTREmployeeID=" + val;
            var command2 = new SqlCommand(query, connection);
            List<DateTime> timeIn = new List<DateTime>();
            List<DateTime> timeOut = new List<DateTime>();
            var reader = command2.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
            {
               
                    if (reader["DTRType"].ToString() == "IN")
                    {
                        timeIn.Add(DateTime.Parse(reader["DTRDateTime"].ToString()));
                    }
                    else
                    {
                        timeOut.Add(DateTime.Parse(reader["DTRDateTime"].ToString()));
                    }
                }


                
            }
            TimeSpan hours=new TimeSpan();
            
            if (timeIn.Count == timeOut.Count)
            {
                var count = 1;
                for (int i = 0; i < timeIn.Count; i++)
                {
                    var a = i;
                    hours += timeOut[i] - timeIn[i];
                    //hours += DateTime.Parse(timeIn[i]) -DateTime.Parse(timeOut[i]);
                }

                hrs.InnerText = hours.ToString();
            }
            connection.Close();
        }
    }
}