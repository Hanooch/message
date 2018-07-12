using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Root_Root_message : System.Web.UI.Page
{
    DataLayer sqlOperation = new DataLayer("sqlStr");
    String strCon = "server=localhost;Database=hospital;Uid=root;Password=123456";
    MySqlConnection sqlcon;
    private int deleteIndex;
    private int equipmentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginUser"] == null)
        {
            MessageBox.Message("请先登陆");
            Response.Write("<script language=javascript>window.location.replace('../Login/Login.aspx');</script>");
        }
        if (!IsPostBack)
        {
            Bind();
        }
    }

    //根据设备搜寻病人
    //protected void Button3_Click(object sender, EventArgs e)
    //{
    //    //DropDownList1.Checked = false;
    //}

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = sender as DropDownList;
        string selectedText = ddl.SelectedValue;
        Bind();
        switch (ddl.SelectedItem.Text)
        {
            case "体位固定装置":
                equipmentId = int.Parse("15");
                break;
            case "CT模拟定位机":
                equipmentId = int.Parse("17");
                break;
            case "Precise加速器":
                equipmentId = int.Parse("18");
                break;
            case "Axesse加速器":
                equipmentId = int.Parse("24");
                break;
        }
    }
    
    //全部选中患者
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= peoplemessageGridView.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)peoplemessageGridView.Rows[i].FindControl("CheckBox1");
            if (CheckBox2.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }

    //发送信息
    protected void Button2_Click(object sender, EventArgs e)
    {
        DropDownList ddl = sender as DropDownList;
        String textContent = "您好，" + ddl.SelectedItem.Text + "由于设备故障问题，需要维护，请重新预约治疗时间。给您带来的不便我们深表歉意，谢谢。";
        String userName = "flkxt";
        String pwd = "jeensDoxMOWPt+alvD";
        List<String> name = new List<String>();
        List<String> contact = new List<String>();
        for(int i = 0; i < peoplemessageGridView.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)peoplemessageGridView.Rows[i].FindControl("CheckBox1");
            if (cbox.Checked)
            {
                name.Add(this.peoplemessageGridView.Rows[i].Cells[1].Text.ToString());
                contact.Add(this.peoplemessageGridView.Rows[i].Cells[2].Text.ToString());
            }
        }
        //TextSend.ServiceCSharp text = new TextSend.ServiceCSharp();
        for(int i = 0; i < name.Count; i++)
        {
            //text.Send(contact[i], textContent, name[i], userName, pwd);
        }
    }

    //取消选中的患者
    protected void Button1_Click(object sender, EventArgs e)
    {
        CheckBox2.Checked = false;
        for (int i = 0; i <= peoplemessageGridView.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)peoplemessageGridView.Rows[i].FindControl("CheckBox1");
            cbox.Checked = false;
        }
    }

    public void Bind()
    {
        //String date = DateTime.Now.ToString("yyyy-MM-dd");
        String date = "2018-07-04";
        //int minutes = int.Parse(DateTime.Now.Hour.ToString()) * 60 + int.Parse(DateTime.Now.Minute.ToString());
        int minutes = 1430;
        equipmentId = int.Parse(DropDownList1.SelectedValue.ToString());
        //int equipmentId = 24;
        string sqlCommand = "";
        sqlcon = new MySqlConnection(strCon);
        if (equipmentId == 15 || equipmentId == 17)
        {
            sqlCommand = "select name,(contact1+0) as contact1,(contact2+0) as contact2 from patient,appointment where patient.id = appointment.patient_id and state='1' and Date ='" + date +"' and equipment_id=" + equipmentId;
        }
        else
        {
            sqlCommand = "select name,(contact1+0) as contact1,(contact2+0) as contact2 from patient,appointment_accelerate where patient.id = appointment_accelerate.patient_id and Date ='" + date + "' and equipment_id=" + equipmentId + " and begin>" + minutes;
        }


        //MySqlCommand command = new MySqlCommand("select name,(contact1+0) as contact1,(contact2+0) as contact2 from patient,appointment where patient.id = appointment.patient_id and state='1' and completed  is NULL and Date =@date and equipment_id=@equipmentId", sqlcon);
        //command.Parameters.AddWithValue("@date", date);
        //command.Parameters.AddWithValue("@equipmentId", equipmentId);
        //MySqlDataReader reader = command.ExecuteReader();
        MySqlDataAdapter myda = new MySqlDataAdapter(sqlCommand, sqlcon);
        DataSet myds = new DataSet();
        sqlcon.Open();
        myda.Fill(myds, "hospital");
        peoplemessageGridView.DataSource = myds;
        peoplemessageGridView.DataKeyNames = new string[] { "Name" };
        peoplemessageGridView.DataBind();
        sqlcon.Close();
    }

    public string GetState(object str)
    {
        int state = int.Parse(str.ToString());
        switch (state)
        {
            case 1:
                return "可使用";
            case 2:
                return "检查中";
            case 3:
                return "维修中";
        }
        return "";
    }

    public string GetTime(object str)
    {
        int time = int.Parse(str.ToString());
        int hour = time / 60;
        int minute = time - hour * 60;
        if (hour >= 24)
            hour -= 24;
        return (hour.ToString() + ":" + (minute < 10 ? "0" : "") + minute.ToString());
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int rowIndex = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        deleteIndex = rowIndex;
    }
    //protected void equipmentObjectDataSource_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    //{
    //    GridViewRow row = equipmentGridView.Rows[deleteIndex];
    //    string id = (row.FindControl("equipmentID") as HiddenField).Value;
    //    e.InputParameters["id"] = id;
    //}
    
}