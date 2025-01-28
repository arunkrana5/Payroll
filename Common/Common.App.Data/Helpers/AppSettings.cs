using Common.App.Utility.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Helpers
{
    public class AppSettings
    {
        public AppSettings() { 
        }
        public static string[] DecryptQueryString(string EncrptredValue)
        {
            string[] MyMenu = null;
            string Value = "";
            try
            {
                if (!string.IsNullOrEmpty(EncrptredValue))
                {
                    Value = EncryptDecrypt1.Decrypt(EncrptredValue);
                    if (Value.Contains("*"))
                    {
                        MyMenu = Value.Split('*');
                    }
                }
            }
            catch (Exception ex)
            {
                
            }
            return MyMenu;
        }
    }
}
