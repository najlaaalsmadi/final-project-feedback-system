using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void sendMessageButton_Click(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/file");
            string logPath = Path.Combine(folderPath, "log.txt");
            string errorLogPath = Path.Combine(folderPath, "error_log.txt");// detrmaine the files path

            try
            {
                // Validating email using Regex
                string emailPattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                if (!Regex.IsMatch(email.Text, emailPattern))
                {
                    emailError.Text = "Please enter a valid email address.";
                    emailError.Visible = true;
                    return;
                }


                string senderEmail = email.Text; // take the sender email from the user
                string recipientEmail = "ramaoudat151@gmail.com";

                // create a message
                MailMessage mail = new MailMessage(); //create a an object from mailmessage class that present in .net classes
                mail.From = new MailAddress(senderEmail);
                mail.To.Add(recipientEmail);
                mail.Subject = subject.Text;
                mail.Body = "From: " + name.Text + "\n";
                mail.Body += "Email: " + senderEmail + "\n";
                mail.Body += "Message: \n" + message.Text;


                SmtpClient smtp = new SmtpClient("smtp.gmail.com");// set the smtp server by gmail
                smtp.Port = 587; // set the smtp port
                smtp.Credentials = new NetworkCredential("ramaoudat151@gmail.com", "1234567");
                smtp.EnableSsl = true;

                // create the folder "file" if it not exiset 
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // 
                if (!File.Exists(logPath))
                {
                    File.Create(logPath).Close();
                }

                // store the sending
                File.AppendAllText(logPath, $"Sending email from {senderEmail} to {recipientEmail}\n");

                // send the email
                smtp.Send(mail);
                success.Text = "Your message has been sent!";
                success.Visible = true;

                // 
                name.Text = "";
                email.Text = "";
                subject.Text = "";
                message.Text = "";
            }
            catch (Exception ex)
            {
                success.Text = "Error sending message: " + ex.Message;
                success.Visible = true;

                // create the file to store the error
                if (!File.Exists(errorLogPath))
                {
                    File.Create(errorLogPath).Close();
                }

                // store the error
                File.AppendAllText(errorLogPath, ex.ToString() + "\n");
            }
        }
    
}
}