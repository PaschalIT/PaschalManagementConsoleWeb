using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1 {
    static class Class1 {
        public static IEnumerable<TControl> GetChildControls<TControl> (Panel control) where TControl : Panel {
            var children = (control.Controls != null) ? control.Controls.OfType<TControl> () : Enumerable.Empty<TControl> ();
            return children.SelectMany (c => GetChildControls<TControl> (c)).Concat (children);
        }
    }
}