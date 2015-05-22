using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;

namespace ProyectoETNA.Logistica
{
    public static class Rendering
    {
        public static string GetHtmlForControl(System.Web.UI.Control pControl)
        {
            using (System.IO.StringWriter lstrSw = new StringWriter())
            {
                using (Html32TextWriter lstrHtm = new Html32TextWriter(lstrSw))
                {
                    pControl.RenderControl(lstrHtm);
                    lstrHtm.Flush();
                    return lstrSw.ToString();
                }
            }
        }
        /// <summary>
        /// Metodo de extensión que renderiza un control UI.
        /// </summary>
        public static string GetHtml(this System.Web.UI.WebControls.GridView input)
        {
            using (StringWriter lstrSw = new StringWriter())
            {
                using (Html32TextWriter lstrHtm = new Html32TextWriter(lstrSw))
                {
                    input.RenderControl(lstrHtm);
                    lstrHtm.Flush();
                    return lstrSw.ToString();
                }
            }
        }

        public static string GetHtmlDdl(this System.Web.UI.WebControls.DropDownList input)
        {
            using (StringWriter lstrSw = new StringWriter())
            {
                using (Html32TextWriter lstrHtm = new Html32TextWriter(lstrSw))
                {
                    input.RenderControl(lstrHtm);
                    lstrHtm.Flush();
                    return lstrSw.ToString();
                }
            }
        }

        public static string GetHtmlTxt(this System.Web.UI.WebControls.TextBox input)
        {
            using (StringWriter lstrSw = new StringWriter())
            {
                using (Html32TextWriter lstrHtm = new Html32TextWriter(lstrSw))
                {
                    input.RenderControl(lstrHtm);
                    lstrHtm.Flush();
                    return lstrSw.ToString();
                }
            }
        }
    }
}