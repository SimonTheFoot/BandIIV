namespace BandiIVWebApiGetter.Helpers
{
    public static class RNG
    {
        private static Random _random;
        static RNG()
        {
            _random=new Random();
        }

        public static double xs => _random.NextDouble();
        public static int x => _random.Next(1, 100);
        public static double x1 => _random.NextDouble()*.4 +.8;
        public static double x2 => _random.NextDouble() * .5 + .5;
    }
}
