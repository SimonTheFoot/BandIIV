namespace BandiIVWebApiGetter.Helpers
{
    class IDisposableHelper
    {
        public static TResult Using<TResource, TResult>(Func<TResource> resourceFactory, Func<TResource, TResult> action)
            where TResource : IDisposable
        {
            using (var resource = resourceFactory()) return action(resource);
        }
    }
}
