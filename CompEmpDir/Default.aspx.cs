using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CompEmpDir
{
    public partial class _Default : Page
    {

        private readonly SqlConnection connection =
            new SqlConnection("Data Source=(localdb)\\ProjectsV13;Initial Catalog=EmployeeDatabase;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (validationCheck())
            {
                connection.Open();
                int val = Convert.ToInt32(empid.Value);
                var query3 = "SELECT COUNT(*) FROM EmployeeMaster where EmployeeId=" + val;
                var command3 = new SqlCommand(query3, connection);
                var i = (int)command3.ExecuteScalar();
                if (i != 1)
                {
                var command = new SqlCommand("addEmployee", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@EmployeeId", empid.Value);
                command.Parameters.AddWithValue("@EmployeeFirstName", FirstName.Value);
                command.Parameters.AddWithValue("@EmployeeLastName", LastName.Value);
                command.Parameters.AddWithValue("@EmployeeBirthDate", birthDay.Value);
                command.ExecuteNonQuery();
                connection.Close();
                }
                else
                {
                    errorSum.InnerText = " Employee Id already exist";
                }
                
            }
            Response.Redirect("Default.aspx");
        }

        private bool validationCheck()
        {
            bool validation = true;
           
            
            
            //  SELECT COUNT(*) FROM your_table;
            if ((FirstName.Value).Any(char.IsDigit)|| (LastName.Value).Any(char.IsDigit))
            {
                errorSum.InnerText = "Sorry Integers are not accepted in name values";
                validation = false;
            }
            

            
            return validation;
        }
    }
}