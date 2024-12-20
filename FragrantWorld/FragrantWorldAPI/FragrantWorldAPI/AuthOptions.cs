using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace FragrantWorldAPI
{
    public class AuthOptions
    {
        public const string Issuer = "MyServer"; 
        public const string Audience = "MyClient";
        const string KEY = "mysupersecret_secretsecretsecretkey!123"; 
        public static SymmetricSecurityKey GetSymmetricSecurityKey() =>
            new SymmetricSecurityKey(Encoding.UTF8.GetBytes(KEY));
    }
}
