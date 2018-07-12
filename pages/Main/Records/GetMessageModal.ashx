<%@ WebHandler Language="C#" Class="GetMessageModal" %>

using System;
using System.Web;
using System.Text;

public class GetMessageModal : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string backString = getMessage(context);
        context.Response.Write(backString);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    private string getMessage(HttpContext context){
        DataLayer sqlOperation = new DataLayer("sqlStr");
        string messageID = context.Request.QueryString["messageID"];
        StringBuilder backString = new StringBuilder("{\"message\":[");
        string  sqlCommand = "SELECT * FROM MessageModal WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", messageID);
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);
        if (reader.Read())
        {
            backString.Append("{\"content\":\"" + reader["content"].ToString() + "\"}");
            reader.Close();
            backString.Append("]}");
            sqlOperation.Close();
            sqlOperation = null;
            return backString.ToString();

        }
        else
        {
            sqlOperation.Close();
            sqlOperation = null;
            return "{\"Equipment\":[]}";
        }
      
    }

}