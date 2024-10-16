namespace AppAPI.Helpers
{
    public class Jwt
    {
        public string SecretKey { get; set; }
        public string ValidAudience { get; set; }
        public string ValidIssuer { get; set; }
        public int Expiration_Mintues {  get; set; }
    }
}
