using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace HallsSite
{
    public static class MessageBox
    {

        public static void Show(this Page Page, string Message)
        {
            Page.ClientScript.RegisterStartupScript(
               Page.GetType(),
               "MessageBox",
               //"<script language='javascript'>alert('" + Message + "');</script>"
               "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>" +
               "<script language = 'javascript'>" +
               "Swal.fire('" + Message + "');" +
               "</script>"
            );
        }
    }
}